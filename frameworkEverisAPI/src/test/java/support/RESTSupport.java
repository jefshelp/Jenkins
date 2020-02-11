package support;

import java.io.File;
import java.util.List;
import java.util.Map;

import com.jayway.restassured.RestAssured;
import com.jayway.restassured.http.ContentType;
import com.jayway.restassured.response.Response;
import com.jayway.restassured.specification.RequestSpecification;




public class RESTSupport {

	private static Response response;

	public static Response getResponse() {
		return response;
	}

	private static void setResponse(Response response) {
		RESTSupport.response = response;
	}

	private static RequestSpecification buildBaseRequestSpecification() {

		RequestSpecification rs = RestAssured.given()
				.relaxedHTTPSValidation().when().contentType(ContentType.JSON);
		
		return rs;
	}

	public static void executeGet(String endpoint, Integer statusCode) {
		response = buildBaseRequestSpecification().accept("*/*").get(endpoint).then().statusCode(statusCode).extract()
				.response();
		// printLog(response.getBody().asString(),endpoint,"");
		setResponse(response);
	}
	
	public static void executeGet(String endpoint, Map<String, Object> header) {
		response = buildBaseRequestSpecification().headers(header).accept("*/*").get(endpoint)
				
				.then().extract()
				.response();
		
		setResponse(response);
	}

	public static Response executeGet(String endpoint) {
		response = buildBaseRequestSpecification().accept("*/*").get(endpoint).then().extract().response();
		// printLog(response.getBody().asString(),endpoint,"");
		return response;
	}

	/*public static Response executePost(String endpoint, Integer statusCode, LazyMap json) {
		// System.out.println("JSON -> " + json.toString());

		response = buildBaseRequestSpecification().body(json).post(endpoint).then().statusCode(statusCode).extract()
				.response();
		// printLog(response.getBody().asString(),endpoint, json.toString());
		return response;
	}*/

	public static Response executePost(String endpoint, Map<String, Object> json) {
		// System.out.println("JSON -> " + json.toString());
		// System.out.println(endpoint);

		response = buildBaseRequestSpecification().body(json).post(endpoint).then().extract().response();
		// printLog(response.getBody().asString(),endpoint, json.toString());
		return response;
	}
	
	/*public static Response executePost(String endpoint, String json, Map<String, Object> header) {
		// System.out.println("JSON -> " + json.toString());
		// System.out.println(endpoint);
		RequestSpecification rs = RestAssured.given()
				.relaxedHTTPSValidation().proxy("proxy.santanderbr.corp", 80).when().contentType(ContentType.XML);
		response = rs.body(json).headers(header).post(endpoint).then().extract().response();
		// printLog(response.getBody().asString(),endpoint, json.toString());
		return response;
	}*/

	public static Response executePost(String endpoint, Map<String, Object> json, Map<String, Object> header) {
		// System.out.println("JSON -> " + json.toString());
		// System.out.println(endpoint);

		response = buildBaseRequestSpecification().body(json).headers(header).post(endpoint).then().extract()
				.response();

		// printLog(response.getBody().asString(),endpoint, json.toString());
		return response;
	}
	
	public static Response executePost(String endpoint, String json, Map<String, Object> header) {
		

		response = buildBaseRequestSpecification().body(json).headers(header).post(endpoint).then().extract()
				.response();

		// printLog(response.getBody().asString(),endpoint, json.toString());
		return response;
	}
	
	public static Response executePostNoBody(String endpoint, Map<String, Object> header) {
		// System.out.println("JSON -> " + json.toString());
		// System.out.println(endpoint);

		response = buildBaseRequestSpecification().headers(header).post(endpoint).then().extract()
				.response();

		// printLog(response.getBody().asString(),endpoint, json.toString());
		return response;
	}

	/*public static Response executePut(String endpoint, LazyMap json) {
		// System.out.println("JSON -> " + json.toString());

		response = buildBaseRequestSpecification().body(json).put(endpoint).then().extract().response();
		// printLog(response.getBody().asString(),endpoint, json.toString());
		return response;
	}*/
	
	public static Response executePutAlm(String endpoint, Map<String, Object> json,Map<String, Object> header, Map<String, String> cookies) {
		 
		response = buildBaseRequestSpecification().body(json)
				.headers(header)
				.cookies(cookies)
				.put(endpoint).then().extract().response();
		
		return response;
	}
	
	public static Response executePostAlm(String endpoint, Map<String, Object> json,Map<String, Object> header, Map<String, String> cookies) {
		response = RestAssured.given()
				.relaxedHTTPSValidation().proxy("proxy.santanderbr.corp", 80).when().contentType(ContentType.JSON)
				.headers(header)
				.cookies(cookies)
				.post(endpoint).then().extract().response();
		 
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

	public static Response executeDelete(String endpoint) {

		response = buildBaseRequestSpecification().delete(endpoint).then().extract().response();
		// printLog(response.getBody().asString(),endpoint, "");
		return response;
	}

	public static Response executeOptions(String endpoint) {
		response = buildBaseRequestSpecification().options(endpoint).then().extract().response();
		// printLog(response.getBody().asString(),endpoint,"");
		return response;
	}

  /*	public static Response executePatch(String endpoint, LazyMap json) {
		// System.out.println("JSON -> " + json.toString());

		response = buildBaseRequestSpecification().body(json).patch(endpoint).then().extract().response();
		// printLog(response.getBody().asString(),endpoint, json.toString());
		return response;
	}*/

	private static void printLog(String response, String url, String json) {
		System.out.println("");
		System.out.println("====================================");
		System.out.println("");
		System.out.println("Endpoint => " + url);
		System.out.println("");
		System.out.println("Body - Request => " + json);
		System.out.println("");
		System.out.println("Response => " + response);
	}

	public static Integer getResponseCode() {
		return response.getStatusCode();
	}

	public static Object key(String field) {
		// System.out.println(response.getBody().jsonPath().toString());

		return response.getBody().jsonPath().get(field);

	}

	public static Object key(String objeto, String campo) {

		return RESTSupport.getResponse().body().jsonPath().getMap(objeto).get(campo).toString();
	}

	public static Object key(String field, int indice) {
		List<Object> listRetorno = response.getBody().jsonPath().get(field);
		return listRetorno.get(indice);
	}
}
