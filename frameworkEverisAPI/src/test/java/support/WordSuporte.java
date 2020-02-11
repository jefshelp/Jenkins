package support;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.util.Units;
import org.apache.poi.xwpf.model.XWPFHeaderFooterPolicy;
import org.apache.poi.xwpf.usermodel.ParagraphAlignment;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFHeader;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFPicture;
import org.apache.poi.xwpf.usermodel.XWPFPictureData;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableCell;
import org.apache.poi.xwpf.usermodel.XWPFTableCell.XWPFVertAlign;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;
import org.apache.xmlbeans.XmlCursor;
import org.json.simple.JSONObject;
import org.junit.experimental.theories.Theories;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTPPr;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTSectPr;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTSpacing;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTblWidth;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STHighlightColor;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STLineSpacingRule;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STTblWidth;

import steps.SuporteSteps;

public class WordSuporte {
	public static XWPFDocument document;
	private static int fontSizeTitulo = 15;
	private static String fontFamilyBody = "Calibri";
	private static int fontSizeBody = 11;
	private static String fontFamilyPasso = "Calibri";
	private static int fontSizePasso = 12;
	private static int qtEspaco;
	private static int qtErros;
	private static int numPassoAtual;

	public static int getNumPassoAtual() {
		return numPassoAtual;
	}

	public static void setNumPassoAtual(int numPassoAtual) {
		WordSuporte.numPassoAtual = numPassoAtual;
	}

	public static void adicionaTituloCenario(String tituloCenario, String projeto, String parceiro) throws Throwable {
		if (SuporteSteps.isExecutaEvidencia()) {
			document = new XWPFDocument();

			// adicionaCabecalho();
			cabecalhoTabela(projeto);
			addTable(tituloCenario, projeto, parceiro);
			XWPFParagraph title = document.createParagraph();
			title.setAlignment(ParagraphAlignment.CENTER);
			// XWPFRun titleRun = title.createRun();
		}

	}

	public static void setSingleLineSpacing(XWPFParagraph para) {
		if (SuporteSteps.isExecutaEvidencia()) {
			CTPPr ppr = para.getCTP().getPPr();
			if (ppr == null)
				ppr = para.getCTP().addNewPPr();
			CTSpacing spacing = ppr.isSetSpacing() ? ppr.getSpacing() : ppr.addNewSpacing();
			spacing.setAfter(BigInteger.valueOf(0));
			spacing.setBefore(BigInteger.valueOf(0));
			spacing.setLineRule(STLineSpacingRule.AUTO);
			spacing.setLine(BigInteger.valueOf(240));
		}

	}

	public static void cabecalhoTabela(String projeto) throws IOException, Throwable {
		if (SuporteSteps.isExecutaEvidencia()) {
			XWPFParagraph paragraph = document.createParagraph();
			XWPFRun run = paragraph.createRun();

			CTSectPr sectPr = document.getDocument().getBody().addNewSectPr();
			XWPFHeaderFooterPolicy headerFooterPolicy = new XWPFHeaderFooterPolicy(document, sectPr);

			XWPFHeader header = headerFooterPolicy.createHeader(XWPFHeaderFooterPolicy.DEFAULT);

			paragraph = header.getParagraphArray(0);
			if (paragraph == null)
				paragraph = header.createParagraph();
			paragraph.setAlignment(ParagraphAlignment.LEFT);

			run = paragraph.createRun();

			addTableImagemCabecalho(run, header, paragraph, projeto);

		}

	}

