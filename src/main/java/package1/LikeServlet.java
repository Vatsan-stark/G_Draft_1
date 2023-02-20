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

public class LikeServlet extends HttpServlet {
	ConnectionClass c= new ConnectionClass();
	Connection con=c.Conect();
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String address;
		HttpSession session=request.getSession();
		int id=(int) session.getAttribute("id");
//		System.out.println(request.getParameter("pos"));
		int postid=Integer.parseInt(request.getParameter("pos").toString());
		try 
		{
			LikeFunctions lf= new LikeFunctions();
			boolean hasliked=lf.hasliked(postid, id);
			
			if(hasliked!=true)
			{
				PreparedStatement ps=con.prepareStatement("insert into likes(post_id,user_id) values(?,?)	");
				ps.setInt(1, postid);
				ps.setInt(2, id);
				ps.executeUpdate();
//				System.out.println("like executed postid:"+postid+"  userid:"+id);
			}
			else
			{
				PreparedStatement ps=con.prepareStatement("delete from likes where post_id=? and user_id=?;");
				ps.setInt(1, postid);
				ps.setInt(2, id);
				ps.execute();	
//				System.out.println("unlike executed postid:"+postid+" userid:"+ id);
			}
			int count = lf.countlikes(postid);
			
			response.getWriter().write(String.valueOf(count));
			response.getWriter().write(String.valueOf(","+hasliked));
			
//			int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
//			if(pageNumber==3) {
//				 address="/explorepage.jsp";
//			}
//			else {
//				 address="/homepage.jsp";
//			}
//				
//			RequestDispatcher rd = request.getRequestDispatcher(address);
//			rd.forward(request, response);
//		
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}

	
	}
	
}