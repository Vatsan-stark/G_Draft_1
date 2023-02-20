<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Create a Gram Account </title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">	
		<script type="text/javascript">
	        function preventBack() { window.history.forward(); }
			      	 setTimeout("preventBack()", 3);
			      	 window.onunload = function () { null };
		 </script> 
	</head>
<body style="background-image:url('GramImages/patrick-tomasso-lZbRV_a4Yxg-unsplash.jpg');background-size: cover; ">
<a href="login.jsp" style="color: white; font-size: 32pt;text-decoration: none;">←</a>
	<div align="center">
			<div align="center" style="margin: 10%" >
				<img  src="GramImages/logo-ig-png-32453-min.png" alt="image not shown."height="60" width="70">
				<h1 > Create Your Gram Account</h1>
		
		
		<form action="SignUpServlet" method= post>
			<table style="margin: 50px">
				<tr>
					<td>
						<div class="form-floating mb-3">
					 		<input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name=txtemail required="required">
					 		<label for="floatingInput">Email</label>
						</div> 
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-floating mb-3">
					 		<input type="text" class="form-control" id="floatingInput" placeholder="name@example.com" name=txtname required="required">
					 		<label for="floatingInput">Name	</label>
						</div> 
					</td>
<!-- 				</tr> -->
<!-- 				<tr> -->
					<td>
						<div class="form-floating mb-3">
					 		<input type="text" class="form-control" id="floatingInput" placeholder="name@example.com" name=txtusername  title="User-name should not contain Space" required="required">
					 		<label for="floatingInput">Username	</label>
						</div> 
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-floating mb-3">
					 		<input type="password" class="form-control" id="floatingInput" placeholder="name@example.com" name=txtpwd required="required" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Password must contain 8 or more characters that are of at least one number, and one uppercase and lowercase letter">
					 		<label for="floatingInput">Password	</label>
						</div> 
					</td>
<!-- 				</tr> -->
<!-- 				<tr> -->
					<td>
						<div class="form-floating mb-3">
					 		<input type="password" class="form-control" id="floatingInput" placeholder="name@example.com" name=repwd required="required">
					 		<label for="floatingInput">Confirm Password	</label>
						</div> 
					</td>
				</tr>
				
				
					
<!-- 		<tr><td>Email-id</td> <td><input type=email  name=txtemail >  </td></tr> -->
<!-- 		<tr><td>Name</td> <td><input type=text name=txtname >  </td></tr>   -->
<!-- 		<tr><td>User-Name</td> <td><input type=text name=txtusername >  </td></tr>  -->
<!-- 		<tr><td>password</td> <td><input type=password name=></td></tr> -->
<!-- 		<tr><td>Confirm password</td> <td><input type=password name=repwd></td></tr> -->
		
		</table>
		<input class="btn btn-light" type=submit value="Sign up">
		
		
		</form>
		</div>
</div>
		</body>
</html>














