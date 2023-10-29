<%-- 
    Document   : Register
    Created on : Sep 21, 2023, 5:14:43 PM
    Author     : Admin
--%>

<%@page import="birdfarm.util.RegistrationCreateError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="css/Register.css">
    </head>
    <body>
        <div class="container">
            <div class="wrapper">
                <div class="title"><span>Register</span></div>
                <form action="DispatchServlet" method="POST">
                    <div class="row">          
                        <input style="margin-bottom: 10px" name="txtUsername" type="text" placeholder="UserName(6-15 chars)" required><br/>
                        <font color="red">
                        <%
                            RegistrationCreateError errors
                                    = (RegistrationCreateError) request.getAttribute("CREATE_ERROR");
                            if (errors != null) {
                                if (errors.getUsernameLengthErr() != null) {
                        %>
                        <%=errors.getUsernameLengthErr()%>
                        <%
                                }
                            }
                        %>
                        </font>
                        <input style="margin-bottom: 10px" name="txtPassword" type="text" placeholder="Password(8-15 chars)" required><br/>
                        <font color="red">
                        <%
                            if (errors != null) {
                                if (errors.getPasswordLengthErr() != null) {
                        %>
                        <%=errors.getPasswordLengthErr()%>
                        <%
                                }
                            }
                        %>
                        </font>
                        <input style="margin-bottom: 10px" name="txtConfirm" type="text" placeholder="Confirm Password" required><br/>
                        <font color="red">
                        <%
                            if (errors != null) {
                                if (errors.getConfirmNotMatched()!= null) {
                        %>
                        <%=errors.getConfirmNotMatched()%>
                        <%
                                }
                            }
                        %>
                        </font>
                        <input style="margin-bottom: 10px" name="txtEmail" type="text" placeholder="Email" required><br/>
                        <input style="margin-bottom: 10px" name="txtAddress" type="text" placeholder="Address" required><br/>
                        <input  style="margin-bottom: 10px" name="txtPhonenumber" type="text" placeholder="Phonenumber" required><br/>
                         <font color="red">
                        <%
                            if (errors != null) {
                                if (errors.getFullNameLengthErr()!= null) {
                        %>
                        <%=errors.getFullNameLengthErr() %>
                        <%
                                }
                            }
                        %>
                        </font>
                    </div>
                    <div class="row button">
                        <input type="submit" value="Register" name="btAction" />
                        <div class="signup-link">Already have an account? <a href="Login.jsp">Back to Login</a></div>
                    </div>
                </form><br/>
                 <font color="red">
                        <%
                            if (errors != null) {
                                if (errors.getUsernameIsExisted()!= null) {
                        %>
                        <%=errors.getUsernameIsExisted()%>
                        <%
                                }
                            }
                        %>
                        </font>
            </div>
        </div>
    </body>
</html>
