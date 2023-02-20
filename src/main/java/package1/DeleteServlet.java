package package1;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class DeleteServlet extends HttpServlet 
{
	ConnectionClass c= new ConnectionClass();
	Connection con=c.Conect();
	
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out=response.getWriter();
		System.out.println("delete servlet");
		HttpSession session = request.getSession();
		int userid=Integer.parseInt(session.getAttribute("id").toString());
		LocalStorageManager lsm = new LocalStorageManager();
		lsm.deleteDir(userid);
		PreparedStatement ps;
		try 
			{
				ps = con.prepareStatement("DELETE FROM users WHERE id=?;");
				ps.setInt(1, userid);
				ps.executeUpdate();
				
			//	PrintWriter out=response.getWriter();
				System.out.println("account deleted");
				out.println("<font color=red size=18 align=center padding=20%>Your account has been deleted permanently<br>");
				out.println("<a href=login.jsp>Login page</a>");
			} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		
	}

}
