<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String uid=(String)session.getAttribute("uid");
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
{
%>
<html>
<head>
<script type="text/javascript" src="timeFormat.js"></script>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css">
<title>Change Password</title>
</head>
<style>
html,body,h1,h2,h3,h4,h5,h6,label {
    font-family: "Comic Sans MS", cursive, sans-serif;
}
</style>

<body>
<div class="topnav" id="myTopnav">
  <a href="userdashboard.jsp">Home</a>
  

   <div class="dropdown" style="dropdow:hover:#333;">
     <center><marquee behavior="alternate" width="280" scrolldelay="100"><button class="dropbtn">Defect Management Tool </marquee></center>
      
	</button>
  </div>
  <div class="dropdown" style="float:right;">
    <button class="dropbtn">Hello! &nbsp;&nbsp; <%=name%>
  <br><span id="theTime" style="position:relative; font-family: Comic Sans MS, cursive, sans-serif; font-size: 12pt"></span>
      <div class="dropdown-content">
       <a href="logout.jsp">Logout</a>
       <a href="changepassword.jsp">Change Password</a> 
	  
    </div>
	</button>
  </div>
</div>
<form name = f2 method ="post" action="change_password.jsp" style= "border:1px solid #ccc">

<h1>Change Password</h1>
<hr>

<div class="container"><center>
<table><tr><td>
<label>
User ID </label><font color="red">*</font></td><td><input type = "tel" minlength="7" maxlength="7" value="<%=uid%>" name="user_id" required onkeypress="return blockSpecialChar(event)"></td></tr>
<tr><td>
<label>Old Password</label> <font color="red">*</font></td><td><input type = "password" maxlength="15" placeholder="Enter New Password" name="oldpassword" required></td></tr>
<tr><td>
<label>New Password</label> <font color="red">*</font></td><td><input type = "password" maxlength="15" placeholder="Enter New Password" name="newpassword" required></td></tr>
<tr><td>
<label>Confirm Password </label><font color="red">*</font></td><td><input type = "password" maxlength="15" placeholder="Confirm Password" name="cnfpassword" required></td></tr>
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
<%
}
%>