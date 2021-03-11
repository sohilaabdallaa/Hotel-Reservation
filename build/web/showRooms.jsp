<%-- 
    Document   : showRooms
    Created on : Jan 7, 2021, 6:15:08 PM
    Author     : Sohila
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String url = "jdbc:mysql://localhost:3306/hotelreservationsystem";
            String user = "root";
            String password = "root";
            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;
            try {
                Con = DriverManager.getConnection(url, user, password);
                Stmt = Con.createStatement();
                String hotelID = request.getSession().getAttribute("hotelID").toString(); 
                RS = Stmt.executeQuery("SELECT * FROM rooms where hotelID='" + hotelID + "';");  %>
                <table border="1">
            <tr>
                <th>room id </th> 
                <th>room available </th> 
                <th>room type</th> 
                <th>room facilities</th> 
            </tr>
            <%      
                while (RS.next()) {               
            %>
            <tr>
                
                <td><%=RS.getInt("roomID")%></td>
                 <td><%=RS.getString("roomsavailable")%></td>
                <td><%=RS.getString("roomType")%></td>
                 <td><%=RS.getString("roomFacilities")%></td>              
                <%}  %>
            </tr>
        </table>
            <br><br>
             <a href="customerhome.html">Back to Home</a>
             <br> <a href="search.html">Back to search hotel</a>                      
         <%   
             }catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }
        %>
        <%
            RS.close();
            Stmt.close();
            Con.close();
        %>
    </body>
</html>

