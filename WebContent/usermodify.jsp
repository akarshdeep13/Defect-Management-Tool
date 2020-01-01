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
<title>User Privilege</title>
</head>
<style>
html,body,h1,h2,h3,h4,h5,h6 {
    font-family: "Comic Sans MS", cursive, sans-serif;
}
</style>

<body>
<div class="topnav" id="myTopnav">
  <a href="dashboard.jsp">Home</a>
  <div class="dropdown">
    <button class="dropbtn">User Management 
      <div class="dropdown-content">
      <a href="#">View User</a>
      <a href="usermanagement.jsp">Create User</a>
      <a href="#">Modify User</a>
	  <a href="delete_user.html">Delete User</a>
	  <a href="user_privilege.html">User Privilege</a>
	  
    </div>
	</button>
  </div> 
  <div class="dropdown">
    <button class="dropbtn">Defect Management 
      <div class="dropdown-content">
       <a href="#">View Defect</a>
      <a href="#">Create Defect</a>
      <a href="#">Modify Defect</a>
	 
    </div>
	</button>
  </div>
  <a href"#" >Hello! &nbsp;&nbsp; <%=name%><p id="time">
					<script>
							var d = new Date();
							document.getElementById("time").innerHTML = d;
					</script>
</p></a>
   <input type="button" onclick="location.href='login.html';" value="logout">
   
</div>

<form name = f2 method ="post" action="" style= "border:1px solid #ccc">

<h1>User Privileges</h1>
<hr>

<div class="container"><center>
User ID <font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type = "tel" minlength="7" maxlength="7" placeholder="Enter User ID" name="user_id" required><br>
</center>
</div>
<div class="container1">
<label class="container1">Create Defect
  <input type="checkbox" checked="checked">
  <span class="checkmark"></span>
</label>

<label class="container1">Edit Defect
  <input type="checkbox">
  <span class="checkmark"></span>
</label>

<label class="container1">Delete Defect
  <input type="checkbox">
  <span class="checkmark"></span>
</label><br>
</div>
<div class="clearfix">
<button type ="reset" class="cancelbtn">Clear</button>
<button type ="submit" class="signupbtn">Submit</button>
</div>
</form>
</body>
</html>
<%}%>