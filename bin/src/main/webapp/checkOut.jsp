<%-- 
    Document   : checkOut
    Created on : Jun 26, 2023, 5:42:46 PM
    Author     : 1005h
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@page import="sample.user.UserDTO"%>--%>
<%@page import="Product.ProductDTO"%>
<%@page import="Shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Assets/css/checkOut.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="icon" type="image/x-icon" href="Assets/img/logo/Tủn Store.png">
        <title>Checkout Page</title>
        <style>
        </style>
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null}">
            <c:set scope="request"  var="MESSAGE_CHECKOUT" value="You must login to checkout!"></c:set>
            <jsp:forward page="login.jsp"></jsp:forward>
        </c:if>
        <c:if test="${sessionScope.CART == null}">
            <c:set scope="request" var="MESSAGE_CHECKOUT" value="Your cart is empty!"></c:set>
            <jsp:forward page="shopping.jsp"></jsp:forward>
        </c:if>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-md navbar-dark sticky-top" style="background-color: rgb(175, 35, 82);"> <!-- Xài thẻ <nav> hoặc xài thẻ <div role="navigation"> -->
            <!-- Navigation bar -->
            <div class="container-fluid">
                <a class="navbar-brand" href="MainController?action=ShoppingPage"> <!-- navbar-brand sẽ tự style logo để vừa với navbar theo chiều dọc-->
                    <img src="Assets/img/logo/Tủn Store.jpg" alt="Logo" style="width:70px;" class="rounded-pill"> 
                </a>
                <span class="navbar-text" style="color: white; font-weight: bold; padding: 0px 30px 0px 0px;"> Store</span>
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
                            <a class="nav-link active" href="#" onclick="alert('Tính năng chưa được hỗ trợ, hoặc sẽ không bao giờ được hỗ trợ ::33');">About Store</a>
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
        <!-- Content -->
        <div class="container">
            <h1 style="margin: 30px 0px; text-align: center;">Confirm & Checkout</h1>
            <h4 style="margin-bottom: 50px; text-align: center;">~ ~  ~ ~</h4>
            <div class="table-responsive">
                <c:if test="${sessionScope.CART != null}">
                    <c:if test="${not empty sessionScope.CART}">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th style="text-align: center;">No</th>
                                    <th style="text-align: center;">Image</th>
                                    <th style="text-align: center;">Name</th>
                                    <th style="text-align: center;">Price</th>
                                    <th style="text-align: center;">Quantity</th>
                                    <th style="text-align: center;">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="product" varStatus="counter" items="${sessionScope.CART.cart}">
                                    <c:set scope="request" var="total" value="${requestScope.total + product.value.productQuantity * product.value.productPrice}"></c:set>
                                    <tr>
                                        <td style="padding-top: 40px; text-align: center;">${counter.count}</td>
                                        <td style="text-align: center;">
                                            <img src="Assets/img/product/${product.value.productImage}" alt="alt" width="100px" height="100px" style="border-radius: 10px;"/> 
                                        </td>
                                        <td style="padding-top: 40px; text-align: center;">
                                            <input type="text" name="productName" value="${product.value.productName}" readonly="" style="border: none; background: none; font-size: 20px; text-align: center; max-width: 200px;"/>
                                        </td>
                                        <td style="padding-top: 40px; text-align: center;">
                                            <input type="text" name="productPrice" value="${product.value.productPrice}" readonly="" style="border: none; background: none; font-size: 20px; text-align: center; max-width: 100px;"/>
                                        </td>
                                        <td style="padding-top: 40px; text-align: center;">
                                            <input type="number" name="quantity" value="${product.value.productQuantity}" min="1" readonly="" style="border: none; background: none; font-size: 20px; text-align: center; max-width: 100px;"/>
                                        </td>
                                        <td style="padding-top: 40px; text-align: center; max-width: 100px; font-size: 20px;">${product.value.productQuantity * product.value.productPrice}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table> 
                    </c:if>
                </c:if>
            </div>
        </div>
        <!-- End of content -->
        <!-- User's Info -->
        <div class="container" style="margin-top: 20px;">
            <form action="MainController" method="POST" id="CreateFrom" style="padding: 0;">
                <div class="row">
                    <div class="col-7">
                        <div style="background-color: rgb(255, 203, 216); padding: 20px; border-radius: 15px; box-shadow: 0 3px 10px rgb(0 0 0 /0.5) inset;">
                            <h3 style="text-align: center; padding-bottom: 20px;">Receiver's information</h3>
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-2">
                                        <p style="font-weight: bold;">UserID:</p>
                                        <p style="font-weight: bold;">FullName:</p>
                                        <p style="font-weight: bold;">Email:</p>
                                    </div>
                                    <div class="col-10">
                                        <input type="text" name="userID" value="${sessionScope.LOGIN_USER.userID}" readonly="" style="width: 100%; margin-bottom: 10px; border: none; border-bottom: 2px solid black;"/><br>
                                        <input type="text" name="fullName" value="${sessionScope.LOGIN_USER.fullName}" required="" style="width: 100%; margin-bottom: 10px; border: none; border-bottom: 2px solid black;"/><br>
                                        <input type="email" name="email" value="${sessionScope.LOGIN_USER.email}" required="" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" style="width: 100%; margin-bottom: 10px; border: none; border-bottom: 2px solid black;"/><br>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-5">
                        <div style="background-color: rgb(255, 249, 158); padding: 20px 30px; border-radius: 15px; box-shadow: 0 3px 10px rgb(0 0 0 /0.5) inset;">
                            <h3 style="text-align: center; padding-bottom: 20px;">Order's information</h3>
                            <!-- Pay type -->
                            <input type="radio" name="payType" value="COD">
                            <label for="payType" style="font-weight: bold; padding-bottom: 10px;">Cash On Delivery (COD)</label><br>
                
                            <input type="radio" name="payType" value="VNPAY" checked="true">
                            <label for="payType" style="font-weight: bold; padding-bottom: 10px;">Online Payment via VNPAY (NCB)</label><br>
                            <!-- Total -->
                            <h1 style="text-align: center; padding: 20px 0px; color: red;">Total: ${requestScope.total} VNĐ</h1>
                            <!-- Input -->
                            <input type="hidden" name="amount" value="${requestScope.total}"/>
                            <input type="hidden" name="total" value="${requestScope.total}"/>
                            <div style="display: flex; justify-content: center">
                                <div id="html_element"></div>
                            </div>
                            <div id="error" style="color : red; text-align: center; padding-bottom: 15px"></div>
                            <div style="text-align: center;">
                                <input type="hidden" name="action" value="Payment"/>
                                <input type="submit" value="Payment" class="btn btn-success btn-lg"/>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <!-- End of User info -->
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
                                    <p><a href="#" onclick="alert('Thank you for your supporting :3!');" style="color: yellow;">@gmail.com</a>
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
                        <p style="color: white;">Developed and maintained by <a href="#" onclick="alert('Thank you for your supporting :3!');" style="color: yellow;">Bruh shp[</a></p>
                    </div>
                </div>
            </div>
        </footer>
        <!-- End of footer -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
                async defer>
        </script>
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
        <script type="text/javascript">
            var onloadCallback = function () {
                grecaptcha.render('html_element', {
                    'sitekey': '6LcwrccmAAAAAL-6CMoaecZJUwy0wXjNlKzts2jl'
                });
            };
        </script>
        <script>
            window.onload = function () {
                let isValid = false;
                const form = document.getElementById("CreateFrom");
                const error = document.getElementById("error");

                form.addEventListener("submit", function (event) {
                    event.preventDefault();
                    const response = grecaptcha.getResponse();
                    if (response) {
                        form.submit();
                    } else {
                        error.innerHTML = "Please check reCAPTCHA.";
                    }
                });
            }
        </script>
</body>
</html>
