<%-- 
    Document   : Manager_ViewFeedback
    Created on : 27-Sep-2023, 23:37:09
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

        <!-- Font & img CSS     -->
        <link href="css_admin/font-img.css" rel="stylesheet" />
        <!-- Bootstrap core CSS     -->
        <link href="css_admin/bootstrap.min.css" rel="stylesheet" />

        <!-- Animation library for notifications   -->
        <link href="css_admin/animate.min.css" rel="stylesheet" />

        <!--  Light Bootstrap Table core CSS    -->
        <link href="css_admin/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet" />


        <!--  CSS for Demo Purpose, don't include it in your project     -->
        <link href="css_admin/demo.css" rel="stylesheet" />


        <!--     Fonts and icons     -->
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
        <link href="css_admin/pe-icon-7-stroke.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" >
    </head>

    <body>

        <div class="wrapper">
        <%@include file="components//ManagerComponent.jsp" %>

            <div class="main-panel">
                <nav class="navbar navbar-default navbar-fixed">
                    <div class="container-fluid">
                        <div class="navbar-header">
                           
                        </div>
                        
                    </div>
                </nav>


                <div class="content">
                    <div class="container-fluid">


                        <div class="col-md-pull-12" style="font-size: 18px">
                            <div class="card-font-img">

                                <div class="header-font-img-admin" style="margin-left: 20px;">
                                    <h4 class="title" style="font-size: 30px">Feedback</h4>
                                    <p class="category" style="font-size: 18px">Staff &Manager</p>
                                </div>
                                <div class="content-font-img">
                                    <c:set var="result" value="${requestScope.FEEDBACK_LIST}"/>
                                    <c:if test="${not empty result}">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th>STT</th>
                                                    <th>Tên</th>
                                                    <th>Email</th>
                                                    <th>Phản hồi</th>
                                                    <th>Ngày</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="dto" items="${result}" varStatus="counter">
                                                    <tr>
                                                        <td style="text-align: center">
                                                            ${counter.count}
                                                        </td>
                                                        <td>${dto.fullName}</td>
                                                        <td>${dto.email}</td>
                                                        <td>${dto.content}</td>
                                                        <td>${dto.createdDate}</td>
                                                    </tr>

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
    <!--   Core JS Files   -->
    <script src="js_admin/jquery.3.2.1.min.js" type="text/javascript"></script>
    <script src="js_admin/bootstrap.min.js" type="text/javascript"></script>

    <!--  Charts Plugin -->
    <script src="js_admin/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="js_admin/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
    <script src="js_admin/light-bootstrap-dashboard.js?v=1.4.0"></script>

    <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
    <script src="js_admin/demo.js"></script>
</html>
