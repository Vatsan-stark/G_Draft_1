package package1;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;


public class LogoutServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		 Cookie[] cookies = request.getCookies();
		    if (cookies != null)
		        for (Cookie cookie : cookies) 
		        {
		        	cookie.setValue(null);
		            cookie.setMaxAge(0);
		            response.addCookie(cookie);
		           
		        }
		    HttpSession session=request.getSession();
		    session.setAttribute("id", null);
		    System.out.println(session.getAttribute("id"));

		    session.invalidate();
		   
		    response.sendRedirect("login.jsp");
		
		
	}

}
