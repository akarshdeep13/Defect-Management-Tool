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

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="table2excel.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#btnExport").click(function () {
                $("#tblCustomers").table2excel({
                    filename: "DefectList.xls"
                });
            });
        });
    </script>

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
<script src="jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="table2excel.js" type="text/javascript"></script>
<body>
<div class="topnav" id="myTopnav" >
  <a href="dashboard.jsp">Home</a>
  <div class="dropdown">
    <button class="dropbtn">User Management 
      <div class="dropdown-content">
      <a href="dashboard.jsp" >View User</a>
      <a href="usermanagement.jsp">Create User</a>
    
	  <a href="deleteuser.jsp">Delete User</a>
	  <a href="privilege.jsp">User Privilege</a>
	  
    </div>
	</button>
  </div> 
  <div class="dropdown">
    <button class="dropbtn">Defect Management 
      <div class="dropdown-content">
       <a href="view_defect.jsp" class="active">View Defect</a>
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
<h2>List of Defects</h2>

<form name=f1>
<input type="button" id="btnExport" value="Export to Excel" />
<table  style="width:100%; border-collapse: collapse;" cellpadding=0 cellspacing=0 id="tblCustomers">
<thead >
<tr style="background-color:grey;">
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
<th>Time of Log Created
</th>

</tr>
</thead>
<%
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
<td><%=resultSet.getString("defect_id") %></td>
<td style="width:10%;"><div style="white-space: nowrap;width: 100px;overflow: hidden;text-overflow: ellipsis;"><%=resultSet.getString("defect_description") %>"</div></td>
<td><%=resultSet.getString("Defected_type") %></td>
<td><%=resultSet.getString("Defect_date") %></td>
<td><%=resultSet.getString("Status") %></td>
<td><%=resultSet.getString("Environment") %></td>
<td><%=resultSet.getString("Assigned_to") %></td>
<td><%=resultSet.getString("Severity") %></td>
<td><%=resultSet.getString("Priority") %></td>
<td><%=resultSet.getString("test_phase") %></td>
<td><%=resultSet.getString("Defected_by") %></td>
<td><%=resultSet.getString("log") %></td>
</tr>
<%}else
{%>
<tr style="background-color:#DDDDDD;">
<td><%=resultSet.getString("defect_id") %></td>
<td style="width:10%;"><div style="white-space: nowrap;width: 100px;overflow: hidden;text-overflow: ellipsis;"><%=resultSet.getString("defect_description") %>"</div></td>
<td><%=resultSet.getString("Defected_type") %></td>
<td><%=resultSet.getString("Defect_date") %></td>
<td><%=resultSet.getString("Status") %></td>
<td><%=resultSet.getString("Environment") %></td>
<td><%=resultSet.getString("Assigned_to") %></td>
<td><%=resultSet.getString("Severity") %></td>
<td><%=resultSet.getString("Priority") %></td>
<td><%=resultSet.getString("test_phase") %></td>
<td><%=resultSet.getString("Defected_by") %></td>
<td><%=resultSet.getString("log") %></td>
</tr>
<%}%>
<%
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