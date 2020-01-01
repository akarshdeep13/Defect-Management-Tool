
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
<style>
html,body,h1,h2,h3,h4,h5,h6,td,label {
    font-family: "Comic Sans MS", cursive, sans-serif;
}
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 8%;
}


button:hover {
    opacity: 0.8;
}

.cancelbtn2 {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}
.cancelbtn1 {
    width: auto;
    padding: 10px 18px;
    background-color: #4CAF50;
}
 Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn2 {
       width: 100%;
    }
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css">
<title>User Management</title>

</head>
<body>
<div class="topnav" id="myTopnav">
  <a href="dashboard.jsp">Home</a>
  <div class="dropdown">
    <button class="dropbtn" >User Management 
      <div class="dropdown-content">
      <a href="dashboard.jsp">View User</a>
      <a href="usermanagement.jsp" class="active">Create User</a>
      
	  <a href="deleteuser.jsp">Delete User</a>
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
<form name = f1 method ="post" action="user_detail.jsp" style= "border:1px solid #ccc">
<div class="container">
<h1>Create User</h1>
<hr>
<center>
<table>
<tr>
<td><label>
User ID </label><font color="red">*</font></td><td><input type = "tel" minlength="7" maxlength="7" placeholder="Enter User ID" name="user_id" required onkeypress="return blockSpecialChar(event)"></td></tr>
<tr><td><label>
First Name</label> <font color="red">*</font></td><td><input type = "text" maxlength="15" placeholder="Enter First Name" name="first_name" required></td></tr>
<tr><td><label>
Last Name</label></td><td><input type ="text" placeholder="Enter Last Name" maxlength="15" name="last_name"></td></tr>
<tr><td><label>Role:</label></td>
<td> <select id="createrole" name="role" style="width:100%">
	<option value="Admin">Administrator</option>
      <option value="Developer">Developer</option>
      <option value="Tester">Tester</option>
  </select></td></tr>
<tr><td>
<label>
Password </label><font color="red">*</font></td><td><input type ="password" maxlength="15" placeholder="Enter Password" name="password" required ></td></tr>
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