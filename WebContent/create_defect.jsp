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
<%
	String di = request.getParameter("defect_id");
	String dbt = request.getParameter("Defected_by");
	String dt = request.getParameter("Defect_type");
	String dd = request.getParameter("Defect_date");
	String st = request.getParameter("status");
	String env = request.getParameter("environment");
	String at = request.getParameter("assigned_to");
	String svr = request.getParameter("severity");
	String pr = request.getParameter("priority");
	String tp = request.getParameter("test_phase");
	String def = request.getParameter("Defect_description");

	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	java.util.Date currentTime = new java.util.Date();//Get the current system time

	String str_date1 = formatter.format(currentTime); //The date and time format 
	String str_date2 = currentTime.toString(); //The Date date and time into a string 

	try {
		Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dmt", "root", "");
		/* Passing argument through the question mark */
		PreparedStatement ps = con
				.prepareStatement("insert into create_defect values(?,?,?,?,?,?,?,?,?,?,?,?)");
		ps.setString(1, di);
		ps.setString(2, dbt);
		ps.setString(3, dt);
		ps.setString(4, dd);
		ps.setString(5, st);
		ps.setString(6, env);
		ps.setString(7, at);
		ps.setString(8, svr);
		ps.setString(9, pr);
		ps.setString(10, tp);
		ps.setString(11, def);
		ps.setString(12, str_date2);
		int i = ps.executeUpdate();
		/*Set the Update query command */
		if (i != 0) {
%>
					<script>window.alert("Defect Created Successfully!");
					window.location.href = "userdashboard.jsp";
					</script>
	<%
}
else
{
	%>
					<script>window.alert("Defect Not Created!\nAsk Admin for details!");
					window.location.href = "usercreatedefect.jsp";
					</script>
	<%
}
con.close();
} 
catch(Exception ex)
{ 
out.println(ex);
}
%>

</body>
</html>