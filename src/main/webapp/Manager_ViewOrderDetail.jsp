<%-- 
    Document   : Manager_ViewDetailBill
    Created on : 08-Oct-2023, 16:22:24
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <link rel="icon" type="image/png" href="assets/img/favicon.ico">
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" >
        <style>
            .striped-table {
                width: 100%;
                border-collapse: collapse;
                padding-bottom: 5px;
                padding-bottom: 5px;
                margin-bottom: 20px
            }

            .striped-table th,
            .striped-table td {
                padding-bottom: 5px;
                padding-bottom: 5px;
                padding: 10px;
            }
            .style-thead th,td{
                padding: 10px;
            }

            .striped-table thead {
                background-color: #84b0ca; /* Màu nền cho phần thead */
            }

            .striped-table tr:nth-child(even) {
                background-color: #f3f8fa; /* Màu nền cho dòng chẵn */
            }

            .striped-table tr:nth-child(odd) {
                background-color: #ffffff; /* Màu nền cho dòng lẻ */
            }
        </style>
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
                        <div class="page-content container">
                            <div class="page-header text-blue-d2">

                                <c:set var="result1" value="${requestScope.ORDER_CUSTOMER_DETAIL_LIST}"/>
                                <c:if test="${not empty result1}">
                                    <c:forEach var="dto1" items="${result1}" varStatus="counter">

                                        <h1 class="page-title text-secondary-d1">
                                            Hóa đơn
                                            <small class="page-info">
                                                <i class="fa fa-angle-double-right text-80"></i>
                                                ${dto1.idOrder}
                                            </small>
                                        </h1>
                                    </div>

                                    <div class="container px-0">
                                        <div class="row mt-4">
                                            <div class="col-12 col-lg-12">

                                                <hr class="row brc-default-l1 mx-n1 mb-4" />

                                                <div style="font-size: 18px" class="row">
                                                    <div class="col-sm-6">
                                                        <div>
                                                            <span class="text-sm text-grey-m2 align-middle">Tên: </span>
                                                            <span class="text-600 text-110 text-blue align-middle">${dto1.fullName}</span>
                                                        </div>
                                                        <div class="text-grey-m2">
                                                            <div class="my-1">
                                                                Địa chỉ: ${dto1.receiverAddress}
                                                            </div>

                                                            <div class="my-1"><i class="fa fa-phone fa-flip-horizontal text-secondary"></i> <b class="text-600 ">${dto1.receiverPhoneNumber}</b></div>
                                                        </div>
                                                    </div>
                                                    <!-- /.col -->

                                                    <div class="text-95 col-sm-6 align-self-start d-sm-flex justify-content-end">
                                                        <hr class="d-sm-none" />
                                                        <div class="text-grey-m2">
                                                            <div class="mt-1 mb-2 text-secondary-m1 text-600 text-125">

                                                            </div>

                                                            <div class="my-2"><i class="fa fa-circle text-blue-m2 text-xs mr-1"></i> <span class="text-600 text-90">ID Order:</span> ${dto1.idOrder}</div>

                                                            <div class="my-2"><i class="fa fa-circle text-blue-m2 text-xs mr-1"></i> <span class="text-600 text-90">Ngày:</span> ${dto1.createdDate}</div>

                                                            <div class="my-2"><i class="fa fa-circle text-blue-m2 text-xs mr-1"></i> <span class="text-600 text-90">Trạng thái:</span> <span class="badge badge-warning badge-pill px-25">${dto1.status}</span></div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </c:if>
                                            <!-- /.col -->
                                        </div>

                                        <div style="font-size: 15px" class="mt-4">
                                            <table>
                                                <thead class="style-thead" style="background-color: #84b0ca; color: white;">
                                                    <tr style="padding: 10px;">
                                                        <th>STT</th>
                                                        <th>Tên mặt hàng</th>
                                                        <th>Số lượng</th>
                                                        <th>Giá</th>
                                                        <th>Tổng</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="striped-table" >
                                                    <c:set var="result" value="${requestScope.ORDER_DETAIL_LIST}"/>
                                                    <c:if test="${not empty result}">
                                                        <c:forEach var="dto" items="${result}" varStatus="counter">
                                                            <c:set var="quantity" value="${dto.quantity}" />
                                                            <c:set var="price" value="${dto.price}" />
                                                            <c:set var="priceANDquantity" value="${quantity*price}" />

                                                            <c:set var="total" value="${total + quantity * price}" />   
                                                            <tr >
                                                                <td>
                                                                    ${counter.count}
                                                                </td>
                                                                <td>${dto.name}</td>
                                                                <td>${dto.quantity}</td>
                                                                <td>${dto.price}</td>
                                                                <td>${priceANDquantity}</td>
                                                            </tr>

                                                        </c:forEach>
                                                    </tbody>
                                                </table>

                                                <div class="row border-b-2 brc-default-l2"></div>


                                                <div class="row mt-3">
                                                    <div class="col-12 col-sm-7 text-grey-d2 text-95 mt-2 mt-lg-0">
                                                    </div>

                                                    <div class="col-12 col-sm-5 text-grey text-90 order-first order-sm-last">
                                                        <div class="row my-2">
                                                            <div class="col-7 text-right">

                                                            </div>
                                                            <div class="col-5">
                                                                <span class="text-120 text-secondary-d1"></span>
                                                            </div>
                                                        </div>

                                                        <div class="row my-2">
                                                            <div class="col-7 text-right">

                                                            </div>
                                                            <div class="col-5">
                                                                <span class="text-110 text-secondary-d1"></span>
                                                            </div>
                                                        </div>

                                                        <div class="row my-2 align-items-center bgc-primary-l3 p-2">
                                                            <div class="col-7 text-right">
                                                                Total Amount: 
                                                            </div>
                                                            <div class="col-5">
                                                                <span class="text-150 text-success-d3 opacity-2"><fmt:formatNumber value="${total}" maxFractionDigits="0"/>đ</span>
                                                            </div>
                                                        </div>
                                                    </c:if>

                                                </div>
                                            </div>

                                            <hr />

                                        </div>
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
</html>
