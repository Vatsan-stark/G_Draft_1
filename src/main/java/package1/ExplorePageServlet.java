package package1;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class ExplorePageServlet
 */
public class ExplorePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}
	ConnectionClass c= new ConnectionClass();
	Connection con=c.Conect();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session= request.getSession();
		int id=Integer.parseInt(session.getAttribute("id").toString());
		int followid=Integer.parseInt(request.getParameter("followid"));
		System.out.println("this is explore servlet	");
		try 
		{
				PreparedStatement p=con.prepareStatement("select exists(select * from follows where user_id=? and follower_id=?) As x;");
				p.setInt(1, followid);
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
					ps.setInt(2, followid);
					ps.executeUpdate();
//					System.out.println("ok");
//					System.out.println(id +"follows");
//					System.out.println(SearchID);
					response.getWriter().write("Following");
				}
				else 
				{
					PreparedStatement ps=con.prepareStatement("DELETE FROM follows where follower_id=? and user_id=?;");
					ps.setInt(1, id);
					ps.setInt(2, followid);
					ps.executeUpdate();
					response.getWriter().write("Follow");
				}
				
		} 
		catch (SQLException e) 
		{
				e.printStackTrace();	
		}
		
	}

}
