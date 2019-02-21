package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
		ArrayList<Message> mes = new ArrayList<Message>();
		Connection c=null;
		String query="SELECT *\r\n" + 
				"	FROM public.message\r\n" + 
				"	where \"receiver\"=? and \"displayed\"=false;";
		try {
			c=data.getConnection();
			PreparedStatement st = c.prepareStatement(query);
			st.setString(1, receiver);
			
			ResultSet messages=st.executeQuery();
			while(messages.next()) {
				String sender=messages.getString("sender");
				
				String value=messages.getString("value");
				String date=messages.getString("date");
				Message m = new Message(sender, receiver, value, date);
				mes.add(m);
			}
			String vis="UPDATE public.message\r\n" + 
					"	SET \"displayed\"=true \r\n" + 
					"	WHERE \"receiver\"=?;";
			st=c.prepareStatement(vis);
			st.setString(1, receiver);
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
		return mes;
	}
	@Override
	public void sendMessage(Message m) {
		Connection c=null;
		String query="INSERT INTO public.message(\r\n" + 
				"	sender, receiver, value, displayed, date)\r\n" + 
				"	VALUES (?, ?, ?, false, ?);";
		try {
			
			c=data.getConnection();
			
			PreparedStatement st = c.prepareStatement(query);
			st.setString(1, m.getSender());
			st.setString(2, m.getReceiver());
			st.setString(3, m.getValue());
			st.setString(4, m.getDate());
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
	@Override
	public boolean haveMessage(String receiver) {
		boolean result=false;
		
		Connection c=null;
		String query="SELECT *\r\n" + 
				"	FROM public.message\r\n" + 
				"	where \"receiver\"=? and \"displayed\"=false;";
		try {
			c=data.getConnection();
			PreparedStatement st = c.prepareStatement(query);
			st.setString(1, receiver);
			
			ResultSet messages=st.executeQuery();
			if(messages.next()) {
				result=true;
			}
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
		return result;
	}

}
