package package1;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class FollowerInfo 
{
	ConnectionClass c= new ConnectionClass();
	Connection con=c.Conect();
	int followercount,followingcount;
	public int Retfollowing(HttpServletRequest request, HttpServletResponse response,int id) throws ServletException, IOException  
	{
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT COUNT(id)from follows WHERE follower_id=?;");
			ps.setInt(1, id);
			ResultSet rs= ps.executeQuery();
			rs.next();
			followercount=rs.getInt(1);
			//System.out.println(followercount);
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		} 
		return followercount;
	}
	
	
	public int Retfollower(HttpServletRequest request, HttpServletResponse response,int id) throws ServletException, IOException  
	{
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT COUNT(id)from follows where user_id=?");
			ps.setInt(1, id);
			ResultSet rs= ps.executeQuery();
			rs.next();
			followercount=rs.getInt(1);
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		} 
		return followercount;
	}
	
	
	
	
	public int Retpostcount(HttpServletRequest request, HttpServletResponse response,int id) throws ServletException, IOException  
	{
		try {
			PreparedStatement ps=con.prepareStatement("SELECT COUNT(user_id)from posts where user_id=?");
			ps.setInt(1, id);
			ResultSet rs= ps.executeQuery();
			rs.next();
			followercount=rs.getInt(1);
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		} 
		return followercount;
	}

}
