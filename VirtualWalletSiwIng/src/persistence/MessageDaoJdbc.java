package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import models.Message;
import persistence.dao.MessageDao;

public class MessageDaoJdbc implements MessageDao {

	private DataSource data;
	public MessageDaoJdbc(DataSource d) {
		data=d;
	}
	@Override
	public ArrayList<Message> getMessages(String receiver) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void sendMessage(Message m) {
		Connection c=null;
		String query="INSERT INTO public.message(\r\n" + 
				"	sender, receiver, value, displayed)\r\n" + 
				"	VALUES (?, ?, ?, false);";
		try {
			c=data.getConnection();
			PreparedStatement st = c.prepareStatement(query);
			st.setString(1, m.getSender());
			st.setString(2, m.getReceiver());
			st.setString(3, m.getValue());
			st.executeUpdate();
		}
		catch(Exception e) {
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
		
	}

}
