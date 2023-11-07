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
        <style>
            table {
                border-collapse: separate;
                border-spacing: 0 10px;
                border: 1px solid #000; /* Viền cho bảng */
                margin-left: auto;
                margin-right: auto;
                border-radius: 10px;
            }
            table {
                box-shadow: 0px 0px 10px 5px rgba(0, 0, 0, 0.3); /* Màu xung quanh viền bảng */
            }

            td, th {
                padding: 10px;
            }
            
            
               .custom-button {
        background-color: #4CAF50; /* Màu nền xanh lá cây */
        border: none; /* Xóa viền mặc định */
        color: white; /* Màu chữ */
        padding: 10px 24px; /* Thêm một số padding */
        text-align: center; /* Căn giữa chữ */
        text-decoration: none; /* Xóa gạch chân */
        display: inline-block; /* Hiển thị dưới dạng khối inline */
        font-size: 16px; /* Cỡ chữ */
        border-radius: 5px; /* Góc bo tròn */
        cursor: pointer; /* Thêm con trỏ khi di chuột */
    }

    .custom-button:hover {
        background-color: #45a049; /* Màu xanh lá cây đậm khi di chuột qua */
    }

    .custom-button:active {
        background-color: #367d39; /* Màu xanh là cây đậm khi được nhấn */
    }
    .signup-link a {
        display: block;
        height: 38px;
        background-color: #4CAF50;;
        color: #fff;
        padding: 5px 0px 10px 6px;
        width: 157px;
        margin-left: 10px;
        border-radius: 10px;
        text-decoration: none;
    }
    .delete-btn, .delete-btn:hover{
        width: 72px;
        display: block;
        background-color: red;
        color: #fff;
        padding: 10px;
        border-radius: 8px;
        text-decoration: none
    }
        </style>

    </head>

    <body>

        <div class="wrapper">
            <%@include file="components//adminComponent.jsp" %>
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

                <div>
                     <div class="signup-link"><a href="Register_Admin.jsp">Tạo tài khoản mới</a></div>
                </div>
                <div class="content">
                    <div class="container-fluid">
                        <div class="col-md-pull-12">
                            <div class="card-font-img">

                                <div class="header-font-img-admin" style="margin-left: 20px;">
                                    <h4 class="title" style="font-size: 30px">Tài khoản</h4>
                                    <p class="category" style="font-size: 25px">Admin</p>
                                </div>
                                <br><br><br><br>
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
                                                    <th>Xóa</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="dto" items="${result}" varStatus="counter">
                                                <form action="DispatchServlet">
                                                    <tr>
                                                        <td name ="idUser" value ="${dto.idUser}">${dto.idUser}</td>
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
                                                            <button class="custom-button"  type="submit" value="Update" name="btAction">
                                                                Update</button>
                                                        </td>
                                                         <td>
                                                            <a class="delete-btn" href="DispatchServlet?btAction=DeleteAccount&txtUserID=${dto.idUser}">Delete</a>
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
