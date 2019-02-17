package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

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
			try {
				connection.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
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
	public Utente getByPrimaryKey(String email, String pass) {
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
				
				
				if(result.next()){
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
			
			
			
		}
		return u;
	
	}
	@Override
	public void transaction(Utente mittente, Utente destinatario, int importo) {
		
		Connection c=null;
		try {
			 c= data.getConnection();
			 if(c!=null) {
			PreparedStatement s;
			String query="UPDATE public.\"Utente\"\r\n" + 
					"	SET saldo=?\r\n" + 
					"	WHERE email=?;";
				s=c.prepareStatement(query);
				s.setInt(1, mittente.getSaldo()-importo);
				s.setString(2, mittente.getEmail()) ;
				s.execute();
			
			
				PreparedStatement stat;
				String query2="UPDATE public.\"Utente\"\r\n" + 
						"	SET saldo=?\r\n" + 
						"	WHERE email=?;";
					stat=c.prepareStatement(query2);
					stat.setInt(1, destinatario.getSaldo()+importo);
					stat.setString(2, destinatario.getEmail()) ;
					stat.execute();
					
				String query3="INSERT INTO public.transazione(\r\n" + 
						"	mittente, destinatario, importo, data)\r\n" + 
						"	VALUES (?, ?, ?, ?);";
				
				PreparedStatement save;
				 DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");  
				   LocalDateTime now = LocalDateTime.now();
				   
				
				save=c.prepareStatement(query3);
				
				save.setString(1,mittente.getEmail());
				save.setString(2, destinatario.getEmail());
				save.setInt(3, importo);
				save.setString(4, dtf.format(now));
				
				save.execute();
				
				
			
				
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
	public Utente getUtenteforTransaction(String email) throws UsersNotFound {
		Utente u = null;
		Connection c=null;
		try {
			 c= data.getConnection();
			PreparedStatement s;
			String query="SELECT * \r\n" + 
					"	FROM public.\"Utente\" \r\n" + 
					"	WHERE \"email\"=?;";
				s=c.prepareStatement(query);
				s.setString(1, email);
				
				ResultSet result=s.executeQuery();
				
				if(!result.next()) {
					throw new UsersNotFound();
				}
				else {
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
	@Override
	public boolean existUtente(String email) {
		Connection c =null;
		boolean exist=true;
		try {
			c=data.getConnection();
			PreparedStatement s;
			String query="SELECT * \r\n" + 
					"	FROM public.\"Utente\" \r\n" + 
					"	WHERE \"email\"=?;";
				s=c.prepareStatement(query);
				s.setString(1, email);
				
				ResultSet result=s.executeQuery();
				c.close();
				if(result.next()) {
					exist=true;
				}
				else {
					exist=false;
				}
			
		}
		catch(SQLException e) {
			try {
				c.close();
				
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		}
		
		return exist;
	}
	@Override
	public ArrayList<Utente> getAllUsers() {
		// TODO Auto-generated method stub
		Connection c=null;
		ArrayList<Utente>users=new ArrayList<Utente>();
		try {
			c=data.getConnection();
			String query="SELECT email, nome, cognome, password, saldo\r\n" + 
					"	FROM public.\"Utente\";";
			PreparedStatement statmnt=c.prepareStatement(query);
			ResultSet results=statmnt.executeQuery();
			while(results.next()) {
				String email=results.getString("email");
				String nome=results.getString("nome");
				String cognome=results.getString("cognome");
				users.add(new Utente(nome,cognome,email,"",0));
			}
		}
		catch (Exception e){
			try {
				c.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		finally {
			try {
				c.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return users;
	}
	
		
	
}
