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
import java.sql.SQLException;


public class CommentServlet extends HttpServlet 
	{
	//i edited this file in GitHub	
		private static final long serialVersionUID = 1L;
		ConnectionClass c= new ConnectionClass();
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
		{	
			int userid=0;
			HttpSession session = request.getSession();
			userid=(int) session.getAttribute("id");
		//	System.out.println("userid in session: "+ userid); 
			String comment = request.getParameter("comment");
			int postid=Integer.parseInt(request.getParameter("poi"));
			System.out.println("userid:"+userid+" Comment:"+comment+" postid:"+postid);
			insertcomment(comment,postid,userid);
			RequestDispatcher rd= request.getRequestDispatcher("/homepage.jsp");
			rd.forward(request, response);
		}
		public void insertcomment(String comment, int postid,int userid) 
		{
			Connection con=c.Conect();
			try 
			{
				PreparedStatement ps=con.prepareStatement("insert into comments (post_id,user_id,comment) values(?,?,?)");
				ps.setInt(1, postid);
				ps.setInt(2, userid);
				ps.setString(3, comment);
				ps.executeUpdate();
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
		
	
	}
