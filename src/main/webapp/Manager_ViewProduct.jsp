<%-- 
    Document   : Manager_ViewProduct
    Created on : 02-Oct-2023, 14:39:57
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <meta charset="utf-8" />
    <link rel="icon" type="image/png" href="img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <!-- Font & img CSS     -->
    <link href="font-img.css" rel="stylesheet" />
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

    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>

<body>

    <div class="wrapper">
        <div class="sidebar" data-color="green" data-image="img/sidebar-5.jpg" style="width: 26rem !important;">

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
                        <a href="Don_hang.html">
                            <i class="pe-7s-news-paper"></i>
                            <p>Don hang</p>
                        </a>
                    </li>
                    <li>
                        <a href="Don_hang.html">
                            <i class="pe-7s-note2"></i>
                            <p>Bill</p>
                        </a>
                    </li>
                    <li>
                        <a href="Thong_ke.html">
                            <i class="pe-7s-graph1"></i>
                            <p>Dashboard</p>
                        </a>
                    </li>
                    <li>
                        <a href="DispatchServlet?btAction=ManagerViewProduct">
                            <i class="pe-7s-drawer"></i>
                            <p>Tat ca san pham</p>
                        </a>
                    </li>
                    <li>
                        <a href="Feedback.html">
                            <i class="pe-7s-repeat"></i>
                            <p>Feedback</p>
                        </a>
                    </li>
                    <li>
                        <a href="Update_product.html">
                            <i class="pe-7s-note"></i>
                            <p>Update Product</p>
                        </a>
                    </li>
                </ul>
                <div style="text-align: center;">
                    <a href="#">
                        <i class="pe-7s-back pe-rotate-180" style="font-size: 50px; margin-top: 50px; color: black;"></i>
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
                                <h4 class="title">Accounts</h4>
                                <p class="category">Staff & Manager</p>
                            </div>
                            <div class="content-font-img">
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
                                                    <th>Tuổi thọ</th>
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
                                                        <td>${dto.quantity}</td>
                                                        <td>${dto.salePrice}</td>
                                                        <td>${dto.lifeExpectancy}</td>
                                                        <td>
                                                            
                                                            <a href="${deleteLink}">Delete</a>   
                                                            <input type="hidden" name="lastSearchValue" 
                                                                   value="" />
                                                            <input type="submit" value="Update" name="btAction"/></td>
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
<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="vendor/datatables/jquery.dataTables.min.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

<script src="js/demo/datatables-demo.js"></script>

</html>
