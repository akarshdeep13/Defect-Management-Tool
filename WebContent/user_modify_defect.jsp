<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modify defect</title>
</head>
<style>
html,body,h1,h2,h3,h4,h5,h6 {
    font-family: "Comic Sans MS", cursive, sans-serif;
}
</style>

<body>
<%
String[] defectid = request.getParameterValues("defect_id");
String[] status = request.getParameterValues("status");
String[] ass = request.getParameterValues("assign");
String[] pr = request.getParameterValues("defect_priority");
int j=0;
try
{
Class.forName("com.mysql.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dmt", "root", "");
/* Passing argument through the question mark */ 
for(int i=0;i<defectid.length;i++){
    PreparedStatement pst = con.prepareStatement("UPDATE create_defect  SET Status = ?, Assigned_to = ?, Priority = ? where defect_id="+defectid[i]);
	pst.setString(1, status[i]);
	pst.setString(2, ass[i]);
	pst.setString(3, pr[i]);
     j = pst.executeUpdate();
    }
/*Set the Update query command */
if(j!=0) 
{ 
	%>
					<script>window.alert("modification done Successfully!");
					window.location.href = "userdashboard.jsp";
					</script>
	<%
}
else
{
	%>
					<script>window.alert(" unable to modify!\nAsk Admin for details!");
					window.location.href = "userdashboard.jsp";
					</script>
	<%
}
con.close();
} 
catch(Exception ex)
{ 
	%>
	<script>window.alert("<%=ex%>");
	window.location.href = "userdashboard.jsp";
	</script>
<%
}
%>

</body>
</html>