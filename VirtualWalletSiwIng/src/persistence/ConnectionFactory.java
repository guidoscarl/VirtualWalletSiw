package persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionFactory {
	private Connection c;
	public ConnectionFactory() {
		
		System.out.println("Connettendo...");
		try {
			 
			 try {
				Class.forName("org.postgresql.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/VirtualWallet","postgres","forzamilan98");
			 System.out.println("Connesso al database");
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		

	}
	
	public void stampaUtenti() {
		try {
			Statement s = c.createStatement();
			ResultSet results=s.executeQuery("SELECT * FROM public.\"Utente\"");
			
			while(results.next()) {
				System.out.println(results.getString("Nome")+" "+results.getString("Cognome"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void inserisciUtente(int ID, String nome, String cognome) {
		try {
			Statement s = c.createStatement();
			
			s.execute("INSERT INTO public.\"Utente\"(\"Nome\",\"Cognome\") values('"+nome+"','"+cognome+"');");
			System.out.println("inserito");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			c.close();
			System.out.println("chiuso");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
}
