<%@ page import ="java.sql.*" %>
<%
	String username = request.getParameter("user_id");   
	String password = request.getParameter("password");
	try{
		Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dmt", "root", "");
        Statement st=conn.createStatement();
     	
        
        
        Statement statement=conn.createStatement();
        String abcde = "select roles from user_details where user_id="+username;
        ResultSet rstr = statement.executeQuery(abcde);
        rstr.next();
        String rr= rstr.getString("roles");
        session.setAttribute("rr",rr);
        
        
        
        
        
        ResultSet nm= st.executeQuery("Select first_name from user_details where user_id="+username);
        nm.next();
        String name=nm.getString("first_name");
        session.setAttribute("name",name);
        session.setAttribute("uid",username);
        session.setAttribute("pass",password);
        ResultSet sta= st.executeQuery("Select status from user_details where user_id="+username);
        sta.next();
        String stat=sta.getString("status");
        if(stat.equals("Active"))
        {
        PreparedStatement pst = conn.prepareStatement("Select user_id,password from user_details where user_id=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next()) 
        {
        if(username.equals("1234567"))
        	response.sendRedirect("dashboard.jsp");
        else
        	response.sendRedirect("userdashboard.jsp");
        }else{%>
    		<script>
    			window.alert("Invalid Credentials!");
    			window.location.href = "login.html";
    		</script>
    	<%}            
   		}else{%>
        	<script>
        		window.alert("User is Inactive\nPlease Contact Admin!");
        		window.location.href = "login.html";
        	</script>
        <%}}
   catch(Exception e)
   {       
	   out.println(e);
	   %>
		<script>
    			window.alert(<%=e%>);
    			window.location.href = "login.html";
    		</script>
		<%       
   } 
%>
