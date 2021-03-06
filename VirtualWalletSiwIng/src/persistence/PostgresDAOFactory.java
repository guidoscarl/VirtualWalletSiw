package persistence;

import java.util.ArrayList;

import models.Transazione;
import persistence.dao.AmiciziaDao;
import persistence.dao.MessageDao;
import persistence.dao.TransazioneDao;
import persistence.dao.UtenteDao;

public class PostgresDAOFactory {
	
	private static DataSource dataSource;
	public PostgresDAOFactory(){
		try {
			try {
				Class.forName("org.postgresql.Driver").newInstance();
			} catch (InstantiationException | IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String user="qmpwuofg";
			String pass="ZaJ3gx7qVae8rjFyY4LhoXFtTNSuF_EG";
			String uri="jdbc:postgresql://baasu.db.elephantsql.com:5432/qmpwuofg";
			dataSource=new DataSource(uri,user,pass);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	
	public UtenteDao getUtenteDao() {
		return new UtenteDaoJdbc(dataSource);
		
	}
	
	public TransazioneDao getTransazioneDao() {
		return new TransazioneDaoJdbc(dataSource); 
			
			
	}
	
	public AmiciziaDao getAmiciziaDao() {
		return new AmiciziaDAOJdbc(dataSource);
	}
	
	public MessageDao getMessageDao() {
		return new MessageDaoJdbc(dataSource);
	}

}
