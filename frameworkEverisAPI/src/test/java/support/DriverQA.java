package support;


import io.github.bonigarcia.wdm.ChromeDriverManager;
import io.github.bonigarcia.wdm.FirefoxDriverManager;
import net.bytebuddy.asm.Advice.This;

import org.apache.commons.io.FileUtils;
import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.Keys;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.awt.AWTException;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.datatransfer.StringSelection;
import java.awt.event.KeyEvent;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.NoSuchElementException;

public class DriverQA {

    private static WebDriver driver;
    private static int numberPrint = 0;

    public static void start(String parBrowser){
    	
        String title = "";
        try{
            title = driver.getTitle();
        } catch (Exception e){
            title = "ERROR";
        }
        if (title == "ERROR") {
            switch (parBrowser) {
                case "firefox":

                    FirefoxDriverManager.getInstance().setup();
                    FirefoxOptions options = new FirefoxOptions();
                    options.addPreference(FirefoxDriver.MARIONETTE, true);
                    driver = new FirefoxDriver(options);
                    driver.manage().window().maximize();

                    break;
                case "chrome":
                	
                	String so = System.getProperty("os.name"); 
                	
                	String[] arraySO = so.split(" ");
                	so = arraySO[0];
                	
                	if(so.equals("Windows")) {
                		System.setProperty("webdriver.chrome.driver", "chromedriver.exe");
                	}else{
                		
                		System.setProperty("webdriver.chrome.driver", "chromedriver");
                	}
                	
                	
                	
                	ChromeOptions optionsC = new ChromeOptions();
                  
                    // hides the info message that says chrome is being controlled by automated test software
                    
                	optionsC.addArguments(Arrays.asList(
                            "disable-infobars", "ignore-certificate-errors","use-fake-ui-for-media-stream", "no-sandbox"));
                	
                    driver = new ChromeDriver(optionsC);
                    Dimension d = new Dimension(1200,1000);
                    driver.manage().window().setSize(d); 
                    
                    //driver.manage().window().maximize(); 
                    
                    break;
                default:
                    break;
            }
        }
    }

    private static String getAttributeType (String... parType){
        String type;
        if (parType.length == 0) { type = "id"; }
        else { type = parType[0];}
        return type;
    }
    private static WebElement findElem(String parValue, String... parType){
        String param2 = getAttributeType(parType);
        
        if(parValue.length() > 2 && parValue.substring(0, 2).equals("//") && param2.equals("id")) {
        	param2 = "xpath";
        }else if(parValue.length() > 1 && parValue.substring(0, 1).equals("#") && param2.equals("id")) {
        	param2 = "css";
        }
       
        WebElement element = null;
        
        try {
            switch (param2) {
                case "id":
                    element = driver.findElement(By.id(parValue));
                    break;
                case "name":
                    element = driver.findElement(By.name(parValue));
                    break;
                case "css":
                    element = driver.findElement(By.cssSelector(parValue));
                    break;
                case "xpath":
                    element = driver.findElement(By.xpath(parValue));
                    break;
                case "link":
                    element = driver.findElement(By.linkText(parValue));
                    break;
            }
        } catch (NoSuchElementException e) {
            element = null;
        }
        return element;
    }

    
    private static List<WebElement> findElems(String parValue, String... parType){
        String param2 = getAttributeType(parType);
        if(parValue.length() > 2 && parValue.substring(0, 2).equals("//") && param2.equals("id")) {
        	param2 = "xpath";
        }else if(parValue.length() > 1 && parValue.substring(0, 1).equals("#") && param2.equals("id")) {
        	param2 = "css";
        }
        List<WebElement> elements = null;
        
        try {
            switch (param2) {
                case "id":
                    elements = driver.findElements(By.id(parValue));
                    break;
                case "name":
                    elements = driver.findElements(By.name(parValue));
                    break;
                case "css":
                    elements = driver.findElements(By.cssSelector(parValue));
                    break;
                case "xpath":
                    elements = driver.findElements(By.xpath(parValue));
                    break;
                case "link":
                    elements = driver.findElements(By.linkText(parValue));
                    break;
            }
        } catch (NoSuchElementException e) {
            elements = null;
        }
        return elements;
    }
    
