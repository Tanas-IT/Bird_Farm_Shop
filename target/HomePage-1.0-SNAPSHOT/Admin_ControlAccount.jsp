<%-- 
    Document   : Admin_ControlAccount
    Created on : 18-Sep-2023, 14:30:01
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <link rel="icon" type="image/png" href="img/favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />

        <%@include file="components/adminScriptComponent.jsp" %>
    </head>

    <body>

        <div class="wrapper">
            <%@include file="components/adminComponent.jsp" %>
            <div class="main-panel">
                <nav class="navbar navbar-default navbar-fixed">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse"
                                    data-target="#navigation-example-2">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>

                        </div>
                        <div class="collapse navbar-collapse">
                            <ul class="nav navbar-nav navbar-left">

                                <li class="separator hidden-lg hidden-md"></li>
                            </ul>
                        </div>
                    </div>
                </nav>


                <div class="content">
                    <div class="container-fluid">
                        <div class="col-md-pull-12">
                            <div class="card-font-img">

                                <div class="header-font-img-admin" style="margin-left: 20px;">
                                    <h4 class="title">Tai khoan</h4>
                                    <p class="category">Staff & Manager</p>
                                </div>
                                <div class="content-font-img">
                                    <c:set var="result" value="${requestScope.ACCOUNT_LIST}"/>
                                    <c:if test="${not empty result}">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Tên đăng nhập</th>
                                                    <th>Họ và tên</th>
                                                    <th>Vai trò</th>
                                                    <th>Mật khẩu</th>
                                                    <th>Đặt lại</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="dto" items="${result}" varStatus="counter">
                                                <form action="DispatchServlet">
                                                    <tr>
                                                        <td>${dto.idUser}</td>
                                                        <td>
                                                            ${dto.userName}
                                                            <input type="hidden" 
                                                                   name="txtUsername" 
                                                                   value="${dto.userName}" />
                                                        </td>
                                                        <td>
                                                            <input type="text" 
                                                                   name="txtfullName" 
                                                                   value="${dto.fullName}" />
                                                        </td>
                                                        <td>${dto.roleName}</td>
                                                        <td>
                                                            <input type="text" 
                                                                   name="txtpassword" 
                                                                   value="${dto.password}" />
                                                        </td>
                                                        <td>
                                                            <button type="submit" value="Update" name="btAction">
                                                                Update</button>
                                                        </td>
                                                    </tr>
                                                </form>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="footer">
                    <div class="container-fluid">
                    </div>
                </footer>
            </div>
        </div> 
    </body>

</html>
