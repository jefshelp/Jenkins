package support;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcSuporte {
	public static Connection createConnection() throws SQLException, Throwable{
        String url = "jdbc:oracle:thin:@//urlbanco"; //Nome da base de dados
        String user = "usuario"; //nome do usuario do MySQL
        String password = "senha"; //senha do MySQL
         
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conexao = null;
        conexao = DriverManager.getConnection(url, user, password);
         
        return conexao;
    }
}
