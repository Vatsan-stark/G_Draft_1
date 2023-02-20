package package1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;	
	GetDataClass gd = new GetDataClass();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		gd.getUserData(request, response);
		gd.UploadUserData(request, response);
		gd.RetUserData(request, response);
		LocalStorageManager lsm = new LocalStorageManager();
		int id= gd.id;
		lsm.createNewDir(id);
		
		response.sendRedirect("login.jsp");
	}

}		
		
		








		


















/*		
//			String email=request.getParameter("txtemail");
//			String name=request.getParameter("txtname");
//			String username=request.getParameter("txtusername");
//			String pass=request.getParameter("txtpwd");
//			String repass=request.getParameter("repwd");
//		
		
	//if(name!=""&&pass!=""&&   repass.contentEquals(pass)) {
	
		RequestDispatcher dispatcher =null;
		
		try 
		{	
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gram1","root", null);
			PreparedStatement ps=con.prepareStatement("insert into user_info(email,name,username,password) values(?,?,?,?)" );
			ps.setString(1, gd.email);
			ps.setString(2, gd.name);
			ps.setString(3, gd.username);
			ps.setString(4, gd.password);
			

			ps.executeUpdate();
			response.sendRedirect("homepage.jsp");
			//dispatcher	= request.getRequestDispatcher("login.jsp");
//			if(a>0) {
//				System.out.print("\n\nSigned uo");
//				//out.println("I sm singnup");
//				request.setAttribute("Status", "Success");
//			}
//			else {
//				System.out.print("\n\nFailed");
//				request.setAttribute("Status", "Failed");
//			}
			//dispatcher.forward(request, response);
			
			
			
		} catch (Exception e) 
		
		{
			e.printStackTrace();					}
	}
//		else {
//			PrintWriter out=response.getWriter();
//			out.print("<div align=center><font color=red size= 20 >Check your data<br> <a href=SignUp.jsp>try again<a></div>");
			
//		}
	
	*/

