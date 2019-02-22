package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javafx.util.Pair;
import models.Friendship;
import persistence.dao.AmiciziaDao;

public class AmiciziaDAOJdbc implements AmiciziaDao {
	
	private DataSource data;
	public AmiciziaDAOJdbc(DataSource d) {
		data=d;
	}
	
	@Override
	public ArrayList<Friendship> getRequest(String receiver) {
		String query="SELECT \"frstUt\", \"scndUt\", active, id\r\n" + 
				"	FROM public.friendship\r\n" + 
				"	WHERE \"scndUt\"=?;";
		ArrayList<Friendship> requests = new ArrayList<>();
		Connection conn = null;
		try {
			conn = data.getConnection();
			PreparedStatement stat = conn.prepareStatement(query);
			stat.setString(1, receiver);
			ResultSet results = stat.executeQuery();
			while(results.next()) {
				if(!results.getBoolean("active")) {
					int id =results.getInt("id");
					String email = results.getString("frstUt");
					Friendship f = new Friendship(id, "", "", email, "");
					requests.add(f);
				}
			}
			conn.close();
		}
		catch(Exception e) {
			try {
				conn.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return requests;
	}
	
	@Override
	public void sendRequest(String sender, String receiver) {
		String query="INSERT INTO public.friendship(\r\n" + 
				"	\"frstUt\", \"scndUt\", active)\r\n" + 
				"	VALUES (?,?,false);";
		Connection conn=null;
		
		try {
			conn=data.getConnection();
			PreparedStatement stat = conn.prepareStatement(query);
			stat.setString(1, sender);
			stat.setString(2, receiver);
			stat.execute();
			conn.close();
		}
		catch(Exception e) {
			try {
				conn.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

	@Override
	public void acceptRequest(int id) {
		String query="UPDATE public.friendship\r\n" + 
				"	SET active=true\r\n" + 
				"	WHERE \"id\"=?;";
		Connection c = null;
		
		try {
			c=data.getConnection();
			PreparedStatement st = c.prepareStatement(query);
			st.setInt(1, id);
			st.executeUpdate();
			c.close();
		}
		catch(Exception e) {
			try {
				c.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
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
	public void rejectRequest(int id) {
		String query="DELETE FROM public.friendship\r\n" + 
				"	WHERE \"id\"=?;";
		Connection c = null;
		
		try {
			c=data.getConnection();
			PreparedStatement st = c.prepareStatement(query);
			st.setInt(1, id);
			st.executeUpdate();
			c.close();
		}
		catch(Exception e) {
			try {
				c.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
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
	public ArrayList<Friendship> getSended(String sender) {
		String query="SELECT \"frstUt\", \"scndUt\", active, id\r\n" + 
				"	FROM public.friendship\r\n" + 
				"	WHERE \"frstUt\"=?;";
		ArrayList<Friendship> requests = new ArrayList<>();
		Connection conn = null;
		try {
			conn = data.getConnection();
			PreparedStatement stat = conn.prepareStatement(query);
			stat.setString(1, sender);
			ResultSet results = stat.executeQuery();
			while(results.next()) {
				if(!results.getBoolean("active")) {
					int id =results.getInt("id");
					String email = results.getString("scndUt");
					Friendship f = new Friendship(id, "", "", "",email);
					requests.add(f);
				}
			}
			
		}
		catch(Exception e) {
			try {
				conn.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return requests;
		
	}

	@Override
	public Pair<Integer, String> checkRelation(String first, String second) {
		int id=0;
		String check="notexist";
		String query="SELECT \"frstUt\", \"scndUt\", active, id\r\n" + 
				"	FROM public.friendship\r\n" + 
				"	WHERE \"frstUt\"=? and \"scndUt\"=? or \"frstUt\"=? and \"scndUt\"=?;";
		Connection conn = null;
		try {
			System.out.println("Sto eseguendo..");
			conn = data.getConnection();
			PreparedStatement stat = conn.prepareStatement(query);
			stat.setString(1, first);
			stat.setString(2, second);
			stat.setString(3, second);
			stat.setString(4, first);
			ResultSet results = stat.executeQuery();
			while(results.next()) {
				boolean active = results.getBoolean("active");
				id=results.getInt("id");
				if(!active) {
					if(first.equals(results.getString("frstUt"))) {
						check="sended";
						
					}
					else if(first.equals(results.getString("scndUt")))
					{
						check="received";
					}
					
				}
				else {
					check="active";
				}
				
			}
			
		}
		catch(Exception e) {
			
		}
		finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		Pair<Integer, String> pair = new Pair<>(id,check);
		
		return pair;
	}

	@Override
	public ArrayList<Friendship> getFriends(String sender) {
		// TODO Auto-generated method stub
		String query="SELECT \"frstUt\", \"scndUt\", active, id\r\n" + 
				"	FROM public.friendship\r\n" + 
				"	WHERE (\"frstUt\"=? or \"scndUt\"=?) and \"active\"=true;";
		ArrayList<Friendship> friends=new ArrayList<Friendship>();
		Connection conn = null;
		try {
			conn = data.getConnection();
			PreparedStatement stat = conn.prepareStatement(query);
			stat.setString(1, sender);
			stat.setString(2, sender);
			ResultSet results = stat.executeQuery();
			while(results.next()) {
				
					int id =results.getInt("id");
					String first =results.getString("frstUt");
					String second = results.getString("scndUt");
					String friend = first.equals(sender)?second:first;
					Friendship f = new Friendship(id, "", "", "",friend);
					friends.add(f);
				
			}
			
		}
		catch(Exception e) {
			try {
				conn.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return friends;
	}

}
