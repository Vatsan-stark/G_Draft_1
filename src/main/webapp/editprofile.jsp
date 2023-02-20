<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.io.FileInputStream"%>
     <%@page import="jakarta.servlet.http.HttpServlet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Edit Your Profile</title>
	<%@include file="headders/headers.jsp" %>
</head>
<body style="align-self: auto;align-content: stretch;align-items: stretch;background-color: #f2e9e4" >
<%@include file="Templates/navbarTemplate.jsp" %>

<div align="center"style="margin: 100px">
	<form action="EditProfileServlet" method="post" enctype="multipart/form-data">
	<table>
	<tr>
		<td>
		<input type="file" name="ProfilePicture" accept="image/*" onchange="loadFile(event)" style="color:#f2e9e4">
		 </td>
		 </tr>
		</table>
		<div style="height:310px;width:310px; border:2px #1E3456 solid; border-radius: 100%;padding:3px">
			<img id="DP" class="circular" style="height: 300px; width: 300px;resize: both"/>
		</div>
		<button type="submit">Update</button>
	</form>
</div>
<script>
  var loadFile = function(event) {
    var reader = new FileReader();
    reader.onload = function(){
      var output = document.getElementById('DP');
      output.src = reader.result;
    };
    reader.readAsDataURL(event.target.files[0]);
  };
</script>
<%@include file ="Templates/logoutTemplate.jsp"%>s
</body>
</html>