	public static void addTableImagemCabecalho(XWPFRun run, XWPFHeader header, XWPFParagraph paragraph, String projeto)
			throws IOException, Throwable {
		if (SuporteSteps.isExecutaEvidencia()) {
			XmlCursor cursor = paragraph.getCTP().newCursor();
			XWPFTable table = header.insertNewTbl(cursor);
			XWPFTableRow row = table.getRow(0);
			if (row == null)
				row = table.createRow();
			int twipsPerInch = 1000;

			for (int i = 0; i < 3; i++) {
				XWPFTableCell cell = row.getCell(i);
				if (cell == null)
					cell = row.createCell();
				CTTblWidth tblWidth = cell.getCTTc().addNewTcPr().addNewTcW();
				if (i == 0) {
					tblWidth.setW(BigInteger.valueOf(2 * twipsPerInch));
				} else if (i == 1) {
					tblWidth.setW(BigInteger.valueOf(5 * twipsPerInch));
				} else {
					tblWidth.setW(BigInteger.valueOf(1 * twipsPerInch));
				}

				tblWidth.setType(STTblWidth.DXA);
				paragraph = cell.getParagraphs().get(0);

				run = paragraph.createRun();
				if (i == 0) {
					addImagem(run, header, "imgs/andbank.jpg");
				} else if (i == 1) {
					run.setText("Testes Automatizados - Projeto " + projeto);
					run.setFontSize(fontSizeTitulo);
					cell.setVerticalAlignment(XWPFVertAlign.CENTER);
				} else {
					addImagem(run, header, "imgs/everis.png");
				}

			}
		}

	}

	public static void addTextoCelula(XWPFTable table, String texto, boolean negrito, int tamanho, int linha,
			int posicao) {
		if (SuporteSteps.isExecutaEvidencia()) {
			XWPFRun run;
			XWPFTableRow tableRow = table.getRow(linha);
			if (tableRow == null) {
				tableRow = table.createRow();
			}
			XWPFTableCell celula = tableRow.getCell(posicao);
			if (celula == null) {
				celula = tableRow.addNewTableCell();
			}

			celula.removeParagraph(0);
			CTTblWidth tblWidth = celula.getCTTc().addNewTcPr().addNewTcW();
			tblWidth.setW(BigInteger.valueOf(tamanho));
			run = celula.addParagraph().createRun();
			run.setText(texto);
			run.setBold(negrito);
		}

	}

	public static void addTable(String tituloCenario, String projeto, String parceiro) {
		if (SuporteSteps.isExecutaEvidencia()) {
			XWPFTable table = document.createTable();

			addTextoCelula(table, "Cenário", true, 3500, 0, 0);
			addTextoCelula(table, tituloCenario, true, 8500, 0, 1);
			addTextoCelula(table, "Resultado Esperado", true, 3500, 1, 0);
			addTextoCelula(table, "Sucesso", false, 8500, 1, 1);

			XWPFParagraph paragraf = document.createParagraph();
			paragraf.setAlignment(ParagraphAlignment.LEFT);

			paragraf.createRun();

			table = document.createTable();

			addTextoCelula(table, "Sistemas Envolvidos", true, 3500, 0, 0);
			addTextoCelula(table, projeto, false, 8500, 0, 1);
			addTextoCelula(table, "Fontes de Validação Internas e/ou Externas", true, 3500, 1, 0);
			addTextoCelula(table, parceiro, false, 8500, 1, 1);
		}

	}

	public static void addImagem(XWPFRun run, XWPFHeader header, String imgFile)
			throws Throwable, FileNotFoundException, IOException {
		if (SuporteSteps.isExecutaEvidencia()) {
			XWPFPicture picture = run.addPicture(new FileInputStream(imgFile), XWPFDocument.PICTURE_TYPE_PNG, imgFile,
					Units.toEMU(68), Units.toEMU(35));

			String blipID = "";
			for (XWPFPictureData picturedata : header.getAllPackagePictures()) {
				blipID = header.getRelationId(picturedata);

			}
			picture.getCTPicture().getBlipFill().getBlip().setEmbed(blipID);
		}

	}

