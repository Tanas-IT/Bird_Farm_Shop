<%-- 
    Document   : Admin_ViewProduct
    Created on : 26-Sep-2023, 22:44:21
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
        <link href="css/font-img.css" rel="stylesheet" />
        <!-- Bootstrap core CSS     -->
        <link href="css/bootstrap.min.css" rel="stylesheet" />

        <!-- Animation library for notifications   -->
        <link href="css/animate.min.css" rel="stylesheet" />

        <!--  Light Bootstrap Table core CSS    -->
        <link href="css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet" />


        <!--  CSS for Demo Purpose, don't include it in your project     -->
        <link href="css/demo.css" rel="stylesheet" />


        <!--     Fonts and icons     -->
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
        <link href="css/pe-icon-7-stroke.css" rel="stylesheet" />
    </head>

    <body>

        <div class="wrapper">
            <div class="sidebar" data-color="green" data-image="img/sidebar-5.jpg">

                <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->


                <div class="sidebar-wrapper">
                    <div class="logo">
                        <a href="#" class="simple-text">
                            Bird Farm
                        </a>
                    </div>

                    <div class="user-image" style="text-align: center;">
                        <i class="pe-7s-user" style="font-size: 100px;"></i>
                        <p>Nguyen Duc Anh</p>
                        <p>Admin</p>
                    </div>

                    <ul class="nav">
                        <li>

                            <a href="DispatchServlet?btAction=AdminControlAccount">
                                <i class="pe-7s-user"></i>
                                <p>Tai khoan</p>
                            </a> 


                        </li>

                        <li>
                            <a href="DispatchServlet?btAction=AdminViewProduct">
                                <i class="pe-7s-note2"></i>
                                <p>Danh Muc San Pham</p>
                            </a>
                        </li>

                    </ul>
                    <div style="text-align: center;">
                        <a href="#">
                            <i class="fa fa-sign-out fa-rotate-180" style="font-size: 50px; margin-top: 50px; color: black;"></i>

                        </a>
                    </div>
                </div>
            </div>

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
                            <a class="navbar-brand" href="#">Table List</a>
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
                                    <h4 class="title">Products</h4>
                                    <p class="category">List of Product</p>
                                </div>
                                <div class="content-font-img">
                                    <c:set var="result" value="${requestScope.PRODUCT_LIST}"/>
                                    <c:if test="${not empty result}">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th>STT</th>
                                                    <th>ID</th>
                                                    <th>Tên</th>
                                                    <th>Số lượng</th>
                                                    <th>Giá bán</th>
                                                    <th>Tổ chim</th>
                                                    <th>Trạng thái</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="dto" items="${result}" varStatus="counter">
                                                    <tr>
                                                        <td style="text-align: center">
                                                            ${counter.count}
                                                        </td>
                                                        <td>${dto.idBird}</td>
                                                        <td>${dto.name}</td>
                                                        <td>${dto.quantity}</td>
                                                        <td>${dto.salePrice}</td>
                                                        <td>${dto.isBirdNest}</td>
                                                        <td>${dto.status}</td>
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

                <footer class="footer" >
                    <div class="container-fluid" >

                    </div>
                </footer>


            </div>
        </div>


    </body>

    <script src="js/jquery.3.2.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>

    <!--  Charts Plugin -->
    <script src="js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
    <script src="js/light-bootstrap-dashboard.js?v=1.4.0"></script>

    <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
    <script src="js/demo.js"></script>


</html>