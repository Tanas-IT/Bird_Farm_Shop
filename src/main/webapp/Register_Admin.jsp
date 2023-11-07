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
        <title>Đăng kí</title>
        <link rel="stylesheet" href="css/Register.css">
        <link rel="icon" type="image/x-icon" href="img/bird_logo.png" />
    </head>
    <body>
        <style>
            .style-select {
                width: 85px;
                height: 30px;
                margin: 10px;
                font-size: 16px;
            }
        </style>
        <div class="container">
            <div style="padding-bottom: 270px" class="wrapper">
                <div class="title"><span>Đăng kí</span></div>
                <form action="DispatchServlet" method="POST">
                    <div class="row">          
                        <input style="margin-bottom: 10px" name="txtUsername" type="text" placeholder="Tên đăng nhập(6-15 kí tự)" required><br/>
                        <div>
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
                        </div>
                        <input style="margin-bottom: 10px" name="txtPassword" type="text" placeholder="Mật khẩu(8-15 kí tự)" required><br/>
                        <div>
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
                        </div>
                        <input style="margin-bottom: 10px" name="txtConfirm" type="text" placeholder="Xác nhận mật khẩu" required><br/>
                        <div>
                            <font color="red">
                            <%
                                if (errors != null) {
                                    if (errors.getConfirmNotMatched() != null) {
                            %>
                            <%=errors.getConfirmNotMatched()%>
                            <%
                                    }
                                }
                            %>
                            </font>
                        </div>
                        <input style="margin-bottom: 10px" name="txtFullName" type="text" placeholder="Họ và tên" required><br/>
                        <div>
                            <font color="red">
                            <%
                                if (errors != null) {
                                    if (errors.getFullNameLengthErr() != null) {
                            %>
                            <%=errors.getFullNameLengthErr()%>
                            <%
                                    }
                                }
                            %>
                            </font>
                        </div>
                        <input style="margin-bottom: 10px" name="txtEmail" type="email" placeholder="Email" required><br/>
                        <input style="margin-bottom: 10px" name="txtAddress" type="text" placeholder="Địa chỉ" required><br/>
                        <input  style="margin-bottom: 10px" name="txtPhonenumber" type="text" placeholder="Số điện thoại" required><br/>
                        <label style="font-size: 18px">Role</label>
                        <select class="form-control style-select" name="txtRole" >
                            <option value="2">Quản lý</option>
                            <option value="3">Nhân viên</option>
                        </select>
                        <div> 
                            <font color="red">
                            <%
                                if (errors != null) {
                                    if (errors.getFullNameLengthErr() != null) {
                            %>
                            <%=errors.getFullNameLengthErr()%>
                            <%
                                    }
                                }
                            %>
                            </font>
                            <div> 
                            </div>
                            <div class="row button">
                                <input type="submit" value="RegisterAdmin" name="btAction"/>
                            </div>
                            </form><br/>
                            <font color="red">
                            <%
                                if (errors != null) {
                                    if (errors.getUsernameIsExisted() != null) {
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
