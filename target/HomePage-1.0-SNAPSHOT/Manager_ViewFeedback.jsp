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
                        <i class="pe-7s-user" style="font-size: 40px;"></i>
                        <p>Nguyen Duc Anh</p>
                        <p>Manager</p>
                    </div>

                    <ul class="nav">
                        
                        <li>
                            <a href="Don_hang.html">
                                <i class="pe-7s-news-paper"></i>
                                <p>Don Hang</p>
                            </a>
                        </li>
                        <li>
                            <a href="View_Bill.html">
                                <i class="pe-7s-note2"></i>
                                <p>Hoa Don</p>
                            </a>
                        </li>
                        <li>
                            <a href="Thong_ke.html">
                                <i class="pe-7s-graph1"></i>
                                <p>Dashboard</p>
                            </a>
                        </li>
                        <li>
                            <a href="List_of_product.html">
                                <i class="pe-7s-drawer"></i>
                                <p>Tat Ca San Pham</p>
                            </a>
                        </li>
                        <li>
                            <a href="DispatchServlet?btAction=ManagerViewFeedback">
                                <i class="pe-7s-repeat"></i>
                                <p>Feedback</p>
                            </a>
                        </li>
                        <li>
                            <a href="Update_product.html">
                                <i class="pe-7s-note"></i>
                                <p>Cap Nhat San Pham</p>
                            </a>
                        </li>
                    </ul>
                    <div style="text-align: center;">
                        <a href="#">
                            <i class="fa fa-sign-out fa-rotate-180" style="font-size: 20px; margin-top:10px; color: black;"></i>

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
                            <a class="navbar-brand" href="#">Feedback</a>
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
                                    <h4 class="title">Feedback</h4>
                                    <p class="category">Staff &Manager</p>
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

                <div class="user-image" style="text-align: center;">
                    <i class="pe-7s-user" style="font-size: 40px;"></i>
                    <p>Nguyen Duc Anh</p>
                    <p>Admin</p>
                </div>

                <ul class="nav">
                    <li>
                        <a href="Nhap_hang.html">
                            <i class="pe-7s-piggy"></i>
                            <p>Nhap Hang</p>
                        </a>
                    </li>
                    <li>
                        <a href="Don_hang.html">
                            <i class="pe-7s-news-paper"></i>
                            <p>Don Hang</p>
                        </a>
                    </li>
                    <li>
                        <a href="View_Bill.html">
                            <i class="pe-7s-note2"></i>
                            <p>Hoa Don</p>
                        </a>
                    </li>
                    <li>
                        <a href="Thong_ke.html">
                            <i class="pe-7s-graph1"></i>
                            <p>Dashboard</p>
                        </a>
                    </li>
                    <li>
                        <a href="List_of_product.html">
                            <i class="pe-7s-drawer"></i>
                            <p>Tat Ca San Pham</p>
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
                            <p>Cap Nhat San Pham</p>
                        </a>
                    </li>
                </ul>
                <div style="text-align: center;">
                    <a href="#">
                        <i class="fa fa-sign-out fa-rotate-180" style="font-size: 20px; margin-top:10px; color: black;"></i>
                                       
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
                        <a class="navbar-brand" href="#">Nhap Hang</a>
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-left">
                            
                            <li class="separator hidden-lg hidden-md"></li>
                        </ul>
                    </div>
                </div>
            </nav>

    </body>
    <!--   Core JS Files   -->
    <script src="js/jquery.3.2.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>

                    <div class="col-md-pull-12">
                        <div class="card-font-img">

                            <div class="header-font-img-admin" style="margin-left: 20px;">
                                <h4 class="title">Accounts</h4>
                                <p class="category">Staff & Manager</p>
                            </div>
                            <div class="content-font-img">
                                <table>
                                    <tr>
                                        <th>Tên đăng nhập</th>
                                        <th>Họ và tên</th>
                                        <th>Vai trò</th>
                                        <th>Mật khẩu</th>
                                        <th>Đặt lại</th>
                                        <th>Xóa</th>
                                    </tr>
                                    <tr>
                                        <td>username1</td>
                                        <td>Nguyễn Văn A</td>
                                        <td>Người dùng</td>
                                        <td>********</td>
                                        <td><button>Đặt lại</button></td>
                                        <td><button>Xóa</button></td>
                                    </tr>
                                    <tr>
                                        <td>username2</td>
                                        <td>Trần Thị B</td>
                                        <td>Quản trị viên</td>
                                        <td>********</td>
                                        <td><button>Đặt lại</button></td>
                                        <td><button>Xóa</button></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <footer class="footer">
                <div class="container-fluid">
                    

    <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
    <script src="js/demo.js"></script>
</html>
