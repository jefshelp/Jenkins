package steps;

import static org.junit.Assert.assertThat;

import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.fasterxml.jackson.databind.ObjectMapper;

import cucumber.api.java.pt.Dado;
import cucumber.api.java.pt.Entao;
import cucumber.api.java.pt.Quando;
import support.ALMSuporte;
import support.JsonSuporte;
import support.RESTSupport;
import support.WordSuporte;

import org.hamcrest.Matcher;
import org.hamcrest.Matchers;

public class SuporteSteps extends JsonSuporte{

	
	static String endpoint = new String();
	static String url = new String();
	String suporteCenario = "";
	static boolean erroEcontrado = false;
	static String errosEncontrados = "";
	Map<String, Object> jsonKibana = new TreeMap<>();
	public static String autenticate = "Basic eDIyNTczMjpARmljYTEyMjExOA==";
	public static boolean kibana = false;
	public static boolean executaBalde = false;
	public static boolean executaEvidencia = false;
	public static int qtExecucao = 0;
	

	public static int getQtExecucao() {
		return qtExecucao;
	}

	public static void addQtExecucao() {
		SuporteSteps.qtExecucao = SuporteSteps.qtExecucao+1;
	}

	public static boolean isExecutaEvidencia() {
		return executaEvidencia;
	}

	public static void setExecutaEvidencia(boolean executaEvidencia) {
		SuporteSteps.executaEvidencia = executaEvidencia;
	}

	public static boolean isExecutaBalde() {
		return executaBalde;
	}

	public static void setExecutaBalde(boolean executaBalde) {
		SuporteSteps.executaBalde = executaBalde;
	}

	public static String getUrl() {
		return url;
	}

	public static void setUrl(String url) {
		SuporteSteps.url = url;
	}

	public static String getEndpoint() {
		return endpoint;
	}

	public static void setEndpoint(String _endpoint) {
		endpoint = _endpoint;
	}

	public static boolean isKibana() {
		return kibana;
	}

	public static void setKibana(boolean kibana) {
		SuporteSteps.kibana = kibana;
	}

	@Dado("^inicio o cenario \"([^\"]*)\" do projeto \"([^\"]*)\" e parceiro \"([^\"]*)\"$")
	public void inicioOCenarioDoProjetoEParceiro(String tituloCenario, String projeto, String parceiro)
			throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		erroEcontrado = false;
		errosEncontrados = "";
		suporteCenario = tituloCenario;
		WordSuporte.adicionaTituloCenario(tituloCenario.replace("(", "").replace(")", ""), projeto, parceiro);
	}

	@Quando("^inicio a execucao do passo \"([^\"]*)\"$")
	public void inicioAExecucaoDoPasso(String tituloPasso) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		if (!tituloPasso.toLowerCase().contains("kibana")
				|| (tituloPasso.toLowerCase().contains("kibana") && SuporteSteps.isKibana())) {
			WordSuporte.adicionaTituloPassoExecutado("");
			WordSuporte.adicionaTituloPassoExecutado(WordSuporte.getNumPassoAtual()+". "+tituloPasso);
			WordSuporte.setNumPassoAtual(WordSuporte.getNumPassoAtual()+1);
		}

	}

@Dado("^que adiciono o endpoint \"([^\"]*)\"$")
	public void que_adiciono_o_endpoint(String endpoint) throws Throwable {
		json = new HashMap<String, Object>();
		cabecalho = new HashMap<String, Object>();
		WordSuporte.setNumPassoAtual(1);
		
		
		setEndpoint(getUrl()+endpoint);
		
		addQtExecucao();
		if (getQtExecucao() % 10 == 0) {
			System.out.println("Foram Executados: "+getQtExecucao()+" testes");
		}
		

}

	@Dado("^que guardo o json com a biblioteca de codigo$")
	public void queGuardoOJsonComABibliotecaDeCodigo() throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		JsonSuporte.importarJson();
	}

