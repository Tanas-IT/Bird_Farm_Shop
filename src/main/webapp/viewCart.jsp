<%-- 
    Document   : viewCart
    Created on : Jun 17, 2023, 4:05:50 PM
    Author     : 1005h
--%>

<%@page import="birdfarm.dto.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="birdfarm.dto.BirdDTO"%>
<%@page import="birdfarm.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="Assets/css/viewCart-jsp.css">
        <title>Cart</title>
        <link rel="icon" type="image/x-icon" href="img/bird_logo.png" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">
        <link
            rel="stylesheet"
            type="text/css"
            href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"
            />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/my-styles.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
        <link rel="stylesheet" type="text/css" href="css/Home.css">
        <link rel="stylesheet" type="text/css" href="css/Compare.css">
    </head>
    <body>
        <!-- Navbar -->
        <nav style="background-color:#f3e4e4 !important; position:fixed; width: 100%; z-index: 100; padding-bottom: 0; cursor: pointer;" class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container container-header px-4 px-lg-5">
                <a style="margin: 0" class="navbar-brand" href="#!">
                    <img class="logo" src="img/bird_logo.png" alt="logo"/>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item">
                            <form action="DispatchServlet">
                                <input type="hidden" name="userID" value="<%= request.getParameter("userID")%>" />
                                <input type="hidden" name="quantityOfCart" value="<%= session.getAttribute("quantityOfCart")%>"/>
                                <input name="btAction" style="background-color: #f3e4e4;border: none;font-weight: 600;font-size: 18px;" id="home-link" type="submit" class="nav-link nav-active" aria-current="page" value="Trang chủ"/>
                            </form>
                        </li>
                        <li class="nav-item">
                            <a id="about-link" class="nav-link" href="about.jsp" onclick="handleButtonClick(this)">
                                <h5 class="background-hover">Về chúng tôi</h5>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a id="about-link" class="nav-link" href="pairingBird.html" onclick="handleButtonClick(this)">
                                <h5 class="background-hover">Ghép cặp</h5>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" role="button" aria-expanded="false" onclick="handleButtonClick(this)">
                                <h5 class="background-hover">Hàng đã mua</h5>
                            </a>
                        </li>
                    </ul>
                    <div class=" input-group input-button">
                        <input class="form-control border-end-0 border rounded-pill" type="text" placeholder="search" id="example-search-input">
                        <span class="input-group-append">
                            <label style="z-index: 10" for="example-search-input" class="btn-search btn btn-outline-secondary border-bottom-0 border rounded-pill ms-n5">
                                <i class="fa fa-search"></i>
                            </label>
                        </span>
                    </div>
                    <form action="cart.html">
                        <button class="cart btn btn-outline-dark" type="submit">
                            <i class="fa-solid fa-cart-shopping"></i>
                            Giỏ hàng
                            <span class="badge bg-warning text-white ms-1 rounded-pill">
                                <% if(session.getAttribute("quantityOfCart") != null) {%>
                                    <%= session.getAttribute("quantityOfCart")%>
                                <%} else { %>
                                    0
                                <%}%>
                            </span>
                        </button>
                    </form>
                    <div>
                        <i class="fas fa-user-circle"></i>
                        <% UserDTO user = (UserDTO) request.getAttribute("user");%>
                        <p style="display:inline; font-weight: 500;">Chào <%= user.getFullName()%></p>
                    </div>
                    <form action="Register.jsp">
                        <button style="margin-left: 10px;" type="submit" class="btn-register btn btn-danger">
                            Đăng xuất
                        </button>
                    </form>
                </div>
            </div>

        </nav>
        <!-- Gioi Thieu 1 -->
        <div class="container-fluid" style="padding: 0;">
            <img src="img/feather.png" alt="Header" style="width: 100px; margin-bottom: 30px;">
        </div>
        <!-- Content -->

        <!-- table -->
        <div class="container" style="margin-top: 30px">
            <h1 style="margin-bottom: 30px; text-align: center;">Giỏ hàng của bạn</h1>
            <div class="table-responsive">
                <c:if test="${sessionScope.CART == null}">
                    <h5>Giỏ hàng của bạn đang trống, the <a href="shopping.jsp" style="text-decoration: none; color: #198653;">Add more</a> button is right on your right!</h5>
                </c:if>
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
                                    <th style="text-align: center;">Edit</th>
                                    <th style="text-align: center;">Remove</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="product" varStatus="counter" items="${sessionScope.CART.cart}">
                                    <c:set scope="request" var="total" value="${requestScope.total + product.value.quantity * product.value.salePrice}"></c:set>
                                    <form action="MainController" method="POST">
                                        <tr>
                                            <td style="padding-top: 40px; text-align: center;">${counter.count}</td>
                                        <td style="text-align: center;">
                                            <img src="${product.value.imageURL}" alt="alt" width="100px" height="100px" style="border-radius: 10px;"/> 
                                        </td>
                                        <td style="padding-top: 40px; text-align: center;">
                                            <h3 style="border: none; background: none; font-size: 20px; text-align: center; max-width: 200px;">${product.value.name}</h3>
                                        </td>
                                        <td style="padding-top: 40px; text-align: center;">
                                            <fmt:formatNumber var="formatPrice" value="${product.value.salePrice}" pattern="#,##0" />
                                            <input type="text" name="productPrice" value="${formatPrice}" readonly="" style="border: none; background: none; font-size: 20px; text-align: center; max-width: 100px;"/>
                                        </td>
                                        <td style="padding-top: 40px; text-align: center;">
                                            <input class="quantityOfBird text-center" type="text" id="quantityInput" type="number" name="quantity" value="${product.value.quantity}" max ="${product.value.quantity}" min="1" style="font-size: 20px; border-radius: 10px; text-align: center; max-width: 100px;"/>
                                        </td>
                                        <td style="padding-top: 40px; text-align: center; font-size: 20px; text-align: center; max-width: 100px;" >
                                            <fmt:formatNumber var="formatFinalEachPrice" value="${product.value.quantity * product.value.salePrice}" pattern="#,##0 VNĐ" />
                                            ${formatFinalEachPrice}
                                        </td>
                                        <!--Edit here-->
                                        <td style="padding-top: 40px; text-align: center;">
                                            <input type="hidden" name="productID" value="${product.value.idBird}"/>
                                            <input class="btn btn-success" type="submit" name="action" value="Edit">
                                        </td>
                                        <!--Remove Here-->
                                        <td style="padding-top: 40px; text-align: center;">
                                            <input class="btn btn-success" type="submit" name="action" value="Remove">
                                        </td>
                                    </tr>
                                </form>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                </c:if>
            </div>
        </div>
        <div class="container" style="margin-top: 20px;">
            <div class="row">
                <div class="col-md-6" style="align-items: center;">
                    <fmt:formatNumber var="formatFinalPrice" value="${requestScope.total}" pattern="#,##0 VNĐ" />
                    <h1>Total: ${formatFinalPrice}</h1>
                </div>
                <div class="col-md-6" style="text-align: right; display: flex;align-items: end;justify-content: end;margin-bottom: 24px;transform: translateY(-24px);">
                    <form action="DispatchServlet">
                        <input type="hidden" name="userID" value="<%= user.getIdUser()%>" />
                        <input type="submit" name="btAction" value = "Thêm sản phẩm" class="btn btn-success btn-lg"/>
                    </form>
                    <c:url var="checkOutLink" value="MainController">
                        <c:param name="action" value="CheckOut"></c:param>
                        <c:param name="total" value="${sessionScope.total}"></c:param>
                    </c:url>
                    <a class="d-inline btn btn-success btn-lg" href="checkout.html" style="margin-left: 10px; margin-top: 20px;">Thanh toán</a>
<!--                <span class="navbar-text" style="color: yellow; font-weight: bold; padding: 0px 30px 0px 0px; font-size: 20px;">${requestScope.MESSAGE}</span>
                <a href="${checkOutLink}" class="shopping-button" style="color: white; font-weight: bold;" >Proceed to CheckOut</a>-->
                </div>
            </div>
        </div>
        <% 
            String message = (String) request.getAttribute("MESSAGE");
            if(message != null) { 
        %> 
                <div id="notificationText-quantity fade-in-out"><%= message %></div>
        <% } %>
        <!-- Footer -->
        <%@include file="components/footerComponent.jsp" %>
        <!-- End of footer -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- JQUERY-->
        <script
            type="text/javascript"
            src="https://code.jquery.com/jquery-1.11.0.min.js"
        ></script>
        <script
            type="text/javascript"
            src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"
        ></script>
        <script
            type="text/javascript"
            src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"
        ></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="js/main.js"></script>
        <script src="js/load-more.js"></script>
        <script src="vendor/slick/slick.min.js"></script>
        <script src="js/slick-custom.js"></script>
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="js/compare.js"></script>
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