    public static void clickMutiplosComConfirmacao(String parValue, String... parType) {
    	List<WebElement> elements = findElems(parValue, parType);
    	
    	
    	for(WebElement element : elements){
    		element.click();
    		driver.switchTo().alert().accept();
    	}
    	
    	
    }
    
    public static void click(String parValue, String... parType){
        WebElement element = findElem(parValue, parType);
       
        element.click();
        
    }
    
    public static void clickPosicao(String parValue, int posicao, String... parType) {
    	List<WebElement> elements = findElems(parValue, parType);
    	elements.get(posicao).click();
    }
    
    public static void sendKeysPosicao(String parText, String parValue, int posicao, String... parType) {
    	List<WebElement> elements = findElems(parValue, parType);
    	elements.get(posicao).clear();
    	elements.get(posicao).sendKeys(parText);
    }
    
    

    public static void openURL(String parUrl) {
        driver.get(parUrl);
    }

    public static void refresh() {
    	driver.navigate().refresh();
    }
    
    public static void quit() {
        driver.quit();
    }

    public static void close() {
        driver.close();
    }

    public static void sendKeys(String parText, String parName, String... parType) {
        WebElement element = findElem(parName, parType);
        element.clear();
        element.sendKeys(parText);
    }
    
    public static void sendKeysTime(String parText, String parName, String... parType) {
        WebElement element = findElem(parName, parType);
        element.clear();
        int tamanho = parText.length();
        for(int i = 0; i < tamanho; i++) {
        	element.sendKeys(String.valueOf(parText.charAt(i)));
        }
        
        
    }
    
    public static void abreNovaAba() {
    	driver.findElement(By.cssSelector("body")).sendKeys(Keys.CONTROL +"t");
    }

    public static String getText(String parValue, String... parType) {
        WebElement element = findElem(parValue, parType);
        return element.getText();
    }
    
    public static String getValue(String parValue, String... parType) {
        WebElement element = findElem(parValue, parType);
        return element.getAttribute("value");
    }
    
    public static boolean isEnabled(String parValue, String... parType) {
    	WebElement element = findElem(parValue, parType);
    	return element.isEnabled();
    }
    
    public static boolean isElementPresent(String parValue, String... parType) {
    	try {
    		WebElement element = findElem(parValue, parType);
    		if(element != null) {
    			return true;
    		}else {
    			return false;
    		}
    		
    	}catch (Exception e) {
			return false;
		}
    	
    	
    	
    }
    
    public static boolean isDisplayed(String parValue, String... parType) {
    	WebElement element = findElem(parValue, parType);
    	
    	return element.isDisplayed();
    } 
    
    public static boolean isSelected(String parValue, String... parType) {
    	WebElement element = findElem(parValue, parType);
    	
        return element.isSelected();
    }
    
    public static String getAttribute(String atributo, String parValue, String... parType) {
    	WebElement element = findElem(parValue, parType);
    	
        return element.getAttribute(atributo);
    }
    
    public static void submit(String parValue, String... parType) {
        WebElement element = findElem(parValue, parType);
        element.submit();
    }

    public static void selectByIndex(Integer parIndex, String parName, String... parType) {
        WebElement element = findElem(parName, parType);
        Select dropdown = new Select(element);
        dropdown.selectByIndex(parIndex);
    }

    public static void selectByText(String parText, String parName, String... parType) {
        WebElement element = findElem(parName, parType);
        Select dropdown = new Select(element);
        dropdown.selectByVisibleText(parText);
        
    }

    public static String getCurrentURL() {
        return driver.getCurrentUrl();
    }

