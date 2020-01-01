<%@page import="java.util.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%
String name=(String)session.getAttribute("name");
String role=(String)session.getAttribute("rr");
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
<script type="text/javascript" src="timeFormat.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Admin Dashboard</title>


</head>
<style>
html,body,h1,h2,h3,h4,h5,h6 {
    font-family: "Comic Sans MS", cursive, sans-serif;
}
</style>
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

<body>

<div class="topnav" id="myTopnav" >
  <a href="userdashboard.jsp">Home</a>
  
  <div class="dropdown">
    <button class="dropbtn">Defect Management 
      <div class="dropdown-content">
       <a href="userdashboard.jsp" class="active">View Defect</a>
      <a href="usercreatedefect.jsp">Create Defect</a>
    
	   
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
<h2>List of Defects</h2>

<form name=f1 action=user_modify_defect.jsp>
<button type ="submit" class="signupbtn" style="float:right;">Update</button>
<hr>
<table style="width:100%; border-collapse: collapse;" cellpadding=0 cellspacing=0 >
<tr style="background-color:grey;">

<th>Defect Id</th>
<th>Defect Description</th>

<th>Status</th>
<th>Assigned To</th>
<th>Severity</th>
<th>Priority</th>
<th>Test phase</th>


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
String sql ="select * from create_defect where defect_id="+idi[a];
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>

<td><input type="textarea" name ="defect_id" value="<%=resultSet.getString("defect_id") %>"readonly style="width:100%;"></td>
<td><textarea rows="4" cols="40" name ="defect_description" rows="2" cols="20" wrap="hard"  readonly style="background: #f1f1f1;"><%=resultSet.getString("defect_description") %></textarea></td>


<td width="100">  
		
		
		<select id="status" name="status" style="width:100%">
		
      <option value="<%=resultSet.getString("Status") %>"><%=resultSet.getString("Status") %></option>
      <%if(role.equals("Developer"))
		{%>
      <option value=" On hold">On hold</option>
      <option value="Fixed">Fixed</option>
      <option value="Reject">Reject</option>
      <%}
		else
		{%>
		<option value="Open">Open</option>
      	<option value="Close">Close</option>
		<%}%>
    </select></td>
		
<td><input type="textarea" name ="assign" value="<%=resultSet.getString("Assigned_to") %>"></td>
<td><input type="textarea" name ="sever" value="<%=resultSet.getString("Severity") %>"readonly></td>
<td> <select id="pr" name="defect_priority" style="width:100%">
	<option value="<%=resultSet.getString("Priority") %>"><%=resultSet.getString("Priority") %></option>
      <option value="1">1</option>
      <option value="2">2</option>
       <option value="3">3</option>
      <option value="4">4</option>
  </select></td>
  <td><input type="textarea" name ="test_phase" value="<%=resultSet.getString("test_phase") %>"readonly></td>
</tr>
<%
}
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</form>  




</body>
</html>
<%}%>