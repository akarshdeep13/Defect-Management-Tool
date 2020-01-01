<%@page import="java.sql.*"%>
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
<% String c=request.getParameter("cdefect");
String e=request.getParameter("edefect"); 
String d=request.getParameter("ddefect");
String ui=request.getParameter("user_id");
if(e==null)
	e="No";
if(d==null)
	d="No";
if(c==null)
	c="No";
try
{
Class.forName("com.mysql.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dmt", "root", "");
/* Passing argument through the question mark */ 
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("SELECT * from user_privileges  where user_id="+ui);
if(rs.next())
{
	PreparedStatement ps=con.prepareStatement("UPDATE user_privileges  SET create_defect = ?, edit_defect = ?,delete_defect=? where user_id="+ui) ;
	ps.setString(1,c);
	ps.setString(2,e);
	ps.setString(3,d);
	int i=ps.executeUpdate();
	/*Set the Update query command */
	if(i!=0) 
	{ 
		%>
						<script>window.alert("Privileges Updated Successfully!");
						window.location.href = "privilege.jsp";
						</script>
		<%
	}
	else
	{
		%>
						<script>window.alert("Privileges Not Granted!\nAsk Admin for details!");
						window.location.href = "privilege.jsp";
						</script>
		<%
	}

}
else
{	
	PreparedStatement ps=con.prepareStatement("insert into user_privileges values(?,?,?,?)") ;
	ps.setString(1,ui);
	ps.setString(2,c);
	ps.setString(3,e);
	ps.setString(4,d);
	int i=ps.executeUpdate();
	/*Set the Update query command */
	if(i!=0) 
	{ 
		%>
						<script>window.alert("Privileges Updated Successfully!");
						window.location.href = "privilege.jsp";
						</script>
		<%
	}
	else
	{
		%>
						<script>window.alert("Privileges Not Granted!\nAsk Admin for details!");
						window.location.href = "privilege.jsp";
						</script>
		<%
	}
	}
con.close();
} 
catch(Exception ex)
{
	%>
	<script>window.alert("User ID Not Exist!");
	window.location.href = "privilege.jsp";
	</script>
<%

	}
%>

</body>
</html>