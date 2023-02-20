package package1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GD 
{	ConnectionClass c= new ConnectionClass();
	Connection con = c.Conect();
	public String RetUserName(int userid) throws ClassNotFoundException, SQLException 
	{
		PreparedStatement ps=con.prepareStatement("select username from users where id=?");
		ps.setInt(1,userid );
		ResultSet rs= ps.executeQuery();
		rs.next();
		String username=rs.getString("username");
		return username;
	}
	public String RetDP(int userid) throws ClassNotFoundException, SQLException 
	{
		PreparedStatement ps=con.prepareStatement("select profile_picture from users where id=?");
		ps.setInt(1,userid );
		ResultSet rs= ps.executeQuery();
		rs.next();
		String username=rs.getString("profile_picture");
		return username;
	}
}

		
	


	