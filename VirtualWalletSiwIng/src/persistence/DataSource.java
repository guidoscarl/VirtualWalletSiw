package persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataSource {
	final private String dbURI;// = "jdbc:postgresql://localhost/test";
	final private String userName;// = "postgres";
	final private String password;// = "postgres";
	
	

	public DataSource(String dbURI, String userName, String password) {
		this.dbURI=dbURI;
		this.userName=userName;
		this.password=password;
	}

	public Connection getConnection() throws SQLException {
		Connection connection = null;
		try {
			try {
				Class.forName("org.postgresql.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    connection = DriverManager.getConnection(dbURI,userName,password);
			
		
		} catch(SQLException e) {
			
		}
		return connection;
	}
}