	public static void adicionaTituloPassoExecutado(String tituloPasso) {
		if (SuporteSteps.isExecutaEvidencia()) {
			XWPFParagraph title = document.createParagraph();
			title.setAlignment(ParagraphAlignment.LEFT);

			XWPFRun titleRun = title.createRun();
			titleRun.setText(tituloPasso);
			titleRun.setBold(true);
			titleRun.setFontFamily(fontFamilyPasso);
			titleRun.setFontSize(fontSizePasso);
		}

	}

	public static void addParagrafo(String paragrafo) {
		if (SuporteSteps.isExecutaEvidencia()) {
			XWPFParagraph title = document.createParagraph();
			title.setAlignment(ParagraphAlignment.LEFT);

			XWPFRun titleRun = title.createRun();
			titleRun.setText(paragrafo);
			titleRun.setBold(false);
			titleRun.setFontFamily(fontFamilyPasso);
			titleRun.setFontSize(fontSizePasso);
		}

	}

	public static void addImage(String imgPath) {
		if (SuporteSteps.isExecutaEvidencia()) {
			XWPFParagraph para = document.createParagraph();
			para.setAlignment(ParagraphAlignment.CENTER);

			XWPFRun run = para.createRun();

			try {
				XWPFPicture picture = run.addPicture(new FileInputStream(imgPath), XWPFDocument.PICTURE_TYPE_PNG,
						imgPath, Units.toEMU(500), Units.toEMU(400));
			} catch (InvalidFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	public static List<String> getListaJson(Map<String, Object> json) {
		String jsonQuebra = JSONObject.toJSONString(json).replace("{", "\n{\n");
		jsonQuebra = jsonQuebra.replace("}", "\n}\n");
		jsonQuebra = jsonQuebra.replace(",", ",\n");
		jsonQuebra = jsonQuebra.replace("\n\n", "\n");

		List<String> items = Arrays.asList(jsonQuebra.split("\n"));
		return items;
	}

	public static List<String> getListaJson(String json) {
		json = json.replace("\n", "");
		String jsonQuebra = json.replace("{", "\n{\n");
		jsonQuebra = jsonQuebra.replace("}", "\n}\n");
		jsonQuebra = jsonQuebra.replace(",", ",\n");
		jsonQuebra = jsonQuebra.replace("\n\n", "\n");

		List<String> items = Arrays.asList(jsonQuebra.split("\n"));
		return items;
	}

	private static void modificaJson(String item, List<String> campos, XWPFRun paraRun) {
		if (item.contains("}")) {
			qtEspaco = qtEspaco - 2;
		}
		for (int i = 0; i < qtEspaco; i++) {
			item = " " + item;
		}
		if (item.contains("{")) {
			qtEspaco = qtEspaco + 2;
		}
		for (String campo : campos) {

			if (item.contains("\"" + campo + "\":")) {
				paraRun.getCTR().addNewRPr().addNewHighlight().setVal(STHighlightColor.YELLOW);
				if (JsonSuporte.bibliotecaDados.get(campo) != null) {
					item += "      " + JsonSuporte.bibliotecaDados.get(campo).toString();
				}

			}
		}
		paraRun.setText(item);
		paraRun.setFontSize(fontSizeBody);
		paraRun.setFontFamily(fontFamilyBody);

	}

	public static void constroiJson(Map<String, Object> json, List<String> campos) {
		if (SuporteSteps.isExecutaEvidencia()) {
			XWPFParagraph para;

			List<String> items = getListaJson(json);
			qtEspaco = 0;
			for (String item : items) {
				para = document.createParagraph();
				setSingleLineSpacing(para);
				para.setAlignment(ParagraphAlignment.LEFT);

				XWPFRun paraRun = para.createRun();

				modificaJson(item, campos, paraRun);

			}

		}

	}

	public static void constroiJson(String json, List<String> campos) {
		if (SuporteSteps.isExecutaEvidencia()) {
			XWPFParagraph para;

			List<String> items = getListaJson(json);
			qtEspaco = 0;
			for (String item : items) {
				para = document.createParagraph();
				setSingleLineSpacing(para);
				para.setAlignment(ParagraphAlignment.LEFT);

				XWPFRun paraRun = para.createRun();

				modificaJson(item, campos, paraRun);

			}
		}
		

	}

	public static void addErroCampoNaoEncontrado(String campo, String retornoResponse) {
		if (SuporteSteps.isExecutaEvidencia()) {
			XWPFParagraph para;
			XWPFRun paraRun;
			para = document.createParagraph();
			para.setAlignment(ParagraphAlignment.LEFT);

			paraRun = para.createRun();
			paraRun.setBold(true);
			paraRun.setText("Campo não encontrado!");

			para = document.createParagraph();
			para.setAlignment(ParagraphAlignment.LEFT);

			paraRun = para.createRun();

			paraRun.setText("Campo " + campo + " não foi encontrado, retorno do response: " + retornoResponse);
		}
		

	}

	public static String addErroJunit(String campo, String esperado, String encontrado, boolean erroEncontrado) {
		XWPFParagraph para;
		XWPFRun paraRun;
		XWPFTable table;
		if (!erroEncontrado) {
			qtErros = 0;
			if (SuporteSteps.isExecutaEvidencia()) {
				para = document.createParagraph();
				para.setAlignment(ParagraphAlignment.LEFT);

				paraRun = para.createRun();
				paraRun.setBold(true);
				paraRun.setText("Erros Encontrados");
				erroEncontrado = true;
				

				table = document.createTable();

				addTextoCelula(table, "#", true, 500, 0, 0);
				addTextoCelula(table, "Codigo Campo", true, 2500, 0, 1);
				List<String> list = new ArrayList<String>(Arrays.asList(campo.split("\\.")));

				if (JsonSuporte.bibliotecaDados.get(list.get(list.size() - 1)) != null) {
					addTextoCelula(table, "Campo", true, 2500, 0, 2);
				}

				addTextoCelula(table, "Valor Esperado", true, 2500, 0, 3);
				addTextoCelula(table, "Valor Encontrado", true, 2500, 0, 4);
			}
			

		}
		qtErros += 1;
		if (SuporteSteps.isExecutaEvidencia()) {
			table = document.createTable();

			addTextoCelula(table, "" + qtErros, false, 500, 0, 0);
			addTextoCelula(table, campo, false, 2500, 0, 1);

			// campo.split(".");
			// List<String> arrayCampos = new ArrayList<>();
			if (campo.contains(".")) {
				List<String> list = new ArrayList<String>(Arrays.asList(campo.split("\\.")));

				if (JsonSuporte.bibliotecaDados.get(list.get(list.size() - 1)) != null) {
					String campoEncontrado = JsonSuporte.bibliotecaDados.get(list.get(list.size() - 1)).toString();

					addTextoCelula(table, campoEncontrado, false, 2500, 0, 2);
				}

			}

			addTextoCelula(table, esperado, false, 2500, 0, 3);
			addTextoCelula(table, encontrado, false, 2500, 0, 4);
		}
		

		return "Campo: " + campo + " - Valor esperado: <[" + esperado + "]> valor encontrado: <[" + encontrado + "]>\n";
	}

	public static void closeWord(String cenario, boolean erroEncontrado) throws IOException {
		if (SuporteSteps.isExecutaEvidencia()) {
			if (!erroEncontrado) {
				XWPFParagraph para;
				XWPFRun paraRun;
				para = document.createParagraph();
				para.setAlignment(ParagraphAlignment.LEFT);

				paraRun = para.createRun();
				paraRun.setBold(true);
				paraRun.setText("Teste executado sem erros!");
			}

			FileOutputStream out = new FileOutputStream("evidencia/" + cenario.replace(" ", "").replace("/", "") + ".docx");
			document.write(out);
			out.close();
			document.close();
		}
		

		JsonSuporte.LimpaHeader();
		JsonSuporte.LimpaJson();
	}

}
