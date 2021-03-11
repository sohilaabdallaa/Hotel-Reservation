<%-- 
    Document   : viewPhotos
    Created on : Jan 7, 2021, 6:16:56 PM
    Author     : Sohila
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<%@page import="java.sql.*"%>
<html>
    <head>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <style>
 @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap');
*{
  margin:0;
  padding:0;
  font-family: 'Roboto', sans-serif;
}

body {
  display:flex;
  justify-content:center;
  align-items:center;
  min-height:100vh;
  background: #fff;
}
.container{
  position:relative;
  display:flex;
  justify-content:center;
  align-items:center;
  flex-wrap:wrap;
  margin:40px 0;
}
.container .card {
  position:relative;
  width:300px;
  height:400px;
  margin:20px;
  overflow:hidden;
  box-shadow:0 5px 15px rgba(0,0,0,.2);
  border-radius:15px;
  display:flex;
  justify-center:center;
  align-items:center;
  cursor:pointer;
}
.container .card .imgBox {
  width:100%;
  height:100%;
}
.container .card .imgBox img {
  width:100%;
  height:100%;
  background-position: center;
  background-size: cover;
  object-fit:cover;
  transition:.3s ease-in-out;
}
.container .card:hover .imgBox img{
  transform:translateY(-20px);
}

        </style>
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
                RS = Stmt.executeQuery("SELECT * FROM photos where hotelID='" + hotelID + "';");  
                while(RS.next())
                 { %>                                          
                    
                 <div id="vueBind" class="container">
  <div v-for="data in content" class="card">
    <div class="imgBox">
     <img src=<%=RS.getString("image")%>>
    </div>
  </div>
</div>
                    
                   
                    
       <% }
       %>
        <div >
       <br> <a href="customerhome.jsp" class="w3-bar-item w3-button w3-right w3-light-grey w3-mobile">Back to Home</a><br>
           <br><a href="search.html"class="w3-bar-item w3-button w3-right w3-light-grey w3-mobile">Back to search hotel</a>
   </div>   
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
