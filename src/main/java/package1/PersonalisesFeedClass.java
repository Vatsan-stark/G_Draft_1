package package1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PersonalisesFeedClass 
{
	ConnectionClass c= new ConnectionClass();
	Connection con= c.Conect();
	public ResultSet showPersonalisedPost(int user_id) 
	{
		try {
			PreparedStatement ps= con.prepareStatement("select users.id  as main_id, users.username,users.profile_picture,posts.id as post_id,posts.caption,posts.image from((users inner join follows on follows.follower_id=? and users.id=follows.user_id) inner join posts on posts.user_id=users.id) order by posts.created_at desc;");
			ps.setInt(1, user_id);
			ResultSet personalisedPosts = ps.executeQuery();
			return personalisedPosts;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;	
	}
	

}
