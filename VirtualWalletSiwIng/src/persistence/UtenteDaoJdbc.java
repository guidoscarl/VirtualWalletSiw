package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Excepions.EmailAlreadyUsed;
import Excepions.UsersNotFound;
import models.Utente;
import persistence.dao.UtenteDao;

public class UtenteDaoJdbc implements UtenteDao {
	private DataSource data;
	public UtenteDaoJdbc(DataSource d) {
		data=d;
	}
	@Override
	public void save(Utente u) throws EmailAlreadyUsed {
		
		Connection connection=null;
		try {
			connection = data.getConnection();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			System.out.println("connessione fallita");
		}
		String query = "INSERT INTO public.\"Utente\"(\r\n" + 
				"	email, nome, cognome, password, saldo)\r\n" + 
				"	VALUES (?, ?, ?, ?, ?)";
		
		
		try {
			
			PreparedStatement s;
			s=connection.prepareStatement(query);
			s.setString(1, u.getEmail());
			s.setString(2, u.getNome());
			s.setString(3, u.getCognome());
			s.setString(4, u.getPass());
			s.setInt(5, u.getSaldo());
			s.executeUpdate();
			System.out.println("ok");
			connection.close();
			
		} catch (SQLException e) {
			throw new EmailAlreadyUsed();
			
		}
		
		  
		
		
		
		
	}

	
		
		

	@Override
	public void update(Utente u) {
		System.out.println("ricarica");
		Connection c=null;
		try {
			 c= data.getConnection();
			 if(c!=null) {
			PreparedStatement s;
			String query="UPDATE public.\"Utente\"\r\n" + 
					"	SET saldo=?\r\n" + 
					"	WHERE email=?;";
				s=c.prepareStatement(query);
				s.setInt(1, u.getSaldo());
				s.setString(2, u.getEmail()) ;
				s.execute();
			 }
			 c.close();
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("errore");
			try {
				c.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}
	@Override
	public Utente getByPrimaryKey(String email, String pass) throws UsersNotFound {
		Utente u = null;
		Connection c=null;
		try {
			 c= data.getConnection();
			PreparedStatement s;
			String query="SELECT * \r\n" + 
					"	FROM public.\"Utente\" \r\n" + 
					"	WHERE \"email\"=? and \"password\"=?;";
				s=c.prepareStatement(query);
				s.setString(1, email);
				s.setString(2, pass) ;
				ResultSet result=s.executeQuery();
				
				if(result.next()) {
					u= new Utente(result.getString("nome"),result.getString("cognome"),result.getString("email"),result.getString("password"),result.getInt("saldo"));
				}
				/*else
					c.close();
					throw new UsersNotFound();*/
			
				c.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				c.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			throw new UsersNotFound();
			
			
		}
		return u;
	
	}

}
