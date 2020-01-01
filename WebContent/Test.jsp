
<%@page import="java.util.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>

<html>
<head>
<script src="jquery-1.4.2.min.js" type="text/javascript"></script>
<script>
$(document).ready(function(){
	$("#js-search").keyup(function(){
	    _this = this;
	    $.each($(".js-table tbody tr"), function() {
	        if($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
	            $(this).hide();
	        else
	            $(this).show();
	    });
	});
});
</script>
</head>
<body>	
       <input type="text" style="width: 20%" id="js-search" placeholder="Type Here To Filterrrr !!!">         
		
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
	</div>
	
</body>
</html>