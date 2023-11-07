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
    <title>View All Product</title>
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
    <link href="css_admin/bootstrap1.min.css" rel="stylesheet" />

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

    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css_admin/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>

<body>


    <div class="wrapper">
        <%@include file="components//ManagerComponent.jsp" %>

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
                    <div class="col-md-pull-12" style="display: block; " >
                        <a style="font-size: 20px;background-color: #3dcb3d;height: 36px;border-radius: 8px;color: #fff;" class="navbar-brand manager-active" href="DispatchServlet?btAction=AddProduct">Thêm sản phẩm</a>

                    </div>
                    <br>
                    <br>
                    <br>
                    <br>

                    <div class="col-md-pull-12">
                        <div class="card-font-img">

                            <div class="header-font-img-admin" style="margin-left: 20px;">
                                <h4 class="title" style="font-size: 30px">Tất cả sản phẩm</h4>
                                <p class="category" style="font-size: 25px">Staff & Manager</p>
                            </div>
                            <div class="content-font-img" style="font-size: 25px !important">
                                <div class="table-responsive">
                                    <c:set var="result" value="${requestScope.PRODUCT_LIST}"/>
                                    <c:if test="${not empty result}">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Tên</th>
                                                    <th>Số lượng</th>
                                                    <th>Giá</th>
                                                    <th>Loại</th>
                                                    <th>Xóa/Sửa</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="dto" items="${result}" varStatus="counter">

                                                    <tr>
                                                        <td style="text-align: center">

                                                            ${dto.idBird}                                                     
                                                        </td>
                                                        <td>${dto.name}</td>
                                                        <td>
                                                            ${dto.quantity}
                                                        </td>
                                                        <td>
                                                            <fmt:formatNumber value="${dto.salePrice}" maxFractionDigits="0"/> VND

                                                        </td>
                                                        <td>
                                                            ${dto.period}
                                                        </td>
                                                        <td>          
                                                            <a href="DispatchServlet?btAction=ViewUpdateProduct&txtIdBird=${dto.idBird}">Update</a>
                                                            <a href="DispatchServlet?btAction=DeleteProduct&txtIdBird=${dto.idBird}">Delete</a>
                                                        </td>
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
