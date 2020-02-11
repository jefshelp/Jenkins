package support;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.commons.codec.binary.Base64;

import com.jayway.restassured.RestAssured;
import com.jayway.restassured.http.ContentType;
import com.jayway.restassured.response.Response;
import com.jayway.restassured.specification.RequestSpecification;

public class ALMSuporte {

	private static Map<String, String> cookies = new HashMap<String, String>();
	private static List<Map<String, Object>> listMapFields = new ArrayList<Map<String, Object>>();
	private static String urlAlm = "";
	private static String endPoint = "";
	private static Response response;
	private static String urlProxy;
	private static int portProxy;
	public static boolean executaALM;
	
	

	public static boolean isExecutaALM() {
		return executaALM;
	}

	public static void setExecutaALM(boolean executaALM) {
		ALMSuporte.executaALM = executaALM;
	}

	public static int getPortProxy() {
		return portProxy;
	}

	public static void setPortProxy(int portProxy) {
		ALMSuporte.portProxy = portProxy;
	}

	public static String getUrlProxy() {
		return urlProxy;
	}

	public static void setUrlProxy(String urlProxy) {
		ALMSuporte.urlProxy = urlProxy;
	}

	public static Response getResponse() {
		return response;
	}

	public static void setResponse(Response response) {
		ALMSuporte.response = response;
	}
	
	private static RequestSpecification buildBaseRequestSpecification() {
		RequestSpecification rs;
		if (getUrlProxy() == null) {
			rs = RestAssured.given()
					.when().contentType(ContentType.JSON);
		}else{
			rs = RestAssured.given()
					.relaxedHTTPSValidation().proxy(getUrlProxy(), getPortProxy()).when().contentType(ContentType.JSON);
		}
		
		
		return rs;
	}

	public static void conectALM(String usuario, String senha) throws Throwable {
		String _authString = usuario + ":" + senha;
		String _authStringEnc = new String(Base64.encodeBase64(_authString.getBytes()));

		HashMap<String, Object> header = new HashMap<String, Object>();
		
		header.put("Authorization", "Basic  " + _authStringEnc);

		executePostNoBody(getUrlAlm()+"api/authentication/sign-in", header);
		setCookies(getResponse().getCookies());

	}
	
	public static Response executePostNoBody(String endpoint, Map<String, Object> header) {
		response = buildBaseRequestSpecification().headers(header).post(endpoint).then().extract()
				.response();
		return response;
	}
	
	public static Response executePutAlm(String endpoint, Map<String, Object> json,Map<String, Object> header, Map<String, String> cookies) {
		 
		response = buildBaseRequestSpecification().body(json)
				.headers(header)
				.cookies(cookies)
				.put(endpoint).then().extract().response();
		
		return response;
	}
	
	public static Response executeGetAlm(String endpoint, Map<String, Object> header, Map<String, String> cookies, String parameters){
		response = buildBaseRequestSpecification()
				.headers(header)
				.cookies(cookies)
				.parameter("query", parameters)
				.parameter("fields", "id")
				.get(endpoint).then().extract().response();
		 
		return response;
	}
	
	public static Response executePostAlmFile(String endpoint, Map<String, Object> header, Map<String, String> cookies, File file) {
		 
		response = buildBaseRequestSpecification()
				.body(file)
				.headers(header)
				.cookies(cookies)
				.post(endpoint).then().extract().response();
		 
		return response;
	}

	public static void executeRun(int idTestInstance, String status) {
		Map<String, Object> json = new HashMap<String, Object>();
		Map<String, Object> header = new HashMap<String, Object>();
		header.put("Content-Type", "application/json");
		header.put("Accept", "application/json");
		Map<String, Object> field = new HashMap<String, Object>();
		Map<String, Object> value = new HashMap<String, Object>();
		List<Map<String, Object>> listFields = new ArrayList<Map<String, Object>>();

		value.put("value", status);
		field.put("Values", value);
		field.put("Name", "status");

			    
	    LinkedHashMap<String, Object> orderedMap = field.entrySet().stream() //
	            .sorted(Map.Entry.comparingByKey()).collect(Collectors.toMap(Map.Entry::getKey, //
	                    Map.Entry::getValue, (key, content) -> content, LinkedHashMap::new)); //

	    
	
		
		
		listFields.add(orderedMap);
		json.put("Fields", listFields);

		executePutAlm(
				getEndPoint()+"test-instances/"
						+ idTestInstance,
				json, header, getCookies());
	}
	
	public static Map<String, Object> getMapField(String campo, Object valor){
		Map<String, Object> field = new HashMap<String, Object>();
		List<Map<String, Object>> listValues = new ArrayList<Map<String, Object>>();
		Map<String, Object> values = new HashMap<String, Object>();
		values.put("value", valor);
		listValues.add(values);
		field.put("Name", campo);
		field.put("Values", listValues);
		
		LinkedHashMap<String, Object> orderedMap = field.entrySet().stream() //
	            .sorted(Map.Entry.comparingByKey()).collect(Collectors.toMap(Map.Entry::getKey, //
	                    Map.Entry::getValue, (key, content) -> content, LinkedHashMap::new)); //

	    
		
		
		return orderedMap;
	}
	
