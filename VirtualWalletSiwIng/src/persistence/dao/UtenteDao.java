package persistence.dao;

import java.util.ArrayList;

import Excepions.EmailAlreadyUsed;
import Excepions.UsersNotFound;
import models.Utente;

public interface UtenteDao {
	void save(Utente u) throws EmailAlreadyUsed;
	Utente getByPrimaryKey(String email, String pass);
	void update(Utente u);
	void transaction(Utente mittente,Utente destinatario,int importo);
	Utente getUtenteforTransaction(String email) throws UsersNotFound;
	boolean existUtente(String email);
	ArrayList<Utente> getAllUsers();
	String getImage(String email);
	void setImage(String email, String source);
	void activeProfile(String email);
	
	
}
