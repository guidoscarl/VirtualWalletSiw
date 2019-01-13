package persistence.dao;

import Excepions.EmailAlreadyUsed;
import Excepions.UsersNotFound;
import models.Utente;

public interface UtenteDao {
	void save(Utente u) throws EmailAlreadyUsed;
	Utente getByPrimaryKey(String email, String pass) throws UsersNotFound;
	void update(Utente u);
	
}
