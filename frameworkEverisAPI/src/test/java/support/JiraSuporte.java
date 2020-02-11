package support;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.codec.binary.Base64;

import com.jayway.restassured.RestAssured;
import com.jayway.restassured.http.ContentType;
import com.jayway.restassured.response.Response;
import com.jayway.restassured.specification.RequestSpecification;

public class JiraSuporte {
	
	private static List<Map<String, Object>> listMapFields = new ArrayList<Map<String, Object>>();
	private static String urlJira = "";
	
	private static Response response;
	private static String urlProxy;
	private static int portProxy;
	private static HashMap<String, Object> header = new HashMap<>();
	private static String authorization;
	
	
	
	public static String getAuthorization() {
		return authorization;
	}


	public static void setAuthorization(String usuario, String senha) {
		String _authString = usuario + ":" + senha;
		JiraSuporte.authorization = "Basic  " + new String(Base64.encodeBase64(_authString.getBytes()));
	}


	public static HashMap<String, Object> getHeader() {
		return header;
	}


	public static void addHeader(String key, Object value) {
		header.put(key, value);
	}
	
	public static void limpaHeader(){
		header = new HashMap<String, Object>();
	}


	public static String getUrlJira() {
		return urlJira;
	}


	public static void setUrlJira(String urlJira) {
		JiraSuporte.urlJira = urlJira;
	}


	


	public static Response getResponse() {
		return response;
	}


	public static void setResponse(Response response) {
		JiraSuporte.response = response;
	}


	public static String getUrlProxy() {
		return urlProxy;
	}


	public static void setUrlProxy(String urlProxy) {
		JiraSuporte.urlProxy = urlProxy;
	}


	public static int getPortProxy() {
		return portProxy;
	}


	public static void setPortProxy(int portProxy) {
		JiraSuporte.portProxy = portProxy;
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
	
	public static Response executePost(HashMap<String, Object> json, String endpoint){
		if (getHeader() == null) {
			response = buildBaseRequestSpecification().body(json)
					.post(endpoint).then().extract().response();
		}else{
			response = buildBaseRequestSpecification().body(json)
					.headers(getHeader())
					.post(endpoint).then().extract().response();
		}
		
		
		return response;
	}
	
	public static Response executePut(HashMap<String, Object> json, String endpoint){
		if (getHeader() == null) {
			response = buildBaseRequestSpecification().body(json)
					.put(endpoint).then().extract().response();
		}else{
			response = buildBaseRequestSpecification().body(json)
					.headers(getHeader())
					.put(endpoint).then().extract().response();
		}
		
		return response;
	}
	
	public static Response executePostJiraFile(String endpoint, Map<String, Object> header, File file) {
		 
		response = buildBaseRequestSpecification()
				.body(file)
				.headers(getHeader())
				
				.post(endpoint).then().extract().response();
		 
		return response;
	}
	
	public static void addAttachmentToRun(String endpoint, String runId, String filePath, String nomeArquivo){
		File file = new File(filePath);
		limpaHeader();
		addHeader("Content-Type", "application/octet-stream");
		addHeader("Accept", "application/json");
		addHeader("Slug", nomeArquivo);
		
		executePostJiraFile(endpoint+"runs/"+runId+"/attachments", header, file);
		
		
	}
	
	
}
