package steps;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import cucumber.api.java.pt.Quando;
import support.JsonSuporte;

public class DocumentsSteps extends JsonSuporte {
	List<Map<String, Object>> listDocuments = new ArrayList<>();
	
	@Quando("^adiciono o campo \"([^\"]*)\" com o valor \"([^\"]*)\" sendo \"([^\"]*)\" no objeto documents$")
	public void adicionoOCampoComOValorSendoNoObjetoDocuments(String key, String value, String tipo) throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
	    adicionaCampoCorrigido(documents, key, value, tipo);
	}

	@Quando("^adiciono o objeto documents na lista list_documents$")
	public void adicionoOObjetoDocumentsNaListaList_documents() throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
	    listDocuments.add(documents);
	}

	@Quando("^adiciono o campo \"([^\"]*)\" com o valor \"([^\"]*)\" sendo \"([^\"]*)\" no objeto documents_dois$")
	public void adicionoOCampoComOValorSendoNoObjetoDocuments_dois(String key, String value, String tipo) throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
	    adicionaCampoCorrigido(documents_dois, key, value, tipo);
	}

	@Quando("^adiciono o objeto documents_dois na lista list_documents$")
	public void adicionoOObjetoDocuments_doisNaListaList_documents() throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
	    listDocuments.add(documents_dois);
	}

	@Quando("^adiciono o campo \"([^\"]*)\" com a lista list_documents no objeto json sendo \"([^\"]*)\"$")
	public void adicionoOCampoComAListaList_documentsNoObjetoJsonSendo(String key, String tipo) throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
	    adicionaListaNoJsonPai(json, listDocuments, key, tipo);
	}
}
