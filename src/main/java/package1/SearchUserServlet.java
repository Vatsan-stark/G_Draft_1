package package1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/SearchUserServlet")
public class SearchUserServlet {
	//private static final long serialVersionUID = 1L;
	public String SearchedName,SearchedUsername,searchedprofile_picture;
	public int Searchedid,SearchedFollowerCount,SearchedFollowingCount;
	public void Search(HttpServletRequest request, HttpServletResponse response,String searchid) throws ServletException, IOException 
	{
//		System.out.println("data entered in search box "+searchid);
		GetDataClass gd= new GetDataClass();
		gd.RetUserData(searchid);
		SearchedName=gd.name;
		SearchedUsername=gd.username;
		searchedprofile_picture=gd.profile_picture;
		Searchedid=gd.id;
		FollowerInfo f=new FollowerInfo();
		SearchedFollowerCount=f.Retfollower(request, response,Searchedid);
		SearchedFollowingCount=f.Retfollowing(request, response, Searchedid);
	//	RequestDispatcher rd=request.getRequestDispatcher("/searchpage.jsp");
	//	rd.forward(request, response);
	}

}
