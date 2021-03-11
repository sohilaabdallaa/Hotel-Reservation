<%-- 
    Document   : customerhome
    Created on : Jan 7, 2021, 8:34:49 PM
    Author     : Sohila
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css.css">

    </head>
    <body>
        <div>customer</div>
        <input type="submit" value="update" onclick="location.href='update.html'"><br> <br> 
        <input type="submit" value="Book" onclick="location.href = 'reservation.html';" /> <br> <br> 
        <input type="submit" value="search" onclick="location.href = 'search.html';" /> <br> <br> 
        <input type="submit" value="Log out" onclick="location.href='logout'"><br> <br> 
        <% 

        if (session.getAttribute("message") != null) {
        out.println(session.getAttribute("message"));
        session.removeAttribute("message");
        }
        %>
    </body>
</html>
