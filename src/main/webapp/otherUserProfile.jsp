<%@page import="java.awt.Checkbox"%>
<%@page import="java.awt.Button"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="package1.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>

<head>
		<meta charset="UTF-8">
			<%@include file="headders/headers.jsp" %>
			
</head>
<body style="background-color: #f2e9e4">
<%String searchid=request.getParameter("uid"); 
System.out.println(searchid);
int id=Integer.parseInt(session.getAttribute("id").toString());
GetDataClass gd=new GetDataClass();
gd.Search(request,response,searchid	);
int searchedid=gd.Searchedid;
FollowerInfo fo=new FollowerInfo();
int postcount=fo.Retpostcount(request,response,searchedid);
boolean flag;


%>
<%@include file="Templates/navbarTemplate.jsp" %>
<input type="hidden" value="<%=searchedid %>"id="manid">

<div align = center style="margin: 32px"  >
			 <div align="center" >
				<img  class="circular" src="<%= gd.searchedprofile_picture%>" alt="">
			</div>
			<br>
			<table>
				<tr>
					<td style="font-size: large ;">Name : </td>
					<td style="font-size: large;"><%=gd.SearchedName%></td>
				</tr>
				<tr>
					<td style="font-size: large ;">User-Name : </td>
					<td style="font-size: large ;"><%=gd.SearchedUsername%></td>
				</tr>
				<tr>
					<td style="font-size: large ;">Followers: </td>
					<td style="font-size: large ;"><%=gd.SearchedFollowerCount%></td>
				</tr>
				<tr>
					<td style="font-size: large ;">Following: </td>
					<td style="font-size: large ;"><%=gd.SearchedFollowingCount%></td>
				</tr>
				<tr>
					<td style="font-size: large ;">Posts: </td>
					<td style="font-size: large ;"><%=postcount%></td>

				</table>
				

<% String a="",status="";
FollowClass f=new FollowClass();
if(f.checkfollow(id, searchedid)){
	status ="Following";
	flag=true;
}
else{
	status="Follow";
	flag=false;
}
%>

					
<br>			
<!-- 				<form action ="FollowServlet" method="post"> -->
				 <button   class="btn btn-dark" value="<%=id%>" name="flwbtn"><%=status %></button>
				
<%-- 					<input class="btn btn-dark" type="submit" value="<%=status %>" id="Fb"> --%>
<!-- 				</form> -->
	</div>
	
	<div align="center" class="container" style="align-content: stretch;align-items: stretch;align-self: auto;max-width: 1080px">
  		
    		
    		<%
    		try{
    		PostHandlerClass po= new PostHandlerClass();
    		 ResultSet post = po.retpost(searchedid);
    		 String pathofpost;
    		if( post.next())
    		for(int i=0;i<postcount;i+=3){
    			
    			
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
		  catch (SQLException e) {
		e.printStackTrace();
		}

	%>

	
	
	
	
	
	
	
	
	
	
<%@include file ="Templates/logoutTemplate.jsp"%>
  		
		
		<script type="text/javascript">
		
		let flwBtns = document.getElementsByName("flwbtn");



		flwBtns.forEach(function(flwBtn){
		    let userid = flwBtn.value;
		    flwBtn.onclick=function(){
		        let followreq = new XMLHttpRequest();
		        followreq.onreadystatechange= function(){
		        	console.log(this.responseText);
		            flwBtn.innerText= this.responseText;
		        };
		        followreq.open("POST","/G_Draft_1/ExplorePageServlet?followid="+document.getElementById("manid").value);
		        followreq.send();
		    };
		});
		</script>	
















</body>
</html>