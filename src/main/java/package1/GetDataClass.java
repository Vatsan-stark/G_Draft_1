package package1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class GetDataClass extends LoginServlet
{
	private static final long serialVersionUID = 1L;
	ConnectionClass c=new ConnectionClass();
	Connection con= c.Conect();
	public String SearchedName,SearchedUsername,searchedprofile_picture;
	public int Searchedid,SearchedFollowerCount,SearchedFollowingCount;
	public	String username,name,email,password,profile_picture;
	public int id;
	public boolean flag;
	
	public void getUserData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
  	{		
	  	 username=request.getParameter("txtusername");
	  	 name=request.getParameter("txtname");
	  	 email=request.getParameter("txtemail");
	  	 password=request.getParameter("txtpwd");
  	}
	public void UploadUserData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		  try 
		  {
				PreparedStatement ps=con.prepareStatement("insert into users(email,name,username,password) values(?,?,?,?)" );
				ps.setString(1, email);
				ps.setString(2, name);
				ps.setString(3, username);
				ps.setString(4, password);
				ps.executeUpdate();
		  } 
		  catch (SQLException e) 
		  {
			e.printStackTrace();
		  }
	}
  
  
  public void RetUserData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
  {
	  try
	  {
		  	String name1=request.getParameter("txtname");
			String pass1=request.getParameter("txtpwd");
			PreparedStatement ps=con.prepareStatement("select * from users where username=? and password=?");
			ps.setString(1, name1);
			ps.setString(2, pass1);
			ResultSet rs= ps.executeQuery();
			rs.next();
			name=rs.getString("name");
			email=rs.getString("email");
			username=rs.getString("username");
			id=rs.getInt("id");
			profile_picture=rs.getString("profile_picture");
	  } 
	  catch (SQLException e) 
	  {
			e.printStackTrace();
	  }
			
  }
  
  
  public void RetUserData(String Uname) throws  IOException 
  {
	  try
	  {
			PreparedStatement ps=con.prepareStatement("select * from users where username=?");
			ps.setString(1,Uname );
			ResultSet rs= ps.executeQuery();
			rs.next();
			if(rs.getString("name")==null) 
				flag=false;
			else {
				flag=true;
			name=rs.getString("name");
			email=rs.getString("email");
			username=rs.getString("username");
			id=rs.getInt("id");
			profile_picture=rs.getString("profile_picture");
			}
	  } 
	  catch (SQLException e) 
	  {
			e.printStackTrace();
	  }
  }
  
  public void Search(HttpServletRequest request, HttpServletResponse response,String searchid) throws ServletException, IOException 
  {
		RetUserData(searchid);
		if(flag==false) 
		{
			PrintWriter out=response.getWriter();
			out.println("<font>User Not Found");
			response.sendRedirect("usernotfound.html");
			return;
		}
		SearchedName=name;
		SearchedUsername=username;
		searchedprofile_picture=profile_picture;
		Searchedid=id;
		FollowerInfo f=new FollowerInfo();
		SearchedFollowerCount=f.Retfollower(request, response,Searchedid);
		SearchedFollowingCount=f.Retfollowing(request, response, Searchedid);
	//	RequestDispatcher rd=request.getRequestDispatcher("/searchpage.jsp");
	//	rd.forward(request, response);
  }

}
