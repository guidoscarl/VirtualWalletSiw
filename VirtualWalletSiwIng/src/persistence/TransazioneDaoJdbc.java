package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.TreeSet;

import Excepions.UsersNotFound;
import javafx.collections.transformation.SortedList;
import models.Transazione;
import models.Utente;
import persistence.dao.TransazioneDao;
import persistence.dao.UtenteDao;

public class TransazioneDaoJdbc implements TransazioneDao {
	
	private DataSource data;
	public TransazioneDaoJdbc(DataSource d) {
		data=d;
	}

	@Override
	public ArrayList<Transazione> getByEmail(String email, int type) {
		
		ArrayList<Transazione> transazioni=new ArrayList<Transazione>();
		Connection c=null;
		switch (type) {
		case MITTENTE:
			
			String query="SELECT mittente, destinatario, importo\r\n" + 
					"	FROM public.transazione\r\n" + 
					"	WHERE mittente=?;";
			try {
				c=data.getConnection();
				PreparedStatement statement = c.prepareStatement(query);
				statement.setString(1, email);
				ResultSet results = statement.executeQuery();
				c.close();
				while(results.next()) {
					UtenteDao u = DatabaseManager.getInstance().getDaoFactory().getUtenteDao();
					Utente utM = u.getUtenteforTransaction(results.getString("mittente"));
					Utente utD =u.getUtenteforTransaction(results.getString("destinatario"));
					Transazione t =new Transazione(utM.getNome(),utM.getCognome(),utD.getNome(),utD.getCognome(),results.getInt("importo"),utD.getEmail());
					transazioni.add(t);
				}
			} catch (SQLException e) {
				
				try {
					c.close();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			} catch (UsersNotFound e) {
				// TODO Auto-generated catch block
				try {
					c.close();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
			
			break;
		case DESTINATARIO:
			String query2="SELECT mittente, destinatario, importo\r\n" + 
					"	FROM public.transazione\r\n" + 
					"	WHERE destinatario=?;";
			try {
				c=data.getConnection();
				PreparedStatement statement = c.prepareStatement(query2);
				statement.setString(1, email);
				ResultSet results = statement.executeQuery();
				c.close();
				while(results.next()) {
					UtenteDao u = DatabaseManager.getInstance().getDaoFactory().getUtenteDao();
					Utente utM = u.getUtenteforTransaction(results.getString("mittente"));
					Utente utD =u.getUtenteforTransaction(results.getString("destinatario"));
					Transazione t =new Transazione(utM.getNome(),utM.getCognome(),utD.getNome(),utD.getCognome(),results.getInt("importo"),utM.getEmail());
					transazioni.add(t);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				try {
					c.close();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			} catch (UsersNotFound e) {
				// TODO Auto-generated catch block
				try {
					c.close();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
			
			break;
			
			
		}
		
		return transazioni;
	}

}
