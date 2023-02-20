package package1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LikeFunctions 
{
	ConnectionClass c= new ConnectionClass();
	Connection con=c.Conect();
	public int countlikes(int postid) 
	{
		int likecount=0;
		try 
		{
			PreparedStatement ps = con.prepareStatement("Select count(post_id) from likes where post_id=?;");
			ps.setInt(1, postid);
			ResultSet rs= ps.executeQuery();
			rs.next();
			likecount=rs.getInt(1);
			return likecount;
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}	
		return likecount;
	}
	public boolean hasliked(int postid, int userid) 
	{
		try 
		{
			PreparedStatement ps = con.prepareStatement("Select exists(select * from likes where post_id=? and user_id = ?)as hasliked;");
			ps.setInt(1, postid);
			ps.setInt(2, userid);
			ps.executeQuery();
			ResultSet rs= ps.getResultSet();
			rs.next();
			boolean hasliked=rs.getBoolean(1);
			return hasliked;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
}
