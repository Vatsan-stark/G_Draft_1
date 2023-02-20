<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<title>Login To Gram</title>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">	
			<script type="text/javascript">
	        function preventBack() { window.history.forward(); }
			      	 setTimeout("preventBack()", 0);
			      	 window.onunload = function () { null };
		 </script> 
</head>
<body style="background-image:url('GramImages/patrick-tomasso-lZbRV_a4Yxg-unsplash.jpg');background-size: cover; ">
	
	
	<div align="center">
		<div align="center" style="margin: 10%" >
			<img  src="GramImages/logo-ig-png-32453-min.png" alt="image not shown."height="60" width="70">
		<h1 Style="font-family: brushscript;"> Login To Your Account</h1>
	
			<form action="LoginServlet" method= post>
				<table style="margin: 50px">
					<tr> 
						<td> 
							<div class="form-floating mb-3">
 						 		<input type="text" class="form-control" id="floatingInput" placeholder="name@example.com" name=txtname>
 						 		<label for="floatingInput">Username	</label>
							</div> 
						</td>
					</tr> 
					<tr>
						<td>
							<div class="form-floating">
  								<input type="password" class="form-control" id="floatingPassword" placeholder="Password" name=txtpwd>
 							 	<label for="floatingPassword">Password</label>
							</div>
						</td>
					</tr>
				</table>
				<button type="submit" class="btn btn-dark btn-lg ">Login</button>
				
			</form><br>
		<a href="SignUp.jsp"><button type="submit" class="btn btn-dark btn-lg ">Sign up</button></a>

		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>	