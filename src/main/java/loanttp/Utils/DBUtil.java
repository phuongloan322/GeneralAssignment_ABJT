package loanttp.Utils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;


/**
 * class handle create connection and close it.
 * @author FA
 *
 */
public class DBUtil {
	private static DBUtil instance;
	private Connection connection;
	
	/**
	 * @author LoanTTP
	 * @Birthday 2000_02_03
	 */
	private DBUtil() {
	    try {
	    	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String url="jdbc:sqlserver://DESKTOP-E754EJE\\SQLEXPRESS:1433;databaseName=GeneralAssignment_ATJB_opt1;user=sa; password=123456";
	    	connection = DriverManager.getConnection(url);
	    	//System.out.println("Connected!");
	    } catch (ClassNotFoundException | SQLException e) {
	      e.printStackTrace();
	    }
	  }


	/**
	 * @author LoanTTP
	 * @Birthday 2000_02_03
	 * @return
	 */
	public Connection getConnection() {
	    return connection;
	  }


	/**
	 * @author LoanTTP
	 * @Birthday 2000_02_03
	 * @return
	 * @throws SQLException
	 */
	public static DBUtil getInstance() throws SQLException {
	    if (instance == null || instance.getConnection().isClosed()) {
	      instance = new DBUtil();
	    }
	    return instance;
	  }
}
