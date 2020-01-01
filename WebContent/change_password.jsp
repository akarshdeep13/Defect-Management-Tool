<%@ page import ="java.sql.*" %>
<%
	String username = request.getParameter("user_id");   
	String password = request.getParameter("oldpassword");
	String password1 = request.getParameter("newpassword");
	String password2 = request.getParameter("cnfpassword");
	String pwd=(String)session.getAttribute("pass");
	if(password1.equals(password2) && password.equals(pwd))
	{
	try{
		int j=0;
		Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dmt", "root", "");
        PreparedStatement pst = conn.prepareStatement("UPDATE user_details  SET password = ? where user_id="+username);
		pst.setString(1,password1);
        j = pst.executeUpdate();
        if(j>0)           
		{
			%>
					<script>window.alert("Updated Successfully");
					window.location.href = "userdashboard.jsp";
					</script>
					<%
					
				
		}
        else
		{
			%>
            <script>window.alert("Error\nNot Updated!");
            window.location.href = "changepassword.jsp";
            </script>
            <%   

		}
	}
   catch(Exception e)
    {       
       out.println(e);       
    }
	}
	else
	{
		%>
    	<script>
    		window.alert("Password Didn't Match");
    		window.location.href = "changepassword.jsp";
    	</script>
    <%
	}
%>
