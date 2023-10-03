<%-- 
    Document   : Manager_ViewBill
    Created on : 01-Oct-2023, 15:47:10
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
        <link href="css/img-font.css" rel="stylesheet" />
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
                            <a href="DispatchServlet?btAction=ManagerViewBill">
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
                                        <c:set var="result" value="${requestScope.BILL_LIST}"/>
                                        <c:if test="${not empty result}">
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <th>OrderID</th>
                                                        <th>Tên</th>
                                                        <th>Số điện thoại</th>
                                                        <th>Ngày mua hàng</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="dto" items="${result}" varStatus="counter">

                                                        <tr class="invoice" onclick="showDetails(${dto.idOrder})">
                                                            <td>${dto.idOrder}</td>
                                                            <td>${dto.fullName}</td>
                                                            <td>${dto.receiverPhoneNumber}</td>
                                                            <td>${dto.createdDate}</td>
                                                        </tr>

                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </c:if>                                      
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="right-panel">
                                        <div style="font-size: 30px;">Thông tin đơn hàng</div>
                                  
                                             <c:set var="result" value="${requestScope.BILL_DETAIL_LIST}"/>
                                                <div id="details-${invoice.id}" class="invoice-details">
                                                    <!-- Invoice details for ID ${invoice.id} -->
                                                   
                                                    <c:if test="${not empty result}">

                                                        <p>Tên: ${dto.fullName}</p>
                                                        <p>Số điện thoại: ${dto.receiverPhoneNumber}</p>
                                                        <p>Ngày mua: ${dto.createdDate}</p>

                                                        <table>
                                                            <thead>                                                       
                                                                <tr>
                                                                    <th>No</th>
                                                                    <th>Tên chim</th>
                                                                    <th>Số lượng</th>
                                                                    <th>Giá</th>                                               
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach var="dto" items="${result}" varStatus="counter">
                                                                    <c:set var="quantity" value="${dto.quantity}" />
                                                                    <c:set var="price" value="${dto.price}" />
                                                                    <c:set var="total" value="${total + quantity * price}" />   
                                                                    <tr class="invoice" onclick="showDetails(${dto.idOrder})">
                                                                        <td>${counter.count}</td>
                                                                        <td>${dto.name}</td>
                                                                        <td>${dto.quantity}</td>
                                                                        <td>${dto.price}</td>
                                                                    </tr>

                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                        <div>Tổng tiền: ${total}</div> 
                                                    </c:if>   
                                             
                                        
                                            <!-- Thêm thông tin chi tiết khác của hóa đơn -->
                                                                                        
                                            <button class="cancel" onclick="hideDetails(1)">Hủy</button>
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

    <!--   Core JS Files   -->
    <script src="js/jquery.3.2.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>


    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
    <script src="js/light-bootstrap-dashboard.js?v=1.4.0"></script>


    <script>
                                                function showDetails(id) {
                                                    // Ẩn tất cả các chi tiết hóa đơn
                                                    var details = document.getElementsByClassName("invoice-details");

                                                    for (var i = 0; i < details.length; i++) {
                                                        details[i].classList.remove("active");
                                                    }

                                                    // Hiển thị chi tiết hóa đơn tương ứng với id được truyền vào
                                                    var detail = document.getElementById("details-" + id);
                                                    detail.classList.add("active");
                                                }

                                                function hideDetails(id) {
                                                    // Ẩn chi tiết hóa đơn tương ứng với id được truyền vào
                                                    var detail = document.getElementById("details-" + id);
                                                    detail.classList.remove("active");
                                                }
    </script>


</html>