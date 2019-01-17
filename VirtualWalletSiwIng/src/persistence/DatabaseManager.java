package persistence;

public class DatabaseManager {
private static DatabaseManager instance = null;
	
	public static DatabaseManager getInstance(){
		if (instance == null){
			instance = new DatabaseManager();
		}
		return instance;
	}
	
	private PostgresDAOFactory daoFactory;
		
	private DatabaseManager() {
		daoFactory = new PostgresDAOFactory();
	}
	
	public PostgresDAOFactory getDaoFactory() {
		return daoFactory;
	}
}
