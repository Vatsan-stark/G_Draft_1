package package1;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;


   
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
public int id;
private static final long serialVersionUID = 1L;

    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		
			GetDataClass gd = new GetDataClass();
			gd.RetUserData(request, response);
			String username=gd.username; 
			id=gd.id;
			Cookie CK=new Cookie("idi",String.valueOf(id));
			CK=new Cookie("username",username);
			response.addCookie(CK);
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			session.setAttribute("id", id);
//			System.out.println("from login page: session username & userid: "+session.getAttribute("username")+" "+session.getAttribute("id"));
			PrintWriter out=response.getWriter();
			if(id>0)
			{
				out.println("Login Successfull");
				RequestDispatcher rd=request.getRequestDispatcher("/homepage.jsp");
				gd.RetUserData(username);
				rd.forward(request, response);
			}
			else 
			{
				out.println("<font color=red size=18 align=center padding=20%>Login Failed!<br>");
				
				out.println("<a href=login.jsp>Try Again</a>");
			}
			
			
	}

}
