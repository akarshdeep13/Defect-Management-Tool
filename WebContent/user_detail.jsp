<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>user details</title>
</head>
<body>
<% String ui=request.getParameter("user_id");
String fn=request.getParameter("first_name"); 
String ln=request.getParameter("last_name");
String role=request.getParameter("role");
String pw=request.getParameter("password");
String st="Active";
try
{
Class.forName("com.mysql.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dmt", "root", "");
/* Passing argument through the question mark */ 
PreparedStatement ps=con.prepareStatement("insert into user_details values(?,?,?,?,?,?)") ;
ps.setString(1,ui);
ps.setString(2,fn);
ps.setString(3,ln);
ps.setString(4,pw);
ps.setString(5,st);
ps.setString(6,role);
int i=ps.executeUpdate();
/*Set the Update query command */
if(i!=0) 
{ 
	%>
					<script>window.alert("User Created Successfully!");
					window.location.href = "dashboard.jsp";
					</script>
	<%
}
else
{
	%>
					<script>window.alert("User Not Created!\nAsk Admin for details!");
					window.location.href = "user_management.html";
					</script>
	<%
}
con.close();
} 
catch(Exception ex)
{ 
	%>
	<script>window.alert("<%=ex%>");
	window.location.href = "usermanagement.jsp";
	</script>
	<%
}
%>

</body>
</html>