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
          <title>View Detail Bill</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="img/bird_logo.png" />
        <meta charset="utf-8" />
        <link rel="icon" type="image/png" href="assets/img/favicon.ico">
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
            #status a {
                background-color: #29cd29;
                color: white;
                padding: 11px;
                border-radius: 10px;
                text-decoration: none;
            }
        </style>
    </head>

    <body>

        <div class="wrapper">
            <%@include file="components//ManagerComponent.jsp" %>

            <div class="main-panel">
                <nav class="navbar navbar-default navbar-fixed">

                </nav>


                <div class="content">
                    <div class="container-fluid">
                        <%@include file="components//Manager_Order_Component.jsp" %>
                        <div class="page-content container"style="border: 1px solid #888; border-radius: 10px;box-shadow: 0 0 10px rgba(0, 0, 0, 0.3)">
                            <div class="page-header text-blue-d2" >

                                <c:set var="result1" value="${requestScope.BILL_CUSTOMER_DETAIL_LIST}"/>
                                <c:if test="${not empty result1}">
                                    <c:forEach var="dto1" items="${result1}" varStatus="counter">

                                        <h1 class="page-title text-secondary-d1 " style="text-align: center;font-weight: bold">
                                            Đơn hàng
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

                                                <div style="font-size: 15px; font-weight: bold" class="row">
                                                    <div class="col-sm-6">
                                                        <div class="card" style="border: 1px solid #000;border-radius: 10px; margin: 10px; padding: 10px;box-shadow: 0 0 10px rgba(0, 0, 0, 0.3)">
                                                            <div class="my-2">
                                                                <div class="my-2" style="font-size: 18px">
                                                                    Thông tin khách hàng
                                                                </div>
                                                                <div class="my-2">
                                                                    Tên: ${dto1.fullName}
                                                                </div>
                                                                <div class="my-2">
                                                                    Địa chỉ: ${dto1.receiverAddress}
                                                                </div>

                                                                <div class="my-2">Số điện thoại: ${dto1.receiverPhoneNumber}</div>
                                                                <div class="my-2">Thanh toán bằng: ${dto1.paymentName}</div>

                                                            </div>

                                                        </div>

                                                    </div>
                                                    <!-- /.col -->

                                                    <div class="col-sm-6 ">


                                                        <div class="card" style="border: 1px solid #000;border-radius: 10px; margin: 10px; padding: 10px;box-shadow: 0 0 10px rgba(0, 0, 0, 0.3)">
                                                            <div class="my-2" style="font-size: 18px">
                                                                Thông tin khách hàng
                                                            </div>
                                                            <div class="my-2">ID Order: ${dto1.idOrder}</div>

                                                            <div class="my-2"> Ngày:</span> ${dto1.createdDate}</div>

                                                            <div class="my-2"> Trạng thái: <span class="badge badge-warning badge-pill px-25">${dto1.status}</span></div>
                                                            <br>
                                                        </div>

                                                    </div>
                                                </c:forEach>
                                            </c:if>
                                            <!-- /.col -->
                                        </div>

                                        <div style="font-size: 15px" class="mt-4">
                                            <table>
                                                <thead class="style-thead" style="background-color: #84b0ca; color: white;border: 1px solid #000;box-shadow: 0 0 10px rgba(0, 0, 0, 0.3)">
                                                    <tr style="padding: 10px;" >
                                                        <th>STT</th>
                                                        <th>Ảnh</th>
                                                        <th>Tên mặt hàng</th>
                                                        <th>Số lượng</th>
                                                        <th>Giá</th>
                                                        <th>Tổng</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="striped-table" >
                                                    <c:set var="result" value="${requestScope.BILL_DETAIL_LIST}"/>
                                                    <c:if test="${not empty result}">
                                                        <c:forEach var="dto" items="${result}" varStatus="counter">
                                                            <c:set var="idOrder" value="${dto.idOrder}" />
                                                            <c:set var="quantity" value="${dto.quantity}" />
                                                            <c:set var="price" value="${dto.price}" />
                                                            <c:set var="priceANDquantity" value="${quantity*price}" />

                                                            <c:set var="total" value="${total + quantity * price}" />  
                                                            <c:set var="NOTE" value="${dto.note}" />
                                                            <tr >
                                                                <td>
                                                                    ${counter.count}
                                                                </td>
                                                                <td>
                                                                    <img src="${dto.imageURL}"style="width: 50px ;height: 50px; border-radius: 50% "> 
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
                                                    <div class="col-12 col-sm-6 text-grey-d2 text-95 mt-2 mt-lg-0">
                                                        <div class="row my-2 align-items-center bgc-primary-l3 p-2">
                                                            <div class="card" style="border-radius: 10px; margin: 10px; padding: 10px;">
                                                                <div class="my-2" style="font-size: 18px ">
                                                                    Nội dung đơn hàng
                                                                </div>
                                                                <div class="my-2">${NOTE}</div>

                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-12 col-sm-6 text-grey text-90 order-first order-sm-last">


                                                        <div class="row my-2 align-items-center bgc-primary-l3 p-2">
                                                            <br>
                                                            <div class="col-7 text-right" style="font-size: 25px">
                                                                Tổng tiền: 
                                                            </div>
                                                            <div class="col-5"  style="font-size: 20px">
                                                                <span class="text-150 text-success-d3 opacity-2"><fmt:formatNumber value="${total}" maxFractionDigits="0"/>đ</span>
                                                            </div>
                                                        </div>
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <div class="col-lg-4" id="status">
                                                            <a href="DispatchServlet?btAction=DeliveryOrder&txtidOrder=${idOrder}">
                                                                Giao hàng
                                                            </a>


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