	public static void setListMapFields(String status, String name, String testId, String testcyleId, String owner){
		listMapFields = new ArrayList<Map<String, Object>>();
		listMapFields.add(getMapField("status", status));
		listMapFields.add(getMapField("test-id", testId));
		listMapFields.add(getMapField("name", name));
		
		listMapFields.add(getMapField("testcycl-id", testcyleId));
		listMapFields.add(getMapField("owner", owner));
		listMapFields.add(getMapField("subtype-id", "hp.qc.run.EXTERNAL-TEST"));
	}
	public static void setListMapFields(String status){
		listMapFields = new ArrayList<Map<String, Object>>();
		listMapFields.add(getMapField("status", status));
		listMapFields.add(getMapField("execution-date", getDataAtual()));
		
		listMapFields.add(getMapField("subtype-id", "hp.qc.run.EXTERNAL-TEST"));
	}
	
	public static List<Map<String, Object>> getListMapFields(){
		return listMapFields;
	}
	
	public static String getDataAtual() {        
	    SimpleDateFormat sd = new SimpleDateFormat("yyy-MM-dd");
	    Date dataAtual = new Date(System.currentTimeMillis());
	    String data = sd.format(dataAtual);        
	    return data;
	}
	
	
	public static String executeRun(String status, String name, String testId, String testcyleId, String owner) {
		setListMapFields(status, name, testId, testcyleId, owner);
		Map<String, Object> json = new HashMap<String, Object>();
		Map<String, Object> header = new HashMap<String, Object>();
		header.put("Content-Type", "application/json");
		header.put("Accept", "application/json");
		json.put("Fields", getListMapFields());

		executePostAlm(
				getEndPoint()+"runs/",
				json, header, getCookies());
		List<Map<String, Object>> listFields = getResponse().getBody().jsonPath().getList("Fields");

		for (Map<String, Object> map : listFields) {
			
			if (map.get("Name").equals("id")) {
				List<HashMap<String, Object>> values = (List<HashMap<String, Object>>) map.get("values");
				return values.get(0).get("value").toString();
				
			}
		}
		return null;
	}
	
	public static Response executePostAlm(String endpoint, Map<String, Object> json,Map<String, Object> header, Map<String, String> cookies) {
		response = buildBaseRequestSpecification().body(json)
				.headers(header)
				.cookies(cookies)
				
				.post(endpoint).then().extract().response();
		 
		return response;
	}
	
	public static String executePutRun(String runId, String status) {
		setListMapFields(status);
		Map<String, Object> json = new HashMap<String, Object>();
		Map<String, Object> header = new HashMap<String, Object>();
		header.put("Content-Type", "application/json");
		header.put("Accept", "application/json");
		json.put("Fields", getListMapFields());

		executePutAlm(
				getEndPoint()+"runs/"+runId,
				json, header, getCookies());
		
		return null;
	}
	
	public static String getIdRun(String testId, String testcyleId){
		String id = "";
		Map<String, Object> header = new HashMap<String, Object>();
		header.put("Content-Type", "application/json");
		header.put("Accept", "application/json");
		
		executeGetAlm(getEndPoint()+"runs", header, getCookies(), "{test-id["+testId+"];testcycl-id["+testcyleId+"]}");
		//System.out.println(getResponse().getBody().asString());
		try {
			id = getResponse().getBody().jsonPath().get("entities[0].Fields[0].values[0].value");
		} catch (Exception e) {
			id = null;
		}
		
		
		return id;
	}
	
	public static void addAttachmentToRun(String runId, String filePath, String nomeArquivo){
		File file = new File(filePath);
		
		Map<String, Object> header = new HashMap<String, Object>();
		header.put("Content-Type", "application/octet-stream");
		header.put("Accept", "application/json");
		header.put("Slug", nomeArquivo);
		
		executePostAlmFile(getEndPoint()+"runs/"+runId+"/attachments", header, cookies, file);
		
	}

	public static Map<String, String> getCookies() {
		return cookies;
	}

	public static void setCookies(Map<String, String> cookies) {
		ALMSuporte.cookies = cookies;
	}

	public static String getEndPoint() {
		return endPoint;
	}

	public static void setEndPoint(String domain, String project) {
		ALMSuporte.endPoint = getUrlAlm()+"rest/domains/"+domain+"/projects/"+project+"/";
	}

	public static String getUrlAlm() {
		return urlAlm;
	}

	public static void setUrlAlm(String urlAlm) {
		ALMSuporte.urlAlm = urlAlm;
	}

	
}
