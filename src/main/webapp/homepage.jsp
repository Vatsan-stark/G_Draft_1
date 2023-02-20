<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpServlet"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="package1.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
		<%
			 response.setHeader("Cache-Control", "no-cache");
			 response.setHeader("Cache-Control", "no-store");
			 response.setHeader("Pragma", "no-cache");
			 response.setDateHeader("Expires", 0);
		%>
<!DOCTYPE html>
<html>
	 
	<head>
		<meta charset="UTF-8">
		<title>Home Gram</title>
<%@include file="headders/headers.jsp" %>
		<style type="text/css">
			h1,text,font 
			{
			color: #262626
			}
			</style>
		

	</head>
	<body style="background-color: #f2e9e4 ; color: #262626">
			<%		
				if(session.getAttribute("username").equals(null))
				{
			%> 
				<a href="login.jsp"> session expired , click to login again</a>
			<% 
				}
				String name = session.getAttribute("username").toString();
				
			%>
<!-- Navigation Bar form Templates -->
			<%@include file="Templates/navbarTemplate.jsp" %>
<!-- Navigation bar Ends -->
		
<!-- Welcome message with user name -->					
			<h1 class="h1" align="center" style="font: italic; font-family:sans-serif; padding :2%;margin: auto;">Welcome  <% out.print(name.toUpperCase()); %></h1>
<!-- welcome message ends  -->


<!-- individual posts -->
			<div class="container">
				<%
					int count=0;
					String username = session.getAttribute("username").toString();
					int user_id=Integer.parseInt(session.getAttribute("id").toString() );
					PostHandlerClass postHandler= new PostHandlerClass();
					ResultSet personalisedPosts=postHandler.showPersonalisedPost(user_id);
					LikeFunctions lf= new LikeFunctions();
					
					while(personalisedPosts.next())
					{
						count++;
						String postUserName=personalisedPosts.getString("username");
						String  profilePicture =  personalisedPosts.getString("profile_picture");
						int postId = personalisedPosts.getInt("post_id");
						String caption = personalisedPosts.getString("caption");
						String pathOfPost = personalisedPosts.getString("image");
						
						
						
						int likes=lf.countlikes(postId);
						if(profilePicture==null)
						{
							profilePicture="GramImages/DefaultDP.png";	
						}
					%>
					<div class="row" style="margin: 20px;border-radius: 10px"> 
											<div style="border-radius: 10px" class="row g-0 bg-light position-relative">
											  	<div class="col-md-6 mb-md-0 p-md-4">
											   		 <img style="max-width: 480px;max-height: 700px;resize: both;border: 1px #8E8E8E groove;border-radius: 10px" src="<%=pathOfPost %>" class="w-100" alt="...">
											  	</div>
										 		 <div class="col-md-6 p-4 ps-md-0" >
										  			<img class="d-inline-block align-text-center" src="<%=profilePicture %>"alt="" width="40" height="40" style="resize: both; max-height: 35px;max-width: 35px;border-radius: 50%;margin-right:5px; " >
										    		<button class= "btn" value="<%=postUserName%>" name="usernamebutton">
										    		<h3 style="display: inline-block ;font-size:35px;font-stretch:extra-expanded;text-decoration:underline;  ; " class="mt-0" > <%=postUserName %></h3><br>
										   			</button>
										   			<p><%=caption %></p>
										    		
				<!-- comments section -->
							    		<div style="background-color: white ;border:1px #CED4D9 solid;border-radius:10px;margin-left:0px;margin-right:10px;margin-bottom:20px;padding:15px;   "> 
							    			<form class="d-flex" action="CommentServlet" method="post">
							    				<input type="hidden" value="<%=postId %>" name="poi" >
										        <input class="form-control me-2" type="text" placeholder="Add a Comment..." name="comment" id="comment">
										        <button  class="btn btn-outline-dark" type="submit"  value="<%=postId%>" name="cmtbtn" id="postid">post</button>
							      			</form>
							      			<div style="overflow-y: scroll; height:100px;">
							      			<table>
							      			<%
							      			ResultSet comments=postHandler.retcomments(postId);
							      			int i=0;
							      			while(comments.next()){
							      				int userid=comments.getInt("user_id");
							      				GD gd=new GD();
							      				String C_name=gd.RetUserName(userid);
							      				String comment = comments.getString("comment");	i++;						      			
							      			%>
								    				<tr><td><i><%=C_name %></i></td><td>: </td> <td><%= comment%></td></tr>
								    				<%} %>
								    		</table>
								    		</div>
							    		</div>
				<!-- comments section Ends -->			    
									    <div align="right" style="float: right;" >
<!-- 									    <form action="LikeServlet" method="post" > -->
									   	 
									    	<%
									    	String color;
									    		if(lf.hasliked(postId, user_id)!=true){
									    			 color="btn-secondary";
									    		}
									    		else{
									    			color="btn-danger";
									    		}
									    	%>
										    <button  class="btn <%=color %>" value="<%=postId %>" name="pos" > 
										  		<i id="<%=postId%>" style="color: white;width: 4px" class="bi bi-heart-fill"> : <%=likes %></i>
										  	</button>
<!-- 										</form> -->
									    </div>
							  		</div>
								</div>
					      </div>
				
<!-- individual posts  End-->
		
								<%}
						
								if(count<1)
								{
									%>
									
									<div align="center">
									<h3> you dont follow anyone </h3><br>
									<a href="explorepage.jsp">explore more</a>
									</div>
									<% 
								}
								%>

</div>

	<!-- logout template -->
								<%@include file ="Templates/logoutTemplate.jsp"%>
	<!-- logout template end -->
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
	<!-- Js components -->
	<script>
	
	
	
	
	
	//like buttons
	let likeBtns = document.getElementsByName("pos");
	likeBtns.forEach(function(likeBtn) {
	    let postId = likeBtn.value;
	    likeBtn.onclick = function() {
	        let xhttp = new XMLHttpRequest();
	        xhttp.onreadystatechange = function() {
	            if (this.readyState == 4 && this.status == 200) {
	                console.log("LIKED = " + postId);
	                console.log(this.response);
	                let a= this.responseText.indexOf(",");
	                let b= this.responseText.substring(a+1);
	                console.log(b);
	                document.getElementById(postId).innerText = " : "+this.responseText.substring(0,a);
	                
	                if(b=="false"){
	                    likeBtn.classList.remove("btn-secondary");
	                    likeBtn.classList.add("btn-danger");
	                }
	                else{
	                    likeBtn.classList.remove("btn-danger");
	                    likeBtn.classList.add("btn-secondary");

	                }
	            }
	        };
	        xhttp.open("POST", "/G_Draft_1/LikeServlet?pos=" + postId);
	        xhttp.send();
	    };
	});
	//username buttons
	let usernamebuttons =document.getElementsByName("usernamebutton");
    usernamebuttons.forEach(function(usernamebutton){
        var uname = usernamebutton.value;
        
        usernamebutton.onclick= function(){
		console.log(uname);
        	 window.location.assign("http://localhost:8080/G_Draft_1/otherUserProfile.jsp?uid="+usernamebutton.value);
        }
    });
	
	</script>
	</body>
</html>



