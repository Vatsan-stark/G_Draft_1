<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 

  if(session==null){
 	 response.sendRedirect("login.jsp");
  }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Explore</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">	
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<script type="text/javascript">
	        function preventBack() { window.history.forward(); }
			      	 setTimeout("preventBack()", 0);
			      	 window.onunload = function () { null };
		 </script> 
</head>
	<body style="background-color: #f2e9e4 ; color: #262626">
	
	<nav style="background-color: #1d3557" class="navbar sticky-top navbar navbar-expand-lg  navbar-dark  " >
		  <div class="container-fluid">
		    	
		    	<img src="GramImages/logo-ig-png-32453-min.png" alt="" width="30" height="24" class="d-inline-block align-text-top">
		   		<a style="" class="navbar-brand" href="homepage.jsp">Gram</a>
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
		     		 <span class="navbar-toggler-icon"></span>
		    	</button>
		    	
		    	<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
				    
				    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item">	<a class="nav-link active" aria-current="page" href="profile.jsp">Your Profile</a>	</li>
				        <li> <a class="nav-link active" aria-current="page" href="newpost.jsp">New Post</a>							</li>
				       	<li> <a class="nav-link active" aria-current="page" href="explorepage.jsp"><strong>Explore</strong></a>						</li>
				    </ul>
		      		
		      		<form class="d-flex" action="interuptsearch.jsp" method="post">
				        <input class="form-control me-2" type="search" placeholder="Search Users" aria-label="Search" name="search_id">
				        <button style="" class="btn btn-outline-light" type="submit" ><i class="bi bi-search"></i></button>
					</form>
					<button style="margin-left: 10px" type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="bi bi-power"></i></button>
		      		
		    	</div>
		  </div>
		</nav>
		<div class="container">
	
	
	<% 	PostHandlerClass p= new PostHandlerClass();
		int main_id=Integer.parseInt(session.getAttribute("id").toString());
		ResultSet randomFeed=p.exploreFeed(main_id);
		
		LikeFunctions lf= new LikeFunctions();
		//randomFeed.beforeFirst();
		while(randomFeed.next()){
		%><div class="row" style="margin: 20px;border-radius: 10px ;height:550px;padding: 10px "> 
		<% 	
		
			
			for(int i=0;i<3&&randomFeed.next() 	;i++) {
				//user details
				int user_id=randomFeed.getInt("main_id");
				String user_name=randomFeed.getString("username");
				String profile_picture=randomFeed.getString("profile_picture");
				if(profile_picture==null)
					profile_picture="GramImages/DefaultDP.png";
				//post details	
				int post_id=randomFeed.getInt("post_id");
				String caption = randomFeed.getString("caption");
				String path_of_post= randomFeed.getString("image");
				int likes=lf.countlikes(post_id);
				//follow status
				 String status="";
				FollowClass f=new FollowClass();
				if(f.checkfollow(main_id, user_id)){
					status ="following";
				}
				else{
					status="follow";
				}
				
				
			%>
		<div class="col">
			<div class="card " style="width: 24rem; max-height: 40rem;resize: both;">
			<div style="display:inline-block;padding:5px;padding-right:7px; ;border-radius: 5px;border-collapse: collapse;" >
			  	<img  class="d-inline-block align-text-center" src="<%=profile_picture %>"alt="" width="40" height="40" style="border-radius:0% resize: both; max-height: 35px;max-width: 35px;border-radius: 50%;margin-right:5px; " >
		  		  <button class= "btn" value="<%=user_name%>" name="usernamebutton">
		  		  <h5  style="display: inline-block;text-decoration: underline; "class="card-title"><%=user_name %></h5>
		   			  </button>
		   			  <button  style="background-color: #edede9;float:right;" class="btn btn-sm" value="<%= user_id%>" name="flwbtn"><%=status %></button>
		   		 </div>
			  <img  class="card-img-top" style="max-height: 24rem;resize: both;" src="<%=path_of_post %>" alt="Card image cap">
			  <div class="card-body" >
			  	
		   		 <p  style="display: inline-block;" class="card-text"><%=caption %></p>
		   		
				<%
									    	String color;
									    		if(lf.hasliked(post_id, main_id)!=true){
									    			 color="btn-secondary";
									    		}
									    		else{
									    			color="btn-danger";
									    		}
									    	%>
										    <button style="float: right;display: inline-block;color: grey" class="btn btn-sm <%=color %>" value="<%=post_id %>" name="pos" > 
										  		<i id="<%=post_id%>" style="color: white;width: 4px" class="bi bi-heart-fill"> : <%=likes %></i> 
										  	</button>
		  	</div>
			</div>
		</div>
		
		
		<% 
			}
		%>
		
		</div>
		
		<% 
	}
	%>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>						
		<script>

		
		
		
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

	
	let flwBtns = document.getElementsByName("flwbtn");
	flwBtns.forEach(function(flwBtn){
	    let userid = flwBtn.value;
	    flwBtn.onclick=function(){
	        let followreq = new XMLHttpRequest();
	        followreq.onreadystatechange= function(){
	        	console.log(this.responseText);
	            flwBtn.innerText= this.responseText;
	        };
	        followreq.open("POST","/G_Draft_1/ExplorePageServlet?followid="+userid);
	        followreq.send();
	    };
	});
	 let usernamebuttons =document.getElementsByName("usernamebutton");
	    usernamebuttons.forEach(function(usernamebutton){
	        var uname = usernamebutton.value;
	        
	        usernamebutton.onclick= function(){
	console.log(uname);
	        	 window.location.assign("http://localhost:8080/G_Draft_1/otherUserProfile.jsp?uid="+usernamebutton.value);
	        }
	    });
	    
	</script>
		<%@include file ="Templates/logoutTemplate.jsp"%>
	
			</body>
</html>	
		
