<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
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
				       	<li> <a class="nav-link active" aria-current="page" href="explorepage.jsp">Explore</a>						</li>
				    </ul>
		      		
		      		<form class="d-flex" action="interuptsearch.jsp" method="post">
				        <input class="form-control me-2" type="search" placeholder="Search Users" aria-label="Search" name="search_id">
				        <button style="" class="btn btn-outline-light" type="submit" ><i class="bi bi-search"></i></button>
					</form>
					<button style="margin-left: 10px" type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="bi bi-power"></i></button>
		      		
		    	</div>
		  </div>
		</nav>
</body>
</html>