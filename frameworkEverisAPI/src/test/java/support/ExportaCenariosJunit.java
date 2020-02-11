package support;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.junit.Test;

public class ExportaCenariosJunit {
	
	@Test
	public void exportarCenarios(){
		String fileName = "lib/OSA Fraude Validacoes.xlsx";
		
		try {
			FileInputStream arquivo = new FileInputStream(new File(fileName));
			int x = 1;
			
			XSSFWorkbook workbook = new XSSFWorkbook(arquivo);
			XSSFSheet sheetCenarios = workbook.getSheetAt(0);
			int noOfColumns = sheetCenarios.getRow(0).getPhysicalNumberOfCells();
			for (int i = 1; i < noOfColumns; i++) {
				Row rowCabecalho = sheetCenarios.getRow(0);
				String campo = rowCabecalho.getCell(i).getStringCellValue();
				System.out.println("|cenario|testId|testCycle|retorno|cod_retorno|msg_retorno|");
				for (int j = 1; j < sheetCenarios.getPhysicalNumberOfRows(); j++) {
					Row rowCenario = sheetCenarios.getRow(j);
					String cenario = rowCenario.getCell(0).getStringCellValue();
					String resultado = rowCenario.getCell(i).getStringCellValue();
					int codRetorno = 0;
					String msgRetorno = "null";
					if (resultado.equals("Erro")) {
						codRetorno = 75553;
						msgRetorno = "Erro!";
					}
					
					if (!resultado.equals("N/A") && !resultado.equals("")) {
						String textoCenario = "|("+x+". OSA Validação Fraude campo "+campo+" "+cenario+", retorna "+resultado+".)|1|1|"+resultado+"|"+codRetorno+"|"+msgRetorno+"|";
						//String textoCenario = x+". OSA Validação Fraude campo "+campo+" "+cenario+", retorna "+resultado;
						
						System.out.println(textoCenario);
						x++;
					}
					
				}
				System.out.println("");
			}
			System.out.println(noOfColumns);
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
