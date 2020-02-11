package support;


import java.io.FileReader;
import java.math.BigInteger;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.UUID;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import steps.SuporteSteps;



public class JsonSuporte {
	public static Map<String, Object> json = new TreeMap<>();
	public static Map<String, Object> cabecalho = new TreeMap<>();
	public static JSONObject bibliotecaDados;
	
	public static Map<String, Object> documents = new TreeMap<>();
	public static Map<String, Object> documents_dois = new TreeMap<>();
	
	
	
	public static void LimpaMaps(){
		json = new TreeMap<>();
		cabecalho = new TreeMap<>();
		
		
		
	}

	public static void LimpaJson() {
		json.clear();
	}

	public static void LimpaHeader() {
		cabecalho.clear();
	}

	
	public void adicionaCampoCorrigido(Map<String, Object> campoJson, String key, String value, String tipo) {
		if (value.contains("[dataFormatada]")) {
			Calendar c = Calendar.getInstance();
			String dia = String.valueOf(c.get(Calendar.DAY_OF_MONTH));
			if (dia.length() == 1) {
				dia = "0"+dia;
			}
			String mes = String.valueOf(c.get(Calendar.MONTH)+1);
			if (mes.length() == 1) {
				mes = "0"+mes;
			}
			String dataAtual = c.get(Calendar.YEAR) +"-"+ mes+"-"+dia;
			value = value.replace("[dataFormatada]", dataAtual);
		}
		if (value.contains("[data]")) {
			Calendar c = Calendar.getInstance();
			String dataAtual = c.get(Calendar.DAY_OF_MONTH) + "" + c.get(Calendar.MONTH) + "" + c.get(Calendar.YEAR)
					+ "" + c.get(Calendar.HOUR) + "" + c.get(Calendar.MINUTE) + "" + c.get(Calendar.SECOND)+""+c.get(Calendar.MILLISECOND);
			value = value.replace("[data]", dataAtual);
		}
		if (value.contains("[GUID]")) {
			UUID uuid = UUID.nameUUIDFromBytes(value.replace("[GUID]", "").getBytes());
			value = String.valueOf(uuid);
		}
		Object object = SuporteSteps.getValueTipo(value, tipo);

		if (object != null || (object == null && !tipo.equals(""))) {
			campoJson.put(key, object);
		} else if (object == null && tipo.equals("")) {
			campoJson.remove(key);
		}
	}
	
	public static void importarJson() throws Throwable {
		
		JSONParser jsonParser = new JSONParser();
		FileReader reader = new FileReader("lib/dadoscadastrais.json");
		Object obj = jsonParser.parse(reader);
		String stringJson = obj.toString();
		
		JSONParser parser = new JSONParser();
		bibliotecaDados = (JSONObject) parser.parse(stringJson);
		
		

		
	}
	
	public static Object getValueTipo(String value, String tipo){
		tipo = tipo.toLowerCase();
		Object object;
		switch (tipo) {
		case "inteiro":
			try {
				object = Integer.parseInt(value);
			} catch (Exception e) {
				object = Long.parseLong(value);
				
			}
			
			break;
		case "booleano":
			object = Boolean.parseBoolean(value);
			break;
		case "decimal":
			object = Float.parseFloat(value);
			break;
		default:
			object = value;
			if (object.equals("null")) {
				object = null;
			}
			
			break;
		}
		
		return object;
	}
	
	public void adicionaJson(Map<String, Object> jsonPai,Map<String, Object> dados, String key, String tipo) {

		switch (tipo) {
		case "json":
			jsonPai.put(key, dados);
			break;
		case "":
			jsonPai.put(key, "");
			break;
		case "null":
			jsonPai.put(key, null);
			break;
		case "vazio":
			jsonPai.remove(key);
			break;
		case "texto":
			jsonPai.put(key, "teste");
			break;
		case "inteiro":
			jsonPai.put(key, 123);
			break;
		case "decimal":
			jsonPai.put(key, Float.parseFloat("123"));
			break;
		case "objeto_vazio":
			dados = new TreeMap<>();
			jsonPai.put(key, dados);
			break;

		default:
			break;
		}
	}
	
	public void adicionaListaNoJsonPai(Map<String, Object> jsonPai, List<Map<String, Object>> listDados, String key, String tipo) {

		switch (tipo) {
		case "lista":
			jsonPai.put(key, listDados);
			break;
		case "":
			jsonPai.put(key, "");
			break;
		case "null":
			jsonPai.put(key, null);
			break;
		case "vazio":
			jsonPai.remove(key);
			break;
		case "texto":
			jsonPai.put(key, "teste");
			break;
		case "inteiro":
			jsonPai.put(key, 123);
			break;
		case "decimal":
			jsonPai.put(key, Float.parseFloat("123"));
			break;
		case "lista_objeto_vazio":
			Map<String, Object> mapDados = new TreeMap<>();
			listDados.clear();
			listDados.add(mapDados);
			jsonPai.put(key, listDados);
			break;
		case "lista vazia":
			listDados.clear();
			jsonPai.put(key, listDados);
			break;
		case "objeto vazio":
			Map<String, Object> map = new TreeMap<>();
			
			jsonPai.put(key, map);
		default:
			break;
		}
	}
	
	
}
