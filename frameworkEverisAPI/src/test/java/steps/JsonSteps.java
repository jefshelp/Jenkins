package steps;


import cucumber.api.java.pt.Dado;
import cucumber.api.java.pt.Quando;
import support.JsonSuporte;

public class JsonSteps extends JsonSuporte {

	@Dado("^que adiciono o campo \"([^\"]*)\" com o valor \"([^\"]*)\" no objeto header$")
	public void que_adiciono_o_campo_com_o_valor_no_objeto_header(String campo, String valor) throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		cabecalho.put(campo, valor);
	}

	@Quando("^adiciono o campo \"([^\"]*)\" com o valor \"([^\"]*)\" sendo \"([^\"]*)\" no objeto json$")
	public void adicionoOCampoComOValorSendoNoObjetoJson(String key, String value, String tipo) throws Throwable {
		// Write code here that turns the phrase above into concrete actions

		adicionaCampoCorrigido(json, key, value, tipo);

	}

}
