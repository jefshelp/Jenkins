/*package pages;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import atu.testrecorder.ATUTestRecorder;
import atu.testrecorder.exceptions.ATUTestRecorderException;
import support.DriverQA;
import support.WordSuporte;

public class WebPI {

	String btnSimularInvestimento = "btn_simulador_naologado";
	String selectValorInvestir = "value";
	String selectDuracaoInvestimento = "day";
	String btnEnviaInvestimento = "#root > div > div > div.simulator-header > div > div.card-container > div.card-bt.sc-bdVaJa.cNkfwA > button";
	String resultadoInvestimentos = "div.results-slider";
	String btnCookie = ".btn-cookie";
	String iframe = "destination-frame";
	ATUTestRecorder grava;
	public void abreNavegador(String url) {
		DriverQA.start("chrome");
		
		DateFormat dateFormat = new SimpleDateFormat("yy-MM-dd HH-mm-ss");
		Date date = new Date();
		
		try {
			grava = new ATUTestRecorder("evidencia\\", "fluxo_abrecuentasPY"+dateFormat.format(date), false);
			grava.start();
		} catch (ATUTestRecorderException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			Thread.currentThread().sleep(10000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		DriverQA.openURL(url);
	}

	public void clickSimularInvestimento() {
		DriverQA.waitElement(btnSimularInvestimento);
		DriverQA.click(btnCookie, "css");
		DriverQA.PrintScreen();
		WordSuporte.addImage("imgs\\screenshot_"+DriverQA.getNumberPrint()+".png");
		DriverQA.waitElementInvisibiltyAll(btnCookie, "css");
		DriverQA.click(btnSimularInvestimento);
	}

	public void vericaPaginaPiSimulador() {
		DriverQA.waitElement(iframe);
		DriverQA.switchIframe(iframe);
		
		
	}

	public void selectValorAInvestir(String valor) {
		DriverQA.waitElement(selectValorInvestir);
		DriverQA.PrintScreen();
		WordSuporte.addImage("imgs\\screenshot_"+DriverQA.getNumberPrint()+".png");
		DriverQA.selectByText(valor, selectValorInvestir);
	}

	public void selectTempoInvestimento(String tempo) {
		DriverQA.selectByText(tempo, selectDuracaoInvestimento);
	}

	public void clickSimular() {
		DriverQA.PrintScreen();
		WordSuporte.addImage("imgs\\screenshot_"+DriverQA.getNumberPrint()+".png");
		DriverQA.click(btnEnviaInvestimento);
	}

	public void verificaInvestimentos() {
		DriverQA.waitElementCSS(resultadoInvestimentos);
		DriverQA.PrintScreen();
		WordSuporte.addImage("imgs\\screenshot_"+DriverQA.getNumberPrint()+".png");
	}

	public void finalizaGravacao() {
		try {
			Thread.currentThread().sleep(40000);
			grava.stop();
		} catch (ATUTestRecorderException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
}
*/