@Quando("^coloco em destaque os campos \"([^\"]*)\"$")
	public void colocoEmDestaqueOsCampos(String campos) throws Throwable {
		List<String> listCampos = Arrays.asList(campos.split(","));
		// System.err.println(listCampos);
		WordSuporte.constroiJson(json, listCampos);
	}
	
	

   @Entao("^realizo um get e recebo o objeto json e destaco os campos recebidos \"([^\"]*)\"$")
	public void realizoUmGetEReceboOObjetoJsonEDestacoOsCamposRecebidos(String campos) throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
		RESTSupport.executeGet(endpoint, cabecalho);
		List<String> listCampos = Arrays.asList(campos.split(","));
		String stringJson = RESTSupport.getResponse().getBody().asString();
		WordSuporte.constroiJson(stringJson, listCampos);
	}


	@Entao("^recebo o objeto json e destaco os campos recebidos \"([^\"]*)\"$")
	public void receboOObjetoJsonEDestacoOsCamposRecebidos(String campos) throws Throwable {
		

		RESTSupport.executePost(endpoint, json, cabecalho);
		List<String> listCampos = Arrays.asList(campos.split(","));
		String stringJson = RESTSupport.getResponse().getBody().asString();
		WordSuporte.constroiJson(stringJson, listCampos);

	}

	@Entao("^recebo o objeto jsonKibana do endpoint \"([^\"]*)\" e destaco os campos recebidos \"([^\"]*)\"$")
	public void receboOObjetoJsonKibanaDoEndpointEDestacoOsCamposRecebidos(String _endpoint, String campos)
			throws Throwable {
		this.getKibanaByProposta(_endpoint, "propostaID", campos);
	}

	@Entao("^recebo o objeto jsonKibana do endpoint \"([^\"]*)\" com o campo \"([^\"]*)\" e destaco os campos recebidos \"([^\"]*)\"$")
	public void receboOObjetoJsonKibanaDoEndpointComOCampoEDestacoOsCamposRecebidos(String _endpoint, String key,
			String campos) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		this.getKibanaByProposta(_endpoint, key, campos);
	}

	public void getKibanaByProposta(String _endpoint, String key, String campos) {
		if (SuporteSteps.isKibana()) {
			cabecalho.put("Authorization", autenticate);
			Map<String, Object> listJson = json;
			String propostaId = "";

			if (key.contains("#")) {
				String[] valores = key.split("#");
				for (String valor : valores) {

					if (listJson.get(valor).getClass().toString().equals("class java.util.HashMap")) {
						listJson = (Map<String, Object>) listJson.get(valor);
					} else {
						propostaId = listJson.get(valor).toString();
					}

				}
			} else {
				propostaId = json.get(key).toString();
			}

			String jsonString = "{\"query\":{\"bool\":{\"must\":[{\"query_string\":{\"query\":\"" + propostaId
					+ "\"}}]}}}";

			aguardaRetornoKibana(_endpoint, jsonString, cabecalho);
			
			List<String> listCampos = Arrays.asList(campos.split(","));
			String stringJson = RESTSupport.getResponse().getBody().asString().replace("\\n", "").replace("\\", "");
			WordSuporte.constroiJson(stringJson, listCampos);
		}
	}
	
	public static void aguardaRetornoKibana(String _endpoint, String jsonString, Map<String, Object> cabecalho){
		RESTSupport.executePost(_endpoint, jsonString, cabecalho);
		for (int i = 0; i < 7; i++) {
			if (RESTSupport.key("hits.total").toString().equals("0")) {
				Thread.currentThread();
				try {
					Thread.sleep(5000);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				RESTSupport.executePost(_endpoint, jsonString, cabecalho);
			} else {
				break;
			}
		}
	}

	@Entao("^valido que no campo \"([^\"]*)\" recebo o valor \"([^\"]*)\" do objeto jsonKibana$")
	public void validoQueNoCampoReceboOValorDoObjetoJsonKibana(String key, String value) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		if (SuporteSteps.isKibana()) {
			value = value.replace("<", "(").replace(">", ")");

			try {
				if (value.equals("null")) {
					if (RESTSupport.key(key) != null) {
						errosEncontrados += WordSuporte.addErroJunit(key, value, RESTSupport.key(key).toString(),
								erroEcontrado);
						erroEcontrado = true;
					}
				} else {
					if (RESTSupport.key(key) == null) {
						errosEncontrados += WordSuporte.addErroJunit(key, value, "null", erroEcontrado);
						erroEcontrado = true;
					} else if (!value.equals(RESTSupport.key(key).toString().trim())) {
						errosEncontrados += WordSuporte.addErroJunit(key, value, RESTSupport.key(key).toString(),
								erroEcontrado);
						erroEcontrado = true;
					}
				}
			} catch (Exception e) {
				errosEncontrados += RESTSupport.getResponse().getBody().asString();
				WordSuporte.addErroCampoNaoEncontrado(key, RESTSupport.getResponse().getBody().asString());
				erroEcontrado = true;
			}
		}

	}

	@Entao("^guardo os campos \"([^\"]*)\" na planilha com o status \"([^\"]*)\" esperado$")
	public void guardoOsCamposNaPlanilhaComOStatusEsperado(String campos, String status) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		String[] keys = campos.split(",");
		String dados = "";
		for (String key : keys) {
			System.out.println(RESTSupport.getResponse().getBody().asString());

			// List<Object> listHits =
			// RESTSupport.getResponse().getBody().jsonPath().getList("hits.hits");
			List<HashMap<String, Object>> listHit = RESTSupport.getResponse().body().jsonPath().getList("hits.hits");
			for (Map<String, Object> hashMap : listHit) {
				System.out.println(hashMap.toString().replace("\"", "").replace(":", "=").replace("_", ""));
				hashMap = new ObjectMapper().readValue(hashMap.toString().replace("\"", "").replace(":", "=").replace("_", ""), Map.class);
				
				String[] listCampos = key.split("#");

				String[] valores = key.split("#");
				for (String valor : valores) {
					System.out.println(valor);
					String classe = hashMap.get(valor).getClass().toString();
					if (valor.equals("entradaDicionario")) {
						hashMap = new ObjectMapper().readValue(hashMap.get(valor).toString(), Map.class);
						
					}else if (valor.equals("clientKey")) {
						hashMap = new ObjectMapper().readValue(hashMap.get(valor).toString(), Map.class);
						
					}else if (classe.equals("class java.util.HashMap")) {
						hashMap = (Map<String, Object>) hashMap.get(valor);
					} else {
						String resultado = hashMap.get(valor).toString();
						System.out.println(resultado);
					}

				}

			}
			System.out.println(listHit.toString());
		}
		dados += "|" + status + "|";
		System.out.println(dados);
	}
     @Entao("^valido que a lista possui tantos itens \"([^\"]*)\"$")
      		 public void validoQueaListaPossuiTantosCampos(String key, String value) throws Throwable {
				assertThat(value, Matchers.hasSize(10));			
				try {
					if (value.equals("null")) {
						if (RESTSupport.key(key) != null) {
							errosEncontrados += WordSuporte.addErroJunit(key, value, RESTSupport.key(key).toString(),
									erroEcontrado);
							erroEcontrado = true;
						}
					} else {
						if (RESTSupport.key(key) == null) {
							errosEncontrados += WordSuporte.addErroJunit(key, value, "null", erroEcontrado);
							erroEcontrado = true;
						} else if (!value.equals(RESTSupport.key(key).toString().trim())) {
							errosEncontrados += WordSuporte.addErroJunit(key, value, RESTSupport.key(key).toString().trim(),
									erroEcontrado);
							erroEcontrado = true;
						}
					}
				} catch (Exception e) {
					String saida = RESTSupport.getResponse().asString();
					errosEncontrados += RESTSupport.getResponse().getBody().asString();
					WordSuporte.addErroCampoNaoEncontrado(key, RESTSupport.getResponse().getBody().asString());
					erroEcontrado = true;
				}
      }
				
	private void assertThat(String value, Matcher<Collection<? extends Object>> hasSize) {
		// TODO Auto-generated method stub
		
	}

	@Entao("^valido que no campo \"([^\"]*)\" recebo o valor \"([^\"]*)\"$")
	public void validoQueNoCampoReceboOValor(String key, String value) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		value = value.trim();
		value = value.replace("<", "(").replace(">", ")");
		

		try {
			if (value.equals("null")) {
				if (RESTSupport.key(key) != null) {
					errosEncontrados += WordSuporte.addErroJunit(key, value, RESTSupport.key(key).toString(),
							erroEcontrado);
					erroEcontrado = true;
				}
			} else {
				if (RESTSupport.key(key) == null) {
					errosEncontrados += WordSuporte.addErroJunit(key, value, "null", erroEcontrado);
					erroEcontrado = true;
				} else if (!value.equals(RESTSupport.key(key).toString().trim())) {
					errosEncontrados += WordSuporte.addErroJunit(key, value, RESTSupport.key(key).toString().trim(),
							erroEcontrado);
					erroEcontrado = true;
				}
			}
		} catch (Exception e) {
			String saida = RESTSupport.getResponse().asString();
			errosEncontrados += RESTSupport.getResponse().getBody().asString();
			WordSuporte.addErroCampoNaoEncontrado(key, RESTSupport.getResponse().getBody().asString());
			erroEcontrado = true;
		}

		// System.out.println(RESTSupport.key(key));
	}

	@Entao("^valido que no campo \"([^\"]*)\" recebo o valor \"([^\"]*)\" da indice (\\d+) do array$")
	public void validoQueNoCampoReceboOValorDaIndiceDoArray(String key, String value, int indice) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		if (!value.equals(RESTSupport.key(key, indice).toString())) {
			errosEncontrados += WordSuporte.addErroJunit(key, value, RESTSupport.key(key, indice).toString(),
					erroEcontrado);
			erroEcontrado = true;
		}
		}

		// System.out.println(RESTSupport.key(key, indice));
	

	@Entao("^valido que no campo \"([^\"]*)\" do objeto \"([^\"]*)\" recebo o valor \"([^\"]*)\"$")
	public void validoQueNoCampoDoObjetoReceboOValor(String key, String objeto, String value) throws Throwable {
		// Write code here that turns the phrase above into concrete actions

		if (!value.equals(RESTSupport.key(objeto, key).toString())) {
			errosEncontrados += WordSuporte.addErroJunit(key, value, RESTSupport.key(objeto, key).toString(),
					erroEcontrado);
			erroEcontrado = true;
		}

		// System.out.println(RESTSupport.key(objeto, key).toString());

	}

	@Entao("^fecho o arquivo de evidencia do \"([^\"]*)\"$")
	public void fechoOArquivoDeEvidenciaDa(String cenario) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		WordSuporte.closeWord(cenario.replace("(", "").replace(")", ""), erroEcontrado);
		if (erroEcontrado) {
			throw new Exception("Erros: \n" + errosEncontrados);
		}
	}

	@Entao("^fecho o arquivo de evidencia do \"([^\"]*)\" e envio a execucao para o alm com \"([^\"]*)\" e \"([^\"]*)\"$")
	public void fechoOArquivoDeEvidenciaDoEEnvioAExecucaoParaOAlmComE(String cenario, String testId, String testCycle)
			throws Throwable {
		String _cenario = cenario.replace("(", "").replace(")", "");
		WordSuporte.closeWord(_cenario, erroEcontrado);
		if (ALMSuporte.isExecutaALM()) {
			this.atualizaALM(testId, testCycle, _cenario, erroEcontrado);
		}

		if (erroEcontrado) {
			throw new Exception("Erros: \n" + errosEncontrados);
		}
	}

	public void atualizaALM(String testId, String testCycle, String cenario, boolean erroEcontrado) {
		String urlALM = "http://alm1.produban.gs.corp/qcbin/";
		String dominio = "SNTBR_SANTANDER";
		String projeto = "projeto";
		String usuario = "usuario";
		String senha = "senha";
		String nomeRun = "run_" + cenario.replace(" ", "_").replace("/", "");
		String status = "Passed";
		ALMSuporte.setUrlProxy("proxy.santanderbr.corp");
		ALMSuporte.setPortProxy(80);
		if (erroEcontrado) {
			status = "Failed";
		}

		String evidencia = "evidencia/" + cenario.replace(" ", "").replace("/", "") + ".docx";

		ALMSuporte.setUrlAlm(urlALM);
		ALMSuporte.setEndPoint(dominio, projeto);
		try {
			ALMSuporte.conectALM(usuario, senha);
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			new Exception("Não foi possivel conectar no alm: " + e);
		}
		String idRun = ALMSuporte.getIdRun(testId, testCycle);
		if (idRun == null) {
			idRun = ALMSuporte.executeRun(status, nomeRun, testId, testCycle, usuario);
			ALMSuporte.addAttachmentToRun(idRun, evidencia, cenario.replace(" ", "").replace("/", "") + ".docx");

		} else {
			ALMSuporte.executePutRun(idRun, status);
			ALMSuporte.addAttachmentToRun(idRun, evidencia, cenario.replace(" ", "").replace("/", "") + ".docx");
		}
	}

}
