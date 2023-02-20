package package1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PostHandlerClass 
{
	ConnectionClass c= new ConnectionClass();
	Connection con=c.Conect();
	void uploadpost(int userid,String caption,String path) 
	{
		 try 
		 {
				PreparedStatement ps=con.prepareStatement(" insert into posts(user_id,caption,image) values(?,?,?);");
				ps.setInt(1, userid);
				ps.setString(2, caption);
				ps.setString(3, path);
				ps.executeUpdate();
				System.out.println("post updated into database succesfully");
		 } 
		 catch (SQLException e) 
		 {	
		 		e.printStackTrace();
		 }
	}
	public ResultSet showPersonalisedPost(int user_id) 
	{
		try {
			PreparedStatement ps= con.prepareStatement("select users.id  as main_id, users.username,users.profile_picture,posts.id as post_id,posts.caption,posts.image from((users inner join follows on follows.follower_id=? and users.id=follows.user_id) inner join posts on posts.user_id=users.id)where not users.id=? order by posts.created_at desc;");
			ps.setInt(1, user_id);
			ps.setInt(2, user_id);
			ResultSet personalisedPosts = ps.executeQuery();
			return personalisedPosts;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;	
	}
	public ResultSet exploreFeed(int user_id) 
	{
		try 
		{
			PreparedStatement ps= con.prepareStatement("select users.id as main_id, users.username,users.profile_picture,posts.id as post_id,posts.caption,posts.image from( users inner join posts on posts.user_id=users.id)where not users.id=? order by posts.created_at desc;");
			ps.setInt(1, user_id);
			ResultSet rs = ps.executeQuery();
			return rs;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ResultSet retpost(int userid) 
	{
		try 			
		{
			PreparedStatement ps=con.prepareStatement(" select* from Posts where user_id=? order by created_at desc;");
			ps.setInt(1, userid);
			ResultSet rs= ps.executeQuery();
			return rs;
//						System.out.println(path=rs.getString("image"));
//						rs.next();
//						System.out.println(path=rs.getString("image"));
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			return null;
	}
	public ResultSet showpost() 
	{
		try 
		{
			PreparedStatement ps=con.prepareStatement(" select* from Posts order by created_at desc;");
			ResultSet rs= ps.executeQuery();
			return rs;
		}
		catch(  SQLException e){
			
		}
		return null;
		
	}
	public ResultSet retcomments(int postid) 
	{
		try 
		{
			PreparedStatement ps=con.prepareStatement("select * from comments where post_id=? order by created_at desc");
			ps.setInt(1, postid);
			ps.executeQuery();
			ResultSet rs= ps.getResultSet();
			return rs;
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return null;
	}
	

}
