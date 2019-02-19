package persistence.dao;

import java.util.ArrayList;

import javafx.util.Pair;
import models.Friendship;

public interface AmiciziaDao {
	public void sendRequest(String sender, String receiver);
	public ArrayList<Friendship>  getRequest(String receiver);
	public void acceptRequest(int id);
	public void rejectRequest(int id);
	public ArrayList<Friendship> getSended(String sender);
	public Pair<Integer,String> checkRelation(String first, String second );
	
}
