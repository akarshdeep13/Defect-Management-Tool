<%@ page import ="java.sql.*" %>
	<%
    try{
    	 String[] username = request.getParameterValues("user_id");
    	 int i=0;
        
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dmt", "root", "");
        for(int j=0;j<username.length;j++){
        Statement st=conn.createStatement();
         i=st.executeUpdate("UPDATE user_details  SET status='Inactive' where user_id="+username[j]);
        }
        if(i>0)
        {
        %>
        			<script>
					window.alert("User Deleted Successfully!");
					window.location.href = "dashboard.jsp";
					</script>
        			
		<%			
        }
        else
        {
        %>
        			<script>
					window.alert("User ID Not Found!");
					window.location.href = "delete_user.html";
					</script>
		<%
        	
        }
        }
        
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
%>