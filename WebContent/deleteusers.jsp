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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Admin Dashboard</title>
<script type="text/javascript" src="timeFormat.js"></script>
<style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
tr
{
height:1;
}
</style>

</head>

<style>
html,body,h1,h2,h3,h4,h5,h6 {
    font-family: "Comic Sans MS", cursive, sans-serif;
}
</style>

<body>

<div class="topnav" id="myTopnav" >

  <a href="dashboard.jsp" class="active">Home</a>
  <div class="dropdown">
    <button class="dropbtn">User Management 
      <div class="dropdown-content">
      <a href="dashboard.jsp">View User</a>
      <a href="usermanagement.jsp">Create User</a>
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

<hr>
<h2>List of Users</h2>


<form name= f1 method="post" action="delete_user.jsp">
<button type ="submit" class="signupbtn" style="float:right;">Update</button>
<hr>
<table  style="width:100%; border-collapse: collapse;" cellpadding=0 cellspacing=0>
<tr style="background-color:grey;">
<th width="90">User Id</th>
<th width="165">First Name</th>
<th width="165">Last name</th>
<th width="165">Password</th>
<th width="95">Status</th>
</tr>
<%
String idi[]= new String[20];
for(int i=0;i<20;i++){
idi[i]=request.getParameter("check"+i);

}
 try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
for(int a=0;a<20;a++)
{
String sql ="select * from user_details where user_id="+idi[a];
resultSet = statement.executeQuery(sql);
while(resultSet.next())
{ 
%>
<tr>
<td width="90"><input type="textarea" name="user_id" value="<%=resultSet.getString("user_id") %>"readonly></td>
<td width="165"><input type="textarea" name="first_name" value="<%=resultSet.getString("first_name") %>" readonly></td>
<td width="165"><input type="textarea" name="last_name" value="<%=resultSet.getString("last_name") %>" readonly></td>
<td width="165"><input type="textarea" name="password" value="<%=resultSet.getString("password") %>"readonly></td>
<td width="95"><input type="textarea" name="status" value="<%=resultSet.getString("status") %>" readonly></td>
</tr>
<%
 }
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
}
%>
</table>
</form>
  




</body>
</html>