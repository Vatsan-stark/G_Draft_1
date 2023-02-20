package package1;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FollowClass 
{
	ConnectionClass c=new ConnectionClass();
	Connection con=c.Conect();
	boolean a;
	public boolean checkfollow(int id, int SearchID) 
	{
		
		try 
		{	
			PreparedStatement p=con.prepareStatement("select exists(select * from follows where user_id=? and follower_id=?) As x;");
			p.setInt(1, SearchID);
			p.setInt(2, id);
			p.executeQuery();
			ResultSet rs=p.getResultSet();
			rs.next();
			
			a=rs.getBoolean("x");
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return a;
	}
	
	public boolean follow(int id, int searchId) 
	{
		try 
		{
			PreparedStatement ps=con.prepareStatement("insert into follows (follower_id,user_id) values(?,?);");
			ps.setInt(1, id);
	 		ps.setInt(2, searchId);
	 		ps.executeUpdate();
//	 		System.out.println("ok");
//	 		System.out.println(id +"follows");
//	 		System.out.println(searchId);
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return true;
		
	}
	public void unfollow(int id, int searchId) {
	 	try 
	 	{	
	        PreparedStatement ps=con.prepareStatement("DELETE FROM follows where follower_id=? and user_id=?;");
	     	ps.setInt(1, id);
	     	ps.setInt(2, searchId);
	     	ps.executeUpdate();
		}
	    catch(SQLException e)
	 	{
	     	e.printStackTrace();
	    }
	}
	public void followActions(int id, int searchedid, boolean flag) 
	{
		if(flag==false) 
		{
			try 
			{
				PreparedStatement ps = con.prepareStatement("insert into follows (follower_id,user_id) values(?,?);");
				ps.setInt(1, id);
		 		ps.setInt(2, searchedid);
		 		ps.executeUpdate();
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
//	 		System.out.println("ok");
//	 		System.out.println(id +"follows");
//	 		System.out.println(searchedid);
		}
		else 
		{
			try 
			{
				PreparedStatement	ps=con.prepareStatement("DELETE FROM follows where follower_id=? and user_id=?;");
		     	ps.setInt(1, id);
		     	ps.setInt(2, searchedid);
		     	ps.executeUpdate();
			}
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
	}

}




