<%@page import="java.util.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%
String name=(String)session.getAttribute("name");
String uid=(String)session.getAttribute("uid");
String cd=(String)session.getAttribute("cd");
String ed=(String)session.getAttribute("ed");
String role=(String)session.getAttribute("rr");
int dcount=0;
if (name==null)
{
	%>
	<script>
	window.alert("Please Login to enter!");
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
try 
{
Class.forName(driver);
} 
catch (ClassNotFoundException e) 
{
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

%>
<html>
<head>
	<script type="text/javascript" src="timeFormat.js"></script>
	<meta http-equiv="Content-Type" content="text/html;">
	<title>User Dashboard</title>
	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="jquery-1.4.2.min.js" type="text/javascript"></script>
	<script>
		$(document).ready(function(){
		$("#js-search").keyup(function(){
	    _this = this;
	    $.each($(".js-table tbody tr"), function() {
	        if($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
	            $(this).hide();
	        else
	            $(this).show();
	    });
	});
});
</script>
</head>
<style>
html,body,h1,h2,h3,h4,h5,h6 {
    font-family: "Comic Sans MS", cursive, sans-serif;
}
td {
    font-family: "Comic Sans MS", cursive, sans-serif;
}
</style>
<style>
.alert {
    padding: 20px;
    background-color: #f26d60;
    color: white;
}

.closebtn {
    margin-left: 15px;
    color: white;
    font-weight: bold;
    float: right;
    font-size: 22px;
    line-height: 20px;
    cursor: pointer;
    transition: 0.3s;
}

.closebtn:hover {
    color: black;
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

<div class="topnav" id="myTopnav">
  <a href="userdashboard.jsp" class="active">Home</a>
  
 
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

<hr>
<h2>List of Defects</h2>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();

String sql ="select * from create_defect ORDER BY defect_date DESC";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
String a=resultSet.getString("Priority");
String b=resultSet.getString("Severity");
String assto=resultSet.getString("Assigned_to");
String stat=resultSet.getString("Status");
String did=resultSet.getString("defect_id");
if(uid.equals(assto) && stat.equals("New"))
{
		dcount++;
}
}
}
catch(Exception e)
{
	
}
if(dcount>0)
{ %>
<div class="alert">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong><%=name %>!</strong> You Have <%=dcount %> New Defect(s)!
</div>
<%
}%>

<form name=f1 action=user_edit_defect.jsp>



<input type="text" style="width: 20%" id="js-search" placeholder="Search Here To Filter !!!"> 
<%if(role.equals("Developer"))
	{%>
	
	<button type ="submit" class="signupbtn" style="float:right;position:sticky;" id="edit" >Edit</button>
<%}
if(role.equals("Tester"))
{
%>
<button type ="submit" class="signupbtn" style="float:right;position:sticky;" id="dm" formaction="usercreatedefect.jsp" >New</button>
<button type ="submit" class="signupbtn" style="float:right;position:sticky;" id="edit" >Edit</button>
<%}%>
<table style="width:100%; border-collapse: collapse;" cellpadding=0 cellspacing=0 id="abc">
<table class="js-table" style="width:100%; border-collapse: collapse;" cellpadding=0 cellspacing=0 id="abc">
			<thead class="js-thead">
<tr style="background-color:grey;">
<th></th>
<th>Defect Id</th>
<th>Defect Description</th>
<th>Defected Type</th>
<th>Defect Date</th>
<th>Status</th>
<th>Environment</th>
<th>Assigned To</th>
<th>Severity</th>
<th>Priority</th>
<th>Test phase</th>
<th>Defect By</th>
<th>Time of Log Created</th>

</tr>
</thead>

<%
int i=0;
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();

String sql ="select * from create_defect ORDER BY defect_date DESC";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
String a=resultSet.getString("Priority");
String b=resultSet.getString("Severity");
if (a.equals("1") && b.equals("Critical"))
{%>
<tr style="background-color:#f26d60;">
 
<td width="30"><input type="checkbox" name="check<%=i%>" value=<%= resultSet.getString("defect_id") %>></td>
<td><%=resultSet.getString("defect_id") %></td>
<td><textarea rows="2" cols="20" name ="defect_description" rows="2" cols="20" wrap="hard"  readonly style="background: #f1f1f1;resize: none;"><%=resultSet.getString("defect_description") %></textarea></td>
<td><%=resultSet.getString("Defected_type") %></td>
<td><%=resultSet.getString("Defect_date") %></td>
<td><%=resultSet.getString("Status") %></td>
<td><%=resultSet.getString("Environment") %></td>
<td><%=resultSet.getString("Assigned_to") %></td>
<td><%=resultSet.getString("Severity") %></td>
<td><%=resultSet.getString("Priority") %></td>
<td><%=resultSet.getString("test_phase") %></td>
<td><%=resultSet.getString("Defected_by") %></td>
<td><textarea rows="2" cols="23" name ="defect_description" rows="2" cols="20" wrap="hard"  readonly style="background: #f1f1f1;resize: none;"><%=resultSet.getString("log") %></textarea></td>
</tr>
<%}else
{%>
<tr style="background-color:#DDDDDD;">
 
<td width="30"><input type="checkbox" name="check<%=i%>" value=<%= resultSet.getString("defect_id") %>></td>
<td><%=resultSet.getString("defect_id") %></td>
<td><textarea rows="2" cols="20" name ="defect_description" rows="2" cols="20" wrap="hard"  readonly style="background: #f1f1f1;resize: none;"><%=resultSet.getString("defect_description") %></textarea></td>
<td><%=resultSet.getString("Defected_type") %></td>
<td><%=resultSet.getString("Defect_date") %></td>
<td><%=resultSet.getString("Status") %></td>
<td><%=resultSet.getString("Environment") %></td>
<td><%=resultSet.getString("Assigned_to") %></td>
<td><%=resultSet.getString("Severity") %></td>
<td><%=resultSet.getString("Priority") %></td>
<td><%=resultSet.getString("test_phase") %></td>
<td><%=resultSet.getString("Defected_by") %></td>
<td><textarea rows="2" cols="23" name ="defect_description" rows="2" cols="20" wrap="hard"  readonly style="background: #f1f1f1;resize: none;"><%=resultSet.getString("log") %></textarea></td>
</tr>
<%}%>
<%
i++;
}

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</table>
</form>  




</body>
</html>
<%}%>