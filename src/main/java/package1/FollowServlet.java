package package1;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class FollowServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	System.out.println("follow servlwt");
		ConnectionClass c= new ConnectionClass();
		Connection con=c.Conect();
		HttpSession session =request.getSession();
		int id = Integer.parseInt(session.getAttribute("id").toString());
		String searchid	= session.getAttribute("search").toString();
		GetDataClass gd = new GetDataClass();
		gd.RetUserData(searchid);
		int SearchID=gd.id;
		try 
		{
				PreparedStatement p=con.prepareStatement("select exists(select * from follows where user_id=? and follower_id=?) As x;");
				p.setInt(1, SearchID);
				p.setInt(2, id);
				p.executeQuery();
				ResultSet rs=p.getResultSet();
				rs.next();
				boolean a=rs.getBoolean("x");	
//				System.out.println("boolean x "+a);//select exists(select* from follows where user_id=5 and follower_id=3);
				if(a==false) 
				{
					PreparedStatement ps=con.prepareStatement("insert into follows (follower_id,user_id) values(?,?);");
					ps.setInt(1, id);
					ps.setInt(2, SearchID);
					ps.executeUpdate();
					System.out.println("followed");
					response.getWriter().write("Following");
//					System.out.println("ok");
//					System.out.println(id +"follows");
//					System.out.println(SearchID);
				}
				else 
				{
					PreparedStatement ps=con.prepareStatement("DELETE FROM follows where follower_id=? and user_id=?;");
					ps.setInt(1, id);
					ps.setInt(2, SearchID);
					ps.executeUpdate();
					System.out.println("unfolso");
					response.getWriter().write("Follow");
				}
				// rd=request.getRequestDispatcher("/searchpage.jsp");
				//rd.forward(request, response);
		} 
		catch (SQLException e) 
		{
				e.printStackTrace();	
		}
	}
}
