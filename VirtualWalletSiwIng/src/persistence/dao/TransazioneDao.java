package persistence.dao;

import java.util.ArrayList;
import java.util.TreeSet;

import javafx.collections.transformation.SortedList;
import models.Transazione;

public interface TransazioneDao {
	
	public static final int DESTINATARIO=1;
	public static final int MITTENTE=2;
	ArrayList<Transazione> getByEmail(String email, int type);
	
}
