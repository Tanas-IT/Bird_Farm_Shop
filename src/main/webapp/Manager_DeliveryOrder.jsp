<%-- 
    Document   : Manager_ViewProduct
    Created on : 02-Oct-2023, 14:39:57
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
      <title>View Delivery Order</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="img/bird_logo.png" />
    <meta charset="utf-8" />
    <link rel="icon" type="image/png" href="img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <!-- Font & img CSS     -->
    <link href="font-img.css" rel="stylesheet" />
    <!-- Bootstrap core CSS     -->
    <link href="css_admin/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- Animation library for notifications   -->
    <link href="css_admin/animate.min.css" rel="stylesheet" />

    <!--  Light Bootstrap Table core CSS    -->
    <link href="css_admin/light-bootstrap-dashboard-1.css?v=1.4.0" rel="stylesheet" />


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="css_admin/demo.css" rel="stylesheet" />


    <!--     Fonts and icons     -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="css_admin/pe-icon-7-stroke.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">

    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <!--<link href="css/bootstrap.min.css" rel="stylesheet">-->
    <link href="css_admin/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>

<body>

    <div class="wrapper">
       <c:if test="${sessionScope.user.roleName == 'Quản lý'}">
            <%@include file="components//ManagerComponent.jsp" %>
        </c:if>
        <c:if test="${sessionScope.user.roleName == 'Nhân viên'}">
            <%@include file="components//StaffComponent.jsp" %>
        </c:if>
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
                    <%@include file="components//Manager_Order_Component.jsp" %>

                    <div class="col-md-pull-12">
                        <div class="card-font-img">

                            <div class="header-font-img-admin" style="margin-left: 20px">
                                <h4 class="title" style="font-size: 30px">Đơn hàng đang giao</h4>
                                <p class="category" style="font-size: 25px">Staff & Manager</p>
                            </div>
                            <div class="content-font-img" style="font-size: 25px !important">
                                <div class="table-responsive">
                                    <c:set var="result" value="${requestScope.ORDER_LIST}"/>
                                    <c:if test="${not empty result}">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>Mã đơn hàng</th>
                                                    <th>Tên người đặt</th>
                                                    <th>Ngày đặt</th>
                                                    <th>Trạng thái đơn hàng</th>
                                                    <th>Tổng tiền</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody >
                                                <c:forEach var="dto" items="${result}" varStatus="counter">

                                                    <tr>
                                                        <td style="text-align: center">

                                                            ${dto.idOrder}                                                     
                                                        </td>
                                                        <td>${dto.fullName}</td>
                                                        <td>
                                                            ${dto.createdDate}
                                                        </td>
                                                        <td>
                                                            ${dto.status}
                                                        </td>
                                                        <td>
                                                            <fmt:formatNumber value="${dto.total}" maxFractionDigits="0"/> VND                                                        
                                                        </td>
                                                        <td class="d-flex justify-content-around align-items-center">

                                                            <a href="DispatchServlet?btAction=DetailOrder&txtidOrder=${dto.idOrder}">
                                                                <i class="fa-solid fa-eye"></i>
                                                            </a>

                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>

                                    </c:if>

                                    <c:if test="${empty result}">
                                        <h2 class="d-flex justify-content-around align-items-center" style="font-size: 50px"s>Không có đơn hàng</h2>
                                    </c:if>  

                                </div>
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

<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script src="js_admin/light-bootstrap-dashboard.js?v=1.4.0"></script>

<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
<script src="js_admin/demo.js"></script>
<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js_admin/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="vendor/datatables/jquery.dataTables.min.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

<script src="js_admin/demo/datatables-demo.js"></script>

</html>
