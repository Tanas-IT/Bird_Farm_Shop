<%-- 
    Document   : paymentResultCOD
    Created on : Jul 3, 2023, 5:28:31 PM
    Author     : 1005h
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="Assets/css/COD.css">
        <link rel="icon" type="image/x-icon" href="Assets/img/logo/Tủn Store.png">
        <title>Order Result</title>
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null}">
            <c:redirect url="login.html"></c:redirect>
        </c:if>
        <c:if test="${sessionScope.PAYMENT == null}">
            <c:set scope="request" var="MESSAGE" value="You have not made any order!"></c:set>
            <jsp:forward page="shopping.jsp"></jsp:forward>
        </c:if>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-md navbar-dark sticky-top" style="background-color: rgb(175, 35, 82);"> <!-- Xài thẻ <nav> hoặc xài thẻ <div role="navigation"> -->
            <!-- Navigation bar -->
            <div class="container-fluid">
                <a class="navbar-brand" href="MainController?action=ShoppingPage"> <!-- navbar-brand sẽ tự style logo để vừa với navbar theo chiều dọc-->
                    <img src="Assets/img/logo/Tủn Store.jpg" alt="Logo" style="width:70px;" class="rounded-pill"> 
                </a>
                <span class="navbar-text" style="color: white; font-weight: bold; padding: 0px 30px 0px 0px;">Tủn Store</span>
                <!-- Navbar items -->
                <div class="collapse navbar-collapse" id="collapsibleNavbar">
                    <ul class="navbar-nav">
                        <li class="nav-item nav-item-IDSL">
                            <a class="nav-link active" href="MainController?action=ShoppingPage">Home</a>
                        </li>
                        <li class="nav-item nav-item-IDSL" >
                            <a class="nav-link active" href="#" onclick="alert('Tính năng chưa được hỗ trợ, hoặc sẽ không bao giờ được hỗ trợ ::33');">News</a>
                        </li>
                        <li class="nav-item nav-item-IDSL">
                            <a class="nav-link active" href="#" onclick="alert('Tính năng chưa được hỗ trợ, hoặc sẽ không bao giờ được hỗ trợ ::33');">About Tủn Store</a>
                        </li>
                        <c:if test="${sessionScope.LOGIN_USER.roleID == 'AD'}">
                            <li class="nav-item nav-item-IDSL">
                                <a class="nav-link active" href="admin.jsp" style="font-weight: bold;">Account: ${sessionScope.LOGIN_USER.fullName}</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.LOGIN_USER.roleID == 'US'}">
                            <li class="nav-item nav-item-IDSL">
                                <a class="nav-link active" href="user.jsp" style="font-weight: bold;">Account: ${sessionScope.LOGIN_USER.fullName}</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.LOGIN_USER == null}">
                            <li class="nav-item nav-item-IDSL">
                                <a class="nav-link active" href="login.html" style="font-weight: bold;">Login</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
                <a href="MainController?action=View" class="shopping-button" style="color: white; font-weight: bold;" >View Cart</a>
            </div>
        </nav>
        <!-- Gioi thieu -->
        <div class="container-fluid" style="padding: 0;">
            <img src="Assets/img/content/Tủn Store Flower Garden.png" alt="Header" style="width: 100%; margin-bottom: 30px;">
        </div>
        <div class="container">
            <div class="table-responsive">
                <h1>Receiver's Information</h1>
                <c:if test="${sessionScope.RECEIVER != null}">
                    <c:if test="${not empty sessionScope.RECEIVER}">
                        <table class="table table-striped">
                            <tr>
                                <th>Name:</th>
                                <td>${sessionScope.RECEIVER.name}</td>
                            </tr>
                            <tr>
                                <th>Email:</th>
                                <td>${sessionScope.RECEIVER.email}</td>
                            </tr>
                        </table>
                    </c:if>
                </c:if>
            </div>
        </div>
        
        <div class="container">
            <div class="table-responsive">
                <h1>Order result</h1>
                <c:if test="${sessionScope.PAYMENT != null}">
                    <c:if test="${not empty sessionScope.PAYMENT}">
                        <table class="table table-striped">
                            <tr>
                                <th>Amount Paid:</th>
                                <td>${sessionScope.PAYMENT.amount}</td>
                            </tr>
                            <tr>
                                <th>Order Date:</th>
                                <td>${sessionScope.PAYMENT.payDate}</td>
                            </tr>
                            <tr>
                                <th>Order Information</th>
                                <td>${sessionScope.PAYMENT.orderInfo}</td>
                            </tr>
                            <tr>
                                <th>Order Code</th>
                                <td>${sessionScope.PAYMENT.orderCode}</td>
                            </tr>
                            <tr>
                                <th>PAYMENT STATUS</th>
                                <td>${sessionScope.PAYMENT.status}</td>
                            </tr>
                        </table>
                    </c:if>
                </c:if>
            </div>
        </div>
        <div style="text-align: center; margin-top: 20px;">
            <a href="MainController?action=ShoppingPage" class="btn btn-success btn-lg">Back to shopping page</a>
        </div>
        
        <!-- Footer -->
        <footer style="padding-top: 30px; background-color: rgb(175, 35, 82); margin-top: 80px;">
            <div class="container">
                <div class="row">
                    <div class="col-md-5 col-6">
                        <div>
                            <h3 style="color: white;">Tủn Store</h3>
                            <p class="mb-30 footer-desc" style="color: white;">We have the perfect floral arrangements to brighten someone’s day.<br>All you need is love and a flower shop.</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-6">
                        <div class="">
                            <h4 style="color: white;">Services</h4>
                            <ul class="list-unstyled">
                                <li>
                                    <a href="MainController?action=ShoppingPage" class="text-decoration-none" style="color: white;">Home</a>
                                </li>
                                <li>
                                    <a href="#" class="text-decoration-none" style="color: white;" onclick="alert('Tính năng chưa được hỗ trợ, hoặc sẽ không bao giờ được hỗ trợ ::33');">News</a>
                                </li>
                                <li>
                                    <a href="#" class="text-decoration-none" style="color: white;" onclick="alert('Tính năng chưa được hỗ trợ, hoặc sẽ không bao giờ được hỗ trợ ::33');">About Tủn Store</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4 col-12">
                        <div>
                            <h4 style="color: white;">Address</h4>
                            <ul class="list-unstyled">
                                <li>
                                    <p style="color: white;">0949805542</p>
                                </li>
                                <li>
                                    <p><a href="#" onclick="alert('Thank you for your supporting :3!');" style="color: yellow;">baopnse171066@fpt.edu.vn</a>
                                    </p>
                                </li>
                                <li>
                                    <p style="color: white;">Ho Chi Minh City,
                                        Viet Nam</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-center">
                    <div class="copyright">
                        <p style="color: white;">Developed and maintained by <a href="#" onclick="alert('Thank you for your supporting :3!');" style="color: yellow;">Phạm Ngọc Bảo</a></p>
                    </div>
                </div>
            </div>
        </footer>
        
        <!-- End of footer -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                        document.addEventListener("DOMContentLoaded", function (event) {
                            var scrollpos = localStorage.getItem("scrollpos");
                            if (scrollpos)
                                window.scrollTo(0, scrollpos);
                        });

                        window.onscroll = function (e) {
                            localStorage.setItem("scrollpos", window.scrollY);
                        };
        </script>
    </body>
</html>
