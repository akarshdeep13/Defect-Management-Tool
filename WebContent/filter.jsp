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
	<meta charset="utf-8"/>
	<script src="jquery-1.4.2.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="draw_table.js"></script>
	<script type="text/javascript" src="search.js"></script>
	
	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<title>User Dashboard</title>
	<script type="text/javascript">
	
	$("#js-search").keyup(function(){
	    _this = this;
	    alert("hello");	    
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

<body>
<form name=f1 action=user_edit_defect.jsp>



<input type="text" style="width: 20%" id="js-search" placeholder="Search Hear !!">


<table class="js-table">
			<thead class="js-thead">
            <tr role="row">

                <th>Nom</th>

                <th>Poste</th>

                <th>Ville</th>

                <th>Age</th>

                <th>Date de début</th>

                <th>Salaire</th>

            </tr>

        </thead>

        <tbody>

            <tr>

                <td>Achraf Bellaali</td>

                <td>Développeur web</td>

                <td>Salé</td>

                <td>23</td>

                <td>2015/11/28</td>

                <td>10500 DH</td>

            </tr>

            <tr>

                <td>Jean Jack</td>

                <td>CEO</td>

                <td>Casablanca</td>

                <td>47</td>

                <td>2014/03/05</td>

                <td>14600 DH</td>

            </tr>

            <tr>

                <td>Michael Dalas</td>

                <td>Web designer</td>

                <td>NYC</td>

                <td>40</td>

                <td>2011/12/13</td>

                <td>$1500</td>

            </tr>

            <tr>

                <td>ipsum lorem</td>

                <td>ipsum lorem dolor</td>

                <td>Casablanca</td>

                <td>47</td>

                <td>2009/10/09</td>

                <td>12000 DH</td>

            </tr>

            <tr>

                <td>ipsum lorem</td>

                <td>ipsum lorem dolor</td>

                <td>Casablanca</td>

                <td>47</td>

                <td>2009/10/09</td>

                <td>12000 DH</td>

            </tr>

            <tr>

                <td>ipsum lorem</td>

                <td>ipsum lorem dolor</td>

                <td>Casablanca</td>

                <td>47</td>

                <td>2009/10/09</td>

                <td>12000 DH</td>

            </tr>

            <tr>

                <td>ipsum lorem</td>

                <td>ipsum lorem dolor</td>

                <td>Casablanca</td>

                <td>47</td>

                <td>2009/10/09</td>

                <td>12000 DH</td>

            </tr>

            <tr>

                <td>ipsum lorem</td>

                <td>ipsum lorem dolor</td>

                <td>Casablanca</td>

                <td>47</td>

                <td>2009/10/09</td>

                <td>12000 DH</td>

            </tr>

            <tr>

                <td>ipsum lorem</td>

                <td>ipsum lorem dolor</td>

                <td>Casablanca</td>

                <td>47</td>

                <td>2009/10/09</td>

                <td>12000 DH</td>

            </tr>

            <tr>

                <td>ipsum lorem</td>

                <td>ipsum lorem dolor</td>

                <td>Casablanca</td>

                <td>47</td>

                <td>2009/10/09</td>

                <td>12000 DH</td>

            </tr>

            <tr>

                <td>ipsum lorem</td>

                <td>ipsum lorem dolor</td>

                <td>Casablanca</td>

                <td>47</td>

                <td>2009/10/09</td>

                <td>12000 DH</td>

            </tr>

            <tr>

                <td>ipsum lorem</td>

                <td>ipsum lorem dolor</td>

                <td>Casablanca</td>

                <td>47</td>

                <td>2009/10/09</td>

                <td>12000 DH</td>

            </tr>

            <tr>

                <td>ipsum lorem</td>

                <td>ipsum lorem dolor</td>

                <td>Casablanca</td>

                <td>47</td>

                <td>2009/10/09</td>

                <td>12000 DH</td>

            </tr>

            <tr>

                <td>ipsum lorem</td>

                <td>ipsum lorem dolor</td>

                <td>Casablanca</td>

                <td>47</td>

                <td>2009/10/09</td>

                <td>12000 DH</td>

            </tr>

            <tr>

                <td>ipsum lorem</td>

                <td>ipsum lorem dolor</td>

                <td>Casablanca</td>

                <td>47</td>

                <td>2009/10/09</td>

                <td>12000 DH</td>

            </tr>

            <tr>

                <td>ipsum lorem</td>

                <td>ipsum lorem dolor</td>

                <td>Casablanca</td>

                <td>47</td>

                <td>2009/10/09</td>

                <td>12000 DH</td>

            </tr>
        </tbody>
		</table>

</form>  




</body>
</html>
<%}%>