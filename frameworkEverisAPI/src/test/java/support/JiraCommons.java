package support;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;





public class JiraCommons {
	private HashMap<String, Object> json = new HashMap<String, Object>();

	private HashMap<String, Object> hashParent = new HashMap<String, Object>();
	private HashMap<String, Object> hashProject = new HashMap<String, Object>();
	private HashMap<String, Object> hashIssueType = new HashMap<String, Object>();
	private HashMap<String, Object> hashFaseDesenvolvimento = new HashMap<String, Object>();
	private HashMap<String, Object> hashClasseBug = new HashMap<String, Object>();
	private HashMap<String, Object> hashBugType = new HashMap<String, Object>();
	private HashMap<String, Object> hashTimetracking = new HashMap<String, Object>();
	private HashMap<String, Object> hashAssignee = new HashMap<String, Object>();

	private HashMap<String, Object> hashFields = new HashMap<String, Object>();

	public void instanciaHashs(String keyParent, String keyProject, String issueType, String faseDesenvolvimento,
			String classBug, String bugType, String TimeEstimate, String responsavel) {

		this.hashParent.put("key", keyParent);
		this.hashProject.put("key", keyProject);
		// this.hashIssueType.put("name", "Sub-Bug");
		// this.hashClasseBug.put("value", "Teste de Qualidade (TQ)");
		// this.hashBugType.put("value", "Funcional");
		// this.hashFaseDesenvolvimento.put("value", "Desenvolvimento");

		this.hashIssueType.put("name", issueType);
		if (bugType != null) {
			this.hashFaseDesenvolvimento.put("value", faseDesenvolvimento);
			this.hashClasseBug.put("value", classBug);
			this.hashBugType.put("value", bugType);
		}

		this.hashTimetracking.put("originalEstimate", TimeEstimate);
		this.hashAssignee.put("name", responsavel);

	}

	public void instanciaJson(List<String> listLabels, String titulo, String descricao) {
		hashFields.put("parent", hashParent);
		hashFields.put("project", hashProject);
		hashFields.put("summary", titulo);
		hashFields.put("issuetype", hashIssueType);
		hashFields.put("description", descricao);
		if (!hashClasseBug.isEmpty()) {
			hashFields.put("customfield_11818", hashFaseDesenvolvimento);
			hashFields.put("customfield_17200", hashClasseBug);
			hashFields.put("customfield_11815", hashBugType);
			hashFields.put("labels", listLabels);
		}

		hashFields.put("timetracking", hashTimetracking);
		hashFields.put("assignee", hashAssignee);

		json.put("fields", hashFields);
	}
	public void criarSubtask(String usuario, String senha, String subProjeto, String projeto, String tipoTask,
			String titulo, String descricao, String tempoAtividade, String dataAtividade) {

		List<String> listLabels = new ArrayList<String>();
		listLabels.add("ValidaçãoEmailPJ");
		this.instanciaHashs(subProjeto, projeto, tipoTask, null, null, null, tempoAtividade, usuario);
		this.instanciaJson(listLabels, titulo, descricao);

		JiraSuporte.setAuthorization(usuario, senha);
		JiraSuporte.addHeader("Authorization", JiraSuporte.getAuthorization());
		JiraSuporte.setUrlProxy("proxy.santanderbr.corp");
		JiraSuporte.setPortProxy(80);

		JiraSuporte.executePost(json, "http://jira.produbanbr.corp/rest/api/2/issue/");
		try {
			String keyProjeto = JiraSuporte.getResponse().getBody().jsonPath().get("key");
			System.out.println(json.toString());
			System.out.println(JiraSuporte.getResponse().getBody().asString());
			System.out.println(keyProjeto);

			this.executaPostWorkLog(keyProjeto, tempoAtividade, dataAtividade);

			this.execeutaPostTransitioFechaAtividade(keyProjeto);
		} catch (Exception e) {
			System.err.println("Requisicao invalida retorno: "+JiraSuporte.getResponse().getBody().asString());
		}
		
		

	}

	public void executaPostWorkLog(String keyProjeto, String timeSpent, String data) {
		this.json.clear();

		json.put("started", data);
		json.put("timeSpent", timeSpent);

		JiraSuporte.executePost(json, "http://jira.produbanbr.corp/rest/api/2/issue/" + keyProjeto + "/worklog");
	}

	public void execeutaPostTransitioFechaAtividade(String keyProjeto) {
		HashMap<String, Object> hashTransition = new HashMap<String, Object>();
		hashTransition.put("id", "21");
		json.clear();
		json.put("transition", hashTransition);
		JiraSuporte.executePost(json, "http://jira.produbanbr.corp/rest/api/2/issue/" + keyProjeto + "/transitions");

	}
}
