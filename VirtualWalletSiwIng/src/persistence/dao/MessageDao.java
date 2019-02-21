package persistence.dao;

import java.util.ArrayList;

import models.Message;

public interface MessageDao {
	ArrayList<Message> getMessages(String receiver);
	void sendMessage(Message m);
	boolean haveMessage(String receiver);
}
