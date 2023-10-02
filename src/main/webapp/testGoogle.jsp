<%-- 
    Document   : testGoogle
    Created on : Sep 26, 2023, 9:24:46 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>google</title>
    </head>
    <body>
        <h1>google</h1>
        <%
            String id = request.getAttribute("id").toString();
            String email = request.getAttribute("email").toString();
            String name = request.getAttribute("name").toString();
            String given_name = request.getAttribute("given_name").toString();
            String family_name = request.getAttribute("family_name").toString();
            String picture = request.getAttribute("picture").toString();
            out.print("Id: " + id);
            out.print("<br/>Email: " + email);
            out.print("<br/>Name: " + name);
            out.print("<br/>Given name: " + given_name);
            out.print("<br/>Family name: " + family_name);
            out.print("<br/>Pictrue: " + picture);
        %>
    </body>
</html>
