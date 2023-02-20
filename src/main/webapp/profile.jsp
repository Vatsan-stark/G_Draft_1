<%@page import="java.sql.*"%>
<%@page import="package1.*"%>
<%@page import="java.util.*"%>
<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%@page import="jakarta.servlet.http.HttpServlet"%>
<%@page import="jakarta.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>your profile gram</title>
	<%@include file="headders/headers.jsp" %>
</head>

<body style="align-self: auto;align-content: stretch;align-items: stretch;background-color: #f2e9e4" >
	

<%@include file="Templates/navbarTemplate.jsp" %>
<%	
 
try {
	
	
	String b = session.getAttribute("username").toString();
	
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/instagram_clone","root", null);//	String name=request.getParameter("txtname");
	Statement st=con.createStatement();
	PreparedStatement ps=con.prepareStatement("select * from users where username =?;" );
    ps.setString(1,b);//User id should be imported and Linked here until then using default 2
    ResultSet rs=ps.executeQuery();
    rs.next();
    int id=rs.getInt("id");
    String name1 = rs.getString("name");
    String username=rs.getString("username");
 	String profile_picture=rs.getString("profile_picture");
 	FollowerInfo fi= new FollowerInfo();
 	int followingcount=fi.Retfollowing(request, response,id);
 	int followercount=fi.Retfollower(request, response,id);
 	int postCount =fi.Retpostcount(request, response, id);
 	

%>

	<div align = center style="margin: 32px"  >
			 <div align="center" >
				<img  class="circular" src="<%= profile_picture%>" alt="">
			</div>
			<br>
			<table style="font-size: 22pt;text-indent: 1em">
				<tr>
					<td >Name  </td><td>:</td>
					<td ><%=name1%></td>
				</tr>
				<tr>
					<td >User-Name  </td><td>:</td>
					<td ><%=username%></td>
				</tr>
				<tr>
					<td >Followers </td><td>:</td>
					<td ><%=followercount%></td>
				</tr>
				<tr>
					<td >Following </td><td>:</td>
					<td ><%=followingcount%></td>
				</tr>
				<tr>
					<td >Posts </td><td>:</td>
					<td ><%=postCount%></td>
				</tr>
			</table>
			<br>
			<form action="editprofile.jsp" method="post">
				<button type="submit" class="btn btn-outline-primary">
				  Edit Profile Picture 
				</button>
			</form>
			<br>
			<button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
				  Delete My Account
			</button>

	</div>

	<div align="center" class="container" style="align-content: stretch;align-items: stretch;align-self: auto;max-width: 1080px">
  		
    		
    		<%
    		PostHandlerClass po= new PostHandlerClass();
    		 ResultSet post = po.retpost(id);
    		 String pathofpost;
    		if( post.next())
    		for(int i=0;i<postCount;i+=3){
    			
    			
    			 pathofpost=post.getString("image");
    			 
    			 
    			 
    		%>
    		<div class="row">
    		


    		<div class="col">
      			<figure class="figure">
    				<img style="width:350px;height:auto;" src="<%=post.getString("image") %>" class="figure-img img-fluid rounded" alt="" >
  				</figure>
  			</div>
  			<%if(post.next()){ %>
  			
  			<div class="col">
      			<figure class="figure">
    				<img style="width:350px;height:auto;" src="<%=post.getString("image") %>" class="figure-img img-fluid rounded" alt="post link" >
  				</figure>
		   	</div>
		   	<%}if(post.next()){ %>
		    <div class="col">
			    <figure class="figure">
	    			<img style="width:350px;height:auto;"  src="<%=post.getString("image") %>" class="figure-img img-fluid rounded" alt="post link" >
	  			</figure>
		    </div>
		    
  		</div>
  		<%}
  			if(post.next());
    		} 
  			%>
	</div>
      	
	<%
		}
		 catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
		e.printStackTrace();
		}

	%>




<!-- <script type="text/javascript"> -->
<!-- // img = document.getElementById("po"); -->

<!-- // function enlargeImg() { -->
    
<!-- //     img.style.transform = "scale(2)"; -->
<!-- //     img.style.align="center"; -->
<!-- //     img.style.transition = "transform 0.25s ease"; -->
<!-- // } -->
<!-- // function resetImg() { -->
<!-- //     img.style.transform = "scale(1)"; -->
<!-- //     img.style.transition = "transform 0.25s ease"; -->
<!-- // } -->
<!-- </script> -->
<%@include file ="Templates/logoutTemplate.jsp"%>
  
  <!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Delete Account!!</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Alert: this will permanently delete your account.
        
      </div>
      <div class="modal-footer">
      <form action="DeleteServlet" method="post">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
        <button type="submit" class="btn btn-danger">Delete</button>
      </form>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>



<!-- onclick="enlargeImg()" onmouseup="resetImg()" id=po -->








