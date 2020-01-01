<%@page import="java.util.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.util.*"%>
<%@page import="java.text.*"%>
<%
String name=(String)session.getAttribute("name");
String id=(String)session.getAttribute("uid");
Random rand = new Random();
int did = rand.nextInt(90000) + 10000;

Date date = Calendar.getInstance().getTime();
DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
String today = formatter.format(date);
Calendar cal = Calendar.getInstance();
cal.add(Calendar.MONTH, -1);
Date result = cal.getTime();
String past=formatter.format(result);


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
	try
	{		
			Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        	Connection conn = DriverManager.getConnection("jdbc:mysql://10.250.251.97:3306/DMT", "dmttest", "dmttest");
       		Statement st=conn.createStatement();
		 	String sql ="select max(defect_id) from create_defect";
	    	ResultSet resultSet = st.executeQuery(sql);
	    	resultSet.next();
	    	did= resultSet.getInt(1);
	}
	catch(Exception e)
	{
		
	}
%>
<html>
<head>
<script>
$(".readonly").keydown(function(e){
    e.preventDefault();
});
</script>
<script type="text/javascript">
        function blockSpecialChars(e) {
            var k = e.keyCode;
            if((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 )
            return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 );
            else
            	{
            	alert("Enter Only Character type values!");
            	return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 );
            	}
            	
        }
    </script>
<script type="text/javascript">
function blockSpecialChar(e) {
    var k = e.keyCode;
    if(k >= 48 && k <= 57)
    return ( (k >= 48 && k <= 57) );
    else
    	{
    	alert("Enter Only Numeric type values!");
    	return ( (k >= 48 && k <= 57) );
    	}
}
    </script>
<script type="text/javascript" src="timeFormat.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css">
<title>Create Defect</title>

</head>
<style>
html,body,h1,h2,h3,h4,h5,h6,label {
    font-family: "Comic Sans MS", cursive, sans-serif;
}
</style>

<body onload="startTime()">
<div class="topnav" id="myTopnav">
  <a href="dashboard.jsp">Home</a>
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
      <a href="createdefect.jsp" class="active">Create Defect</a>
     
	 
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
<form name = f1 method ="post" action="admin_create_defect.jsp" style= "border:1px solid #ccc">
<div class="container">
<h1>Create Defect</h1>
<hr>
<center>
<table >
<tr>
<td><label>Defect ID <font color="red">*</font></label></td><td><input type = "tel" minlength="7" maxlength="7" placeholder="Enter Defect ID" value="<%=did+1%>" name="defect_id" style="width:100%;" required readonly ></td>
<td><label for="Db">&nbsp;&nbsp;Defected By<font color="red">*</font></label></td><td><input type="text"  name="Defected_by" style="width:100%;" value="<%=id%>" readonly></td></tr>
     <tr><td><label for="Dt">Defect Type<font color="red">*</font></label></td>
   <td>	<select name="Defect_type" required style="width:100%;">
      <option value="Functional">Functional</option>
      <option value="Design">Design</option>
      <option value="Enhancement">Enhancement</option>
      <option value="Performance">Performance</option>
      <option value="Usability">Usability</option>
      </select></td>
	<td><label for="Dd">&nbsp;&nbsp;Defect Date<font color="red">*</font></label></td>
    <td><input type="date" min=<%=past %> max=<%=today%>  id=datefield  name="Defect_date" placeholder="Enter Defect Date" style="width:100%;" required></td></tr>

    <tr><td><label for="status">Status<font color="red">*</font></label></td>
    <td><input type="text" name="status" required style="width:100%;" readonly value="New"></td>
    <td><label for="env">&nbsp;&nbsp;Environment</label></td>
    <td><select name="environment" style="width:100%;">
      <option value="QA">QA</option>
      <option value="UAT">UAT</option>
      <option value="Production">Production</option>
      <option value="Alpha">Alpha</option>
      <option value="Beta">Beta</option>
      </select></td></tr>
      <tr><td><label for="at">Assigned to<font color="red">*</font></label></td>
    <td>
    <input type="tel" id="assigned_to" name="assigned_to" placeholder="Enter Assigned to" required minlength="7" maxlength="7" style="width:100%;" class="readonly" onclick="javascript:void window.open('popup.jsp','1528179581495','width=500,height=500,toolbar=0,menubar=0,location=0,status=1,scrollbars=0,resizable=0,left=0,top=0');return false;">
    </td>
    <td><label for="svr">&nbsp;&nbsp;Severity<font color="red">*</font></label></td>
   <td><select name="severity" required style="width:100%;">
          <option value="Critical">Critical</option>
      <option value="High">High</option>
      <option value="Medium">Medium</option>
      <option value="Low">Low</option>
      </select></td></tr>
      <tr><td><label for="pr">Priority<font color="red">*</font></label></td>
    <td><select name="priority" required style="width:100%;">
      <option value="1">1</option>
      <option value="2">2</option>
       <option value="3">3</option>
      <option value="4">4</option>
  </select></td>
  <td><label for="tp">&nbsp;&nbsp;Test phase<font color="red">*</font></label></td>
  <td><select name="test_phase" required style="width:100%;">
      <option value="Functional">Functional</option>
      <option value="SIT">SIT</option>
       <option value="Regression">Regression</option>
      <option value="Production">Production</option>
      <option value="UAT">UAT</option>
      <option value="Smoke">Smoke</option>
      <option value="Load">Load</option>
  </select></td></tr>
  <tr height="150" ><td><label for="tp">Defect Description<font color="red">*</font></label></td>
  <td colspan=3><textarea rows="4" cols="50" maxlength="300" name="Defect_description" placeholder="Enter Defect Description...." style="width:100%;background: #f1f1f1;" required></textarea></td></tr>
</table>
<table style="width:10%">
<tr>
<td>
<button type ="submit" class="signupbtn" style="width:80%;">Submit</button></td>
<td><button type ="reset" class="cancelbtn" style="width:80%;">Clear</button></td></tr></table>
</center>
</div>

</form>
</body>
</html>
<%}%>