    public static void waitElementAll(String parValue, String... parType){
        WebDriverWait wait = new WebDriverWait(driver, 25);
        String param2 = getAttributeType(parType);
        if(parValue.length() > 2 && parValue.substring(0, 2).equals("//") && param2.equals("id")) {
        	param2 = "xpath";
        }else if(parValue.length() > 1 && parValue.substring(0, 1).equals("#") && param2.equals("id")) {
        	param2 = "css";
        }
        
        try {
            switch (param2) {
                case "id":
                    wait.until(ExpectedConditions.visibilityOfElementLocated(By.id(parValue)));
                    break;
                case "name":
                    wait.until(ExpectedConditions.visibilityOfElementLocated(By.name(parValue)));
                    break;
                case "css":
                    wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(parValue)));
                    break;
                case "xpath":
                    wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath(parValue)));
                    break;
                case "link":
                    wait.until(ExpectedConditions.visibilityOfElementLocated(By.linkText(parValue)));
                    break;
            }
        } catch (NoSuchElementException e) {
            System.out.println("ERROR WAIT => " + e.toString());
        }
    }
    
    public static void waitElementInvisibiltyAll(String parValue, String... parType){
        WebDriverWait wait = new WebDriverWait(driver, 90);
        String param2 = getAttributeType(parType);
        if(parValue.length() > 2 && parValue.substring(0, 2).equals("//") && param2.equals("id")) {
        	param2 = "xpath";
        }else if(parValue.length() > 1 && parValue.substring(0, 1).equals("#") && param2.equals("id")) {
        	param2 = "css";
        }
        
        try {
            switch (param2) {
                case "id":
                    wait.until(ExpectedConditions.invisibilityOfElementLocated(By.id(parValue)));
                    break;
                case "name":
                    wait.until(ExpectedConditions.invisibilityOfElementLocated(By.name(parValue)));
                    break;
                case "css":
                    wait.until(ExpectedConditions.invisibilityOfElementLocated(By.cssSelector(parValue)));
                    break;
                case "xpath":
                    wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath(parValue)));
                    break;
                case "link":
                    wait.until(ExpectedConditions.invisibilityOfElementLocated(By.linkText(parValue)));
                    break;
            }
        } catch (NoSuchElementException e) {
            System.out.println("ERROR WAIT => " + e.toString());
        }
    }
   
    public static void waitElement(String parId) {
        WebDriverWait wait = new WebDriverWait(driver, 60);
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.id(parId)));
    }
    
    public static void switchIframe(String parName, String... parType) {
        WebElement iframe = findElem(parName, parType);
        
        try {
			Thread.currentThread().sleep(5000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
    	driver.switchTo().frame(iframe);
    	
    }
    
    public static void PrintScreen(){
    	File scrFile = ((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
    	// Now you can do whatever you need to do with it, for example copy somewhere
    	int _numberPrint = getNumberPrint()+1;
    	try {
			FileUtils.copyFile(scrFile, new File("imgs\\screenshot_"+_numberPrint+".png"));
			setNumberPrint(_numberPrint);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

    public static void waitElementCSS(String parCss) {
        WebDriverWait wait = new WebDriverWait(driver, 60);
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(parCss)));
    }

    public static void waitElementXP(String parXp) {
        WebDriverWait wait = new WebDriverWait(driver, 60);
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath(parXp)));
    }

    public static void switchTo(String... parValue) {
        if (parValue.length == 0) {
            driver.switchTo().defaultContent();
        } else {
            driver.switchTo().window(String.valueOf(parValue));
        }
    }

    public static void ChooseOkOnNextConfirmation() {
        Alert alert = driver.switchTo().alert();
        alert.accept();
    }

    public static void ChooseCancelOnNextConfirmation() {
        Alert alert = driver.switchTo().alert();
        alert.dismiss();
    }
    
    public static void selectArchive(String caminho_arquivo) throws AWTException {
    	StringSelection ss = new StringSelection(caminho_arquivo);
	    Toolkit.getDefaultToolkit().getSystemClipboard().setContents(ss, null);
	    
	    Robot robot = new Robot();
	    robot.delay(1000);
	    
	    robot.keyPress(KeyEvent.VK_CONTROL);
	    robot.keyPress(KeyEvent.VK_V);
	    robot.keyRelease(KeyEvent.VK_V);
	    robot.keyRelease(KeyEvent.VK_CONTROL);
	    robot.keyPress(KeyEvent.VK_ENTER);
	    robot.keyRelease(KeyEvent.VK_ENTER);
	    robot.delay(1000);
    }

	public static int getNumberPrint() {
		return numberPrint;
	}

	public static void setNumberPrint(int _numberPrint) {
		numberPrint = _numberPrint;
	}
}
