<%@ page import ="java.sql.*" %>

<%
try{
        String[] username = request.getParameterValues("user_id");
		String[] firstn = request.getParameterValues("first_name");
		String[] lastn = request.getParameterValues("last_name");
		String[] pass = request.getParameterValues("password");
		String[] roles = request.getParameterValues("role");
		String[] sta = request.getParameterValues("status");
		int j=0;
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dmt", "root", "");
        for(int i=0;i<username.length;i++){
        PreparedStatement pst = conn.prepareStatement("UPDATE user_details  SET first_name = ?, last_name = ?,password = ?, status = ?, roles = ? where user_id="+username[i]);
		pst.setString(1, firstn[i]);
		pst.setString(2, lastn[i]);
		pst.setString(3, pass[i]);
		pst.setString(4, sta[i]);
		pst.setString(5, roles[i]);
         j = pst.executeUpdate();
        }
        
        if(j>0)           
		{
			%>
					<script>window.alert("Updated Successfully");
					window.location.href = "dashboard.jsp";
					</script>
					<%
					
				
		}
        else
		{
			%>
            <script>window.alert("Update Not Successfull");
            window.location.href = "dashboard.jsp";
            </script>
            <%   

		}
}
        	
        

   catch(Exception e){       
       out.println(e);       
   }  

        
%>