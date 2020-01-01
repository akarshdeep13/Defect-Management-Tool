<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%
String name=(String)session.getAttribute("name");
if (name==null)
{
	%>
	<script>window.alert("Please Login to enter!");
	window.location.href = "login.html";
	</script>
	<%
}
else
{%>
<html>
<head>
<script>
$(".readonly").keydown(function(e){
    e.preventDefault();
});
</script>
<script type="text/javascript">
function blockSpecialChar(e) {
    var k = e.keyCode;
    if(k >= 48 && k <= 57)
    return ( (k >= 48 && k <= 57) );
    else
    	{
    	alert("Enter Only Numeric type values!");
    	return ( (k >= 48 && k <= 57) );
    	}
}
    </script>
<script type="text/javascript" src="timeFormat.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css">
<title>Delete User</title>
</head>
<style>
html,body,h1,h2,h3,h4,h5,h6,label {
    font-family: "Comic Sans MS", cursive, sans-serif;
}
</style>

<body>
<div class="topnav" id="myTopnav">
  <a href="dashboard.jsp">Home</a>
  <div class="dropdown">
    <button class="dropbtn" >User Management 
      <div class="dropdown-content">
      <a href="dashboard.jsp">View User</a>
      <a href="usermanagement.jsp">Create User</a>
     
	  <a href="deleteuser.jsp" class="active">Delete User</a>
	  <a href="privilege.jsp">User Privilege</a>
	  
    </div>
	</button>
  </div> 
  <div class="dropdown">
    <button class="dropbtn">Defect Management 
      <div class="dropdown-content">
      <a href="view_defect.jsp">View Defect</a>
      <a href="createdefect.jsp">Create Defect</a>
     
	 
    </div>
	</button>
  </div>
   <div class="dropdown" style="dropdow:hover:#333;">
     <center><marquee behavior="alternate" width="280" scrolldelay="100"><button class="dropbtn">Defect Management Tool </marquee></center>
      
	</button>
  </div>
 <div class="dropdown" style="float:right;">
    <button class="dropbtn">Hello! &nbsp;&nbsp; <%=name%>
  <br><span id="theTime" style="position:relative; font-family: Comic Sans MS, cursive, sans-serif; font-size: 12pt"></span>
      <div class="dropdown-content">
       <a href="logout.jsp">Logout</a>
        
	  
    </div>
	</button>
  </div>
</div>
<form name = f2 method ="post" action="delete_user.jsp" style= "border:1px solid #ccc">

<h1>Delete User</h1>
<hr>

<div class="container"><center>
<table>
<tr><td><label>
User ID </label><font color="red">*</font></td><td>
<input type = "tel" placeholder="Enter User ID" id="assigned_to" name="user_id" required maxlength="7" minlength="7" id="numb" class="readonly" onclick="javascript:void window.open('popup.jsp','1528179581495','width=500,height=500,toolbar=0,menubar=0,location=0,status=1,scrollbars=0,resizable=0,left=0,top=0');return false;">
</td></tr>
</table>
<table style="width:10%">
<tr>
<td>
<button type ="submit" class="signupbtn" style="width:80%;">Submit</button></td>
<td><button type ="reset" class="cancelbtn" style="width:80%;">Clear</button></td></tr></table>

</center>
</div>
</form>
</body>
</html>
<%}%>