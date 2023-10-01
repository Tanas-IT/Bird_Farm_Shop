<%-- 
    Document   : ManagerViewBill
    Created on : 01-Oct-2023, 13:28:34
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
            <div class="sidebar" data-color="green" data-image="assets/img/sidebar-5.jpg">

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
                            <a href="List_of_product.html">
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
                            <i class="fa fa-sign-out fa-rotate-180"
                               style="font-size: 50px; margin-top: 50px; color: black;"></i>

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
                        <div class="container">

                            <div class="col-md-6">
                                <div class="card">
                                    <div class="left-panel">
                                        <br>
                                        <div style="font-size: 30px;">Đơn hàng</div>
                                        <br>
                                        <br>

                                        <label for="fromDate">Từ ngày:</label>
                                        <input type="date" id="fromDate" name="fromDate">

                                        <label for="toDate">Đến ngày:</label>
                                        <input type="date" id="toDate" name="toDate">

                                        <br>

                                        <label for="searchTerm">Tìm kiếm:</label>
                                        <input type="text" id="searchTerm" name="searchTerm">
                                        <table>
                                            <tr>
                                                <th>Tên</th>
                                                <th>Số điện thoại</th>
                                                <th>Tổng tiền</th>
                                                <th>Ngày</th>
                                            </tr>
                                            <tr class="invoice " onclick="showDetails(1)">
                                                <td>Nguyễn Văn A</td>
                                                <td>0123456789</td>
                                                <td>100,000 VND</td>
                                                <td>22/22/2022</td>
                                            </tr>
                                            <tr class="invoice" onclick="showDetails(2)">
                                                <td>Trần Thị B</td>
                                                <td>0987654321</td>
                                                <td>200,000 VND</td>
                                                <td>22/22/2022</td>
                                            </tr>
                                            <tr class="invoice" onclick="showDetails(3)">
                                                <td>Lê Văn C</td>
                                                <td>0369876543</td>
                                                <td>150,00000000 VND</td>
                                                <td>22/22/2022</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="right-panel">
                                        <div style="font-size: 30px;">Thông tin đơn hàng</div>
                                        <div id="details-1" class="invoice-details">
                                            <p>Tên: Nguyễn Văn A</p>
                                            <p>Số điện thoại: 0123456789</p>
                                            <p>Ngày mua:</p>
                                            <!-- Thêm thông tin chi tiết khác của hóa đơn -->
                                            <table>
                                                <tr>
                                                    <th>No</th>
                                                    <th>Tên chim</th>
                                                    <th>Số lượng</th>
                                                    <th>Giá</th>
                                                </tr>
                                                <tr>
                                                    <td>1</td>
                                                    <td>Chào mèo</td>
                                                    <td>10</td>
                                                    <td>100,000 VND</td>
                                                </tr>
                                            </table>
                                            <div>Tổng tiền</div>
                                            <button class="cancel" onclick="hideDetails(1)">Hủy</button>
                                        </div>
                                        <div id="details-2" class="invoice-details">
                                            <p>Tên: Trần Thị B</p>
                                            <p>Số điện thoại: 0987654321</p>
                                            <p>Tổng tiền mua hàng: 200,000 VND</p>
                                            <!-- Thêm thông tin chi tiết khác của hóa đơn -->
                                            <button class="cancel" onclick="hideDetails(2)">Hủy</button>
                                        </div>
                                        <div id="details-3" class="invoice-details">
                                            <p>Tên: Lê Văn C</p>
                                            <p>Số điện thoại: 0369876543</p>
                                            <p>Tổng tiền mua hàng: 150,000 VND</p>
                                            <!-- Thêm thông tin chi tiết khác của hóa đơn -->
                                            <button class="cancel" onclick="hideDetails(3)">Hủy</button>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>
                </div>

                <footer class="footer">
                    <div class="container-fluid">
                        <!-- Modal -->


                    </div>
                </footer>


            </div>
        </div>


    </body>

    <script src="js/jquery.3.2.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
    <script src="js/light-bootstrap-dashboard.js?v=1.4.0"></script>

    <script src="js/Bill-show-hide.js"></script>
    

</html>
