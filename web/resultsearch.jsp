<%-- 
    Document   : resultsearch
    Created on : Jan 1, 2021, 11:34:44 PM
    Author     : Sohila
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
  
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" type="text/css" href="css.css">
        <script>
            function TestsFunction() {
                TestsDiv.style.display = 'block'
            }
        </script>
        <style>
            body{
                
                background-image: url(photo10.jpg);
            }
            .searchresultdiv
            {
                text-align: center;
                border: 5px solid darkred ;
                border-radius: 9px;
                width: 30%;
                font-size: 20px;
                font: Times New Roman;
                padding: 20px;
                color:white;
      

            }

        </style>

    </head>
    <body>
        <%
            String city = request.getParameter("place");
            String check_in = request.getParameter("reservation-stard");
            String check_out = request.getParameter("reservation-end");
            String adults = request.getParameter("number of adults");
            String children = request.getParameter("number of children");

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/hotelreservationsystem";
            String user = "root";
            String password = "root";
            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;
            Con = DriverManager.getConnection(url, user, password);
            Stmt = Con.createStatement();
            RS = Stmt.executeQuery("select* from hotels where city='" + city + "';");
        %>

        <div class="searchresultdiv">


            <%
               while (RS.next()) {%>
            <% String locationpath = RS.getString("googleMap");
                int hotelID = RS.getInt("hotelID");
                HttpSession s = request.getSession(true);
                s.setAttribute("hotelID", hotelID);
            %>


            <tr>
                Hotel Name: <%=RS.getString("hotelName")%>
            <br>
            Number Of Rooms: <%=RS.getString("roomNumber")%>
            <br>
            Hotel Rating: <%=RS.getString("rating")%>
            <br>
            The Availability: <%=RS.getString("availability")%>
            <br>
            Price Per Day: <%=RS.getString("price")%> 
            <br>
            Hotel location: <%=RS.getString("location")%>
            <br>
            type: <%=RS.getString("strars")%> stars
            <br>
            Meals: <%=RS.getString("meals")%>
            <br>
            <%=RS.getString("email")%>
            <br>
            <%=RS.getString("phone")%>
            <br>
            <%=RS.getString("hotelFacilities")%>
            <br> <a href="showRooms.jsp"class="w-bar-item w3-button w3-mobile">Show hotel rooms</a>
            <br> <a href="viewPhotos.jsp"class="w-bar-item w3-button w3-mobile">View hotel photos</a>         
            <br> <a href="<%=RS.getString("googleMap")%>"class="w-bar-item w3-button w3-mobile">loaction</a>

        </tr>         
    

</div>
<%}%>
<div>
    </br>
    </br>
<a href="customerhome.jsp"class="w3-bar-item w3-button w3-left w3-red w3-mobile">Bach to Home</a>
</div>
<%
    RS.close();
    Stmt.close();
    Con.close();
%>

</body>
</html>
