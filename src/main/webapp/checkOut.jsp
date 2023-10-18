<%-- 
    Document   : checkOut
    Created on : Jun 26, 2023, 5:42:46 PM
    Author     : 1005h
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="Assets/css/viewCart-jsp.css">
        <title>CheckOut</title>
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
        </style>
    </head>
    <body>
        <c:set var="user" value="${sessionScope.user}"/>
        <c:if test="${sessionScope.CART == null}">
            <c:set scope="request" var="MESSAGE_CHECKOUT" value="Your cart is empty!"></c:set>
            <jsp:forward page="home.jsp"></jsp:forward>
        </c:if>
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
                             <c:url var="userLink" value="DispatchServlet">
                                    <c:param name="txtUsername" value="${user.username}" />
                                    <c:param name="txtPassword" value="${user.password}"></c:param>
                                    <c:param name="total" value="${sessionScope.total}"></c:param>
                            </c:url>
                           
                            <form action=${userLink}>
                                <c:if test="${user eq null}">
                                      <input type="hidden" name="userID" value="${user.idUser}" />
                                </c:if>
                                 <c:if test="${user ne null}">
                                      <input style="background-color: #f3e4e4;border: none;font-weight: 600;font-size: 18px;" id="home-link" type="submit" class="nav-link nav-active" aria-current="page" value="Trang chủ"/>
                                </c:if>
                            </form>
                        </li>
                        <li class="nav-item">
                            <a id="about-link" class="nav-link" href="about.jsp?userID=${user.idUser}" onclick="handleButtonClick(this)">
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
                        <form class="w-100" action="DispatchServlet">
                            <input oninput="searchByName(this)" name="txtSearchBird" class="form-control border-end-0 border rounded-pill" type="text" placeholder="search" id="example-search-input">
                        </form>
                    </div>
                           <c:set var="image" value="img/user-image.png"/>
                            <c:if test="${not empty user.image}">
                                <c:set var="image" value="${user.image}"/>
                            </c:if>
                    <div style="width: 154px">
                        <img style="width: 30px; height: 30px; background-size: cover; border-radius: 50%;" src="${image}">
                        <p style="display:inline; font-weight: 500;width: 154px">Xin chào,</p><br/>
                        <p style="display:inline; font-weight: 500;width: 154px"> ${user.fullName}</p>
                    </div>
                    <form action="Login.jsp">
                        <button style="margin-left: 10px;" type="submit" class="btn-register btn btn-danger">
                            Đăng xuất
                        </button>
                    </form>
                </div>
            </div>
        </nav>
        <!-- Gioi thieu -->
        <!-- Content -->
           <div class="card" style="margin-top: 10%; margin-bottom: 5%">
            <div class=" row">
                <div class="col-md-7 cart">
                    <div class="title">
                        <div class="row">
                            <div class="col">
                                <h4><b>Sản phẩm</b></h4>
                            </div>
                            <!-- <div class="col align-self-center text-right text-muted">3 items</div> -->
                        </div>
                    </div>
                    <c:forEach var="product" varStatus="counter" items="${sessionScope.CHECKOUTCART.cart}">
                     <c:set scope="request" var="total" value="${requestScope.total + product.value.quantity * product.value.salePrice}"></c:set>
                    <div class="row border-top border-bottom">
                        <div class="row main align-items-center">
                            
                            <!--<div class="col-2"><img class="img-fluid" src="https://i.imgur.com/1GrakTl.jpg"></div>-->
                            <div class="col">
                                <td style="padding-top: 40px; text-align: center;">${counter.count}</td>
                            </div>
                            <div class="col">
                                <div class="row">${product.value.name}</div>
                            </div>
                            <div class="col" style="text-align: center;">
                                <div class="text-muted">Số lượng: ${product.value.quantity}</div>
                            </div>
                            <div class="col" style="text-align: center;">${product.value.salePrice}đ</div>
                        </div>
                    </div>
                    </c:forEach>

                    <div class="back-to-shop text-muted"><a href="carts">&leftarrow; Trở lại cửa hàng</a></div>
                </div>
                <div class="style-btn col-md-5 summary">
                    <div class="row">
                        <h4 class="cal"><b>Thông tin giao hàng</b></h4>
                        <div class="col align-self-center text-right text-muted">Hãy sửa các thông tin chính xác nhất</div>
                    </div>
                    <hr>
                    <form class="input-name" action="DispatchServlet" method="POST">
                        <label for="fullname">Họ Tên</label>
                        <input id="fullname" type="text" name="fullname" value="${user.fullName}">

                        <label for="phone">SỐ ĐIỆN THOẠI</label>
                        <input id="phone" type="text" name="phone" value="${user.phoneNumber}"/>

                        <label for="address">ĐỊA CHỈ</label>
                        <input id="address" type="text" name="address" value="${user.address}"/>

                        <label for="note">GHI CHÚ</label>
                        <textarea id="note" class="form-control" name="note" style="background-color: rgb(247, 247, 247);"
                                  id="exampleFormControlTextarea1" rows="3"></textarea>
                                  
                         <input type="radio" name="payType" value="COD">
                         <label for="payType" style="font-weight: bold; padding-bottom: 10px;">Cash On Delivery (COD)</label><br>
                
                         <input type="radio" name="payType" value="VNPAY" checked="true">
                         <label for="payType" style="font-weight: bold; padding-bottom: 10px;">Online Payment via VNPAY (NCB)</label><br>
                    
                    <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                        <div class="col">TỔNG TIỀN</div>
                        <div class="col text-right">${sum}đ</div>
                        <input type="hidden" name="sum" value="${requestScope.total}">
                    </div>
 
                     <input type="hidden" name="btAction" value="Payment"/>
                     <input type="submit" value="Payment" class="btn btn-success btn-lg"/>
                    </form>
                </div>
            </div>
        </div>
        <!-- End of content -->
        <!-- User's Info -->
    
        <!-- End of User info -->
        <!-- Footer -->
        <%@include file="components/footerComponent.jsp" %>
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
