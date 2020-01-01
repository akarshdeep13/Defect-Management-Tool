<%@page import="java.util.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%
int i=0;
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

<script type="text/javascript">

function GetRowValue(clicked_id)

{

    // hardcoded value used to minimize the code.

    // ControlID can instead be passed as query string to the popup window
    var a=document.getElementById(clicked_id).value;
    window.opener.document.getElementById("assigned_to").value = a;
    window.location.replace("popup.jsp?mess="+a); 
    <%
    String message=request.getParameter("mess"); 
    session.setAttribute("id",message);
	%>
	 window.close();
}

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

<body>

<hr>
<h2>List of Users</h2>


<form name= f1 method="post">
<input type="text" style="width: 30%" id="js-search" placeholder="Search Here!!!">
<table class="js-table" style="width:100%; border-collapse: collapse;" cellpadding=0 cellspacing=0 id="abc">
<thead class="js-thead">
<tr style="background-color:grey;">
<th>Select</th>
<th>User Id</th>
<th>First Name</th>
<th>Last name</th>
</tr>
</thead>
<%
 try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from user_details ORDER BY first_name";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){ 
%>
<tr>
<td><input type="radio" name="id" onchange="GetRowValue(this.id)" style="width:70%;" id="check<%=i%>" value=<%= resultSet.getString("user_id") %>></td>
<td><%=resultSet.getString("user_id") %></td>
<td><%=resultSet.getString("first_name") %></td>
<td><%=resultSet.getString("last_name") %></td>
</tr>
<%
i++;
 }
connection.close();
} catch (Exception e) {
	%>
	<script>window.alert("<%=e%>");
	window.location.href = "dashboard.jsp";
	</script>
	<%
}
}
%>
</table>
</form>
  




</body>
</html>