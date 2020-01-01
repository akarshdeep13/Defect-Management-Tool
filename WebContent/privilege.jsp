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
{
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "DMT";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html>
<head>
<script>
$(".readonly").keydown(function(e){
    e.preventDefault();
});
</script>
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
<title>User Privilege</title>

<style>
html,body,h1,h2,h3,h4,h5,h6 {
    font-family: "Comic Sans MS", cursive, sans-serif;
}
</style>
</head>



<body>
<div class="topnav" id="myTopnav">

  <a href="dashboard.jsp" >Home</a>
  <div class="dropdown">
    <button class="dropbtn">User Management 
      <div class="dropdown-content">
      <a href="dashboard.jsp">View User</a>
      <a href="usermanagement.jsp">Create User</a>
   	  <a href="deleteuser.jsp">Delete User</a>
	  <a href="privilege.jsp"class="active">User Privilege</a>
	  
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
     <center><marquee behavior="alternate" width="280" scrolldelay="100"><button class="dropbtn">Defect Management Tool 
     </button></marquee></center>
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

<form name = f2 method ="post" action="user_privilege.jsp" style= "border:1px solid #ccc" name="Form">

<h1>User Privileges</h1>
<hr>
<table  style="border:1px solid black; border-collapse: collapse; width:100%; position:sticky;" cellpadding=2 cellspacing=2>
<tr style="height:1;background-color:grey; border:1px solid black; border-collapse: collapse; ">
<th style="border:1px solid black; border-collapse: collapse; position: sticky;">User Id</th>
<th style="border:1px solid black; border-collapse: collapse; position: sticky;">First Name</th>
<th style="border:1px solid black; border-collapse: collapse; position: sticky;">Last Name</th>
<th style="border:1px solid black; border-collapse: collapse; position: sticky;">Create Defect</th>
<th style="border:1px solid black; border-collapse: collapse; position: sticky;">Edit Defect</th>
<th style="border:1px solid black; border-collapse: collapse; position: sticky;">Delete Defect</th>


</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="SELECT user_details.user_id, user_details.first_name, user_details.last_name,user_privileges.create_defect,user_privileges.edit_defect,user_privileges.delete_defect FROM user_details INNER JOIN user_privileges ON user_details.user_id=user_privileges.user_id";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr style="height:1; border:1px solid black; border-collapse: collapse;">
<td width="20" style="border:1px solid black; border-collapse: collapse;"><input type="textarea" name="user_ids" value="<%=resultSet.getString("user_id") %>" readonly style="width:95%"></td>
<td width="20" style="border:1px solid black; border-collapse: collapse;"><input type="textarea" name="user_ids" value="<%=resultSet.getString("first_name") %>" readonly style="width:96%"></td>
<td width="20" style="border:1px solid black; border-collapse: collapse;"><input type="textarea" name="user_ids" value="<%=resultSet.getString("last_name") %>" readonly style="width:96%"></td>
<td width="50"  style="border:1px solid black; border-collapse: collapse;"><input type="textarea" name="cd" value="<%=resultSet.getString("create_defect") %>" readonly style="width:96%"></td>
<td width="20" style="border:1px solid black; border-collapse: collapse;"><input type="textarea" name="ed" value="<%=resultSet.getString("edit_defect") %>" readonly style="width:96%"></td>
<td width="20" style="border:1px solid black; border-collapse: collapse;"><input type="textarea" name="dd" value="<%=resultSet.getString("delete_defect") %>" readonly style="width:96%"></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<br>


<div >
<h2>Create/Modify User Privileges</h2><hr>
<center>
<table>
<tr>
<td>
<label>User ID </label><font color="red">*</font></td><td colspan=3>
<input type = "tel" minlength="7" maxlength="7" placeholder="Enter User ID" id="assigned_to" name="user_id" id="a" required class="readonly"onclick="javascript:void window.open('popup.jsp','1528179581495','width=500,height=500,toolbar=0,menubar=0,location=0,status=1,scrollbars=0,resizable=0,left=0,top=0');return false;">
</td></tr>
<tr>
<td>
<label >Privileges:</label></td>
<td><label >&nbsp;&nbsp;Create Defect
  <input type="checkbox" checked="checked" name="cdefect" value="Yes">
  
</label></td>
<td><label >&nbsp;&nbsp;Edit Defect
  <input type="checkbox" name="edefect" value="Yes">
  
</label></td>
<td><label >&nbsp;&nbsp;Delete Defect
  <input type="checkbox" name="ddefect" value="Yes">
  
</label></td></tr>
<tr><td></td><td><button type ="submit" class="signupbtn" style="width:100%;">Submit</button></td><td>
<button type ="reset" class="cancelbtn" style="width:100%;">Clear</button></td><td></td></tr>
</table>
</center>
</div>
</form>
</body>
</html>
<%}%>