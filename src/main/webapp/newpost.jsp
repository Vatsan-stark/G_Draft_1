<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@page import="java.io.FileInputStream"%>
      <%@page import="jakarta.servlet.http.HttpServlet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Post</title>
<%@include file="headders/headers.jsp" %>
</head>
	<body style="background-color: #f2e9e4 ; color: #262626">
<%@include file="Templates/navbarTemplate.jsp" %>



<div align="center" style="background-image: url('/Downloads/Blue%20Brown%20Cute%20Boat%20Phone%20Wallpaper.png');background-size: cover;">


<form action="GetPostServlet" method="POST" enctype="multipart/form-data">
<table>
	<tr style="height: 100px;width: 100px">
		<td><input type="file" accept="image/*" onchange="loadFile(event)" name="sam" ><td>
	</tr>
	<tr>
		<td><img id="output" style="height: 400px; width: auto;"/></td>
	</tr>
	<tr>
		
		<td><input type="text" name="caption" placeholder="Caption"></td>
	</tr>	
	<tr>
		<td><input type="submit" value="post" class="btn btn-dark"></td>
</table>
</form>






</div>

<script>
  var loadFile = function(event) {
    var reader = new FileReader();
    reader.onload = function(){
      var output = document.getElementById('output');
      output.src = reader.result;
    };
    reader.readAsDataURL(event.target.files[0]);
  };
</script>
<%@include file ="Templates/logoutTemplate.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
		
</body>
</html>