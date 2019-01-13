package persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import models.Utente;

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
			 
			 c = DriverManager.getConnection("postgres://qmpwuofg:ZaJ3gx7qVae8rjFyY4LhoXFtTNSuF_EG@baasu.db.elephantsql.com:5432/qmpwuofg","qmpwuofg"," ZaJ3gx7qVae8rjFyY4LhoXFtTNSuF_EG\r\n" + 
			 		"");
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
	
	public Utente getUtente(String nome, String cognome) {
		Utente u = null;
		try {
			PreparedStatement s;
			String query="SELECT \"Nome\", \"Cognome\", \"ID\"\r\n" + 
					"	FROM public.\"Utente\" \r\n" + 
					"	WHERE \"Nome\"=? and \"Cognome\"=?;";
				s=c.prepareStatement(query);
				s.setString(1, nome);
				s.setString(2, cognome) ;
				ResultSet result=s.executeQuery();
				
				if(result.next()) {
					//u= new Utente(result.getString("Nome"),result.getString("Cognome"));
				}
			c.close();
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}
	
	
	
	
	
	
}
