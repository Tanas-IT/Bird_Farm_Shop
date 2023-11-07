<%-- 
    Document   : checkOut
    Created on : Jun 26, 2023, 5:42:46 PM
    Author     : 1005h
--%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <c:if test="${sessionScope.CHECKOUTRCART == null}">
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
                        <c:if test="${user eq null}">
                            <input type="hidden" name="userID" value="${user.idUser}" />
                        </c:if>
                        <c:if test="${user ne null}">
                            <form action="DispatchServlet">
                                <input type="hidden" name="txtUsername" value="${user.username}"/>
                                <input type="hidden" name="txtPassword" value="${user.password}"/>
                                <input type="hidden" name="total" value="${sessionScope.Rtotal}"/>
                                <input style="background-color: #f3e4e4;border: none;font-weight: 600;font-size: 18px;" id="home-link" type="submit" class="nav-link nav-active" aria-current="page" value="Trang chủ"/>
                            </form>
                        </c:if>
                    </li>
                    <li class="nav-item">
                        <a id="about-link" class="nav-link" href="about.jsp?userID=${user.idUser}" onclick="handleButtonClick(this)">
                            <h5 class="background-hover">Về chúng tôi</h5>
                        </a>
                    </li>
                    <li class="nav-item">
                            <a id="about-link" class="nav-link" href="DispatchServlet?btAction=Pairing&userID=${user.idUser}" onclick="handleButtonClick(this)">
                                <h5 class="background-hover">Ghép cặp</h5>
                            </a>
                        </li>
                    <li class="nav-item">
                            <a class="nav-link" href="DispatchServlet?btAction=HistoryBill" role="button" aria-expanded="false" onclick="handleButtonClick(this)">
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
                <form action="LogoutServlet">
                    <button style="margin-left: 10px;" type="submit" class="btn-register btn btn-danger">
                        Đăng xuất
                    </button>
                </form>
            </div>
        </div>
    </nav>
    <form action="DispatchServlet">
    <div class="container" style="max-width: 1400px;">
        <div class="table-responsive">
            <c:if test="${sessionScope.CHECKOUTRCART != null}">
                <c:if test="${not empty sessionScope.CHECKOUTRCART}">
                   
                    <table style="margin-top: 12%" class="table table-striped">
                        <thead>
                            <tr>
                                <th style="text-align: center;">STT</th>
                                <th style="text-align: center;">Hình ảnh</th>
                                <th style="text-align: center;">Tên</th>
                                <th style="text-align: center;">Giới tính</th>
                                <th style="text-align: center;">Phí ghép cặp</th>
                                <th style="text-align: center;">Số lượng</th>
                                <th style="text-align: center;">Đơn giá</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="product" varStatus="counter" items="${sessionScope.CHECKOUTRCART.rcart}">
                                    <tr>
                                        <td style="padding-top: 40px; text-align: center;">${counter.count}</td>
                                    <td style="text-align: center;">
                                        <img src="${product.value.imageURL}" alt="alt" width="100px" height="100px" style="border-radius: 10px;"/> 
                                    </td>
                                    <td style="padding-top: 40px; text-align: center;">
                                        <h3 style="border: none; background: none; font-size: 20px; margin: 0 auto; max-width: 200px;">${product.value.name}</h3>
                                    </td>
                                    <td style="padding-top: 40px; text-align: center;">
                                        <input style="border: none; background-color: transparent; text-align: center;" readonly="true" type="text" name="idBird" value="${product.value.gender}"/>
                                    </td>
                                    <td style="padding-top: 40px; text-align: center;">
                                        <c:if test="${product.value.gender == 'Trống'}">
                                            <fmt:formatNumber var="formatPrice" value="${product.value.feeBirdNestMale}" />
                                            <input type="text" name="birdPrice" value="${formatPrice}" readonly="" style="border: none; background-color: transparent; font-size: 20px; text-align: center;"/>
                                        </c:if>
                                        <c:if test="${product.value.gender == 'Mái'}">
                                             <fmt:formatNumber var="formatPrice" value="${product.value.feeBirdNestFemale}" />
                                            <input type="text" name="birdPrice" value="${formatPrice}" readonly="" style="border: none; background-color: transparent; font-size: 20px; text-align: center;"/>
                                        </c:if>
                                    </td>
                                    <td style="padding-top: 40px; text-align: center;">
                                        <input type="number" name="quantity" value="${product.value.quantity}" min="1" readonly="" style="border: none; background: none; font-size: 20px; text-align: center;"/>
                                    </td>
                                    <td style="padding-top: 40px; text-align: center; max-width: 100px; font-size: 20px;">
                                        <c:if test="${product.value.gender == 'Trống'}">
                                            <fmt:formatNumber var="formatFinalEachPrice" value="${product.value.quantity * product.value.feeBirdNestMale}"  />
                                            ${formatFinalEachPrice} 
                                        <input type="hidden" name="subTotal" value="${formatFinalEachPrice}" />
                                        </c:if>    
                                        <c:if test="${product.value.gender == 'Mái'}">
                                            <fmt:formatNumber var="formatFinalEachPrice" value="${product.value.quantity * product.value.feeBirdNestFemale}"  />
                                            ${formatFinalEachPrice} 
                                        <input type="hidden" name="subTotal" value="${formatFinalEachPrice}" />
                                        </c:if>  
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table> 
                </c:if>
            </c:if>
            <c:if test="${requestScope.MESSAGE != null}">
                <h2>${MESSAGE}</h2>
                <div style="text-align: center; margin-top: 20px;">
                    <a href="DispatchServlet?btAction=Xem chi tiết&userID=${user.idUser}" class="btn btn-success btn-lg">Quay lại xem giỏ hàng</a>
                </div>
            </c:if>
        </div>
    </div>
    <!-- End of content -->
    <!-- User's Info -->
    <div class="container" style="margin-top: 20px;">
            <div class="row" style="margin-bottom: 25px;">
                <div class="col-7">
                    <div style="background-color: rgb(255, 203, 216); padding: 20px; border-radius: 15px; box-shadow: 0 3px 10px rgb(0 0 0 /0.5) inset;">
                        <h4 style="text-align: center;"><b>Thông tin giao hàng</b></h4>
                        <div style="margin-bottom: 26px;" class="col align-self-center text-center text-muted">Hãy sửa các thông tin chính xác nhất</div>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-2">
                                    <p><label style="font-weight: bold;" for="fullname">Họ Tên</label></p> 
                                    <p><label  style="font-weight: bold;" for="phone">Email</label></p>
                                    <p style="width: 200px"><label  style="width: 100%;font-weight: bold;" for="phone">Số Điện Thoại</label></p>
                                    <p><label style="font-weight: bold;" for="address">Địa chỉ</label></p>
                                    <p style="font-weight: bold;">Ghi chú</p>
                                </div>
                                <div class="col-10">
                                    <input id="fullname" type="text" name="fullname" value="${user.fullName}"required="" style="width: 100%; margin-bottom: 10px; border: none; border-bottom: 2px solid black;"/><br>
                                    <input id="email" type="email" name="email" value="${user.email}"required="" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" style="width: 100%; margin-bottom: 10px; border: none; border-bottom: 2px solid black;"/><br>
                                    <input id="phone" type="text" name="phone" value="${user.phoneNumber}"required="" style="width: 100%; margin-bottom: 10px; border: none; border-bottom: 2px solid black;"/><br>
                                    <input type="text" name="address" value="${user.address}" required="" style="width: 100%; margin-bottom: 10px; border: none; border-bottom: 2px solid black;"/><br>
                                    <input type="text" name="note" style="height: 100px; padding-bottom: 63px; font-weight: bold; width: 100%; margin-bottom: 10px; border: none; border-bottom: 2px solid black;" placeholder="Note"></input>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-5">
                    <div style="background-color: rgb(255, 249, 158); padding: 20px 30px; border-radius: 15px; box-shadow: 0 3px 10px rgb(0 0 0 /0.5) inset;">
                        <h3 style="text-align: center; padding-bottom: 20px;">Phương thức thanh toán</h3>
                        <!-- Pay type -->
                        <input type="radio" name="payType" value="1">
                        <label for="payType" style="font-weight: bold; padding-bottom: 10px;">Thanh toán khi nhận hàng (COD)</label><br>

                        <input type="radio" name="payType" value="2" checked="true">
                        <label for="payType" style="font-weight: bold; padding-bottom: 10px;">Thanh toán Online qua VNPAY (NCB)</label><br>
                        <!-- Total -->
                        <h2 style="text-align: center; padding: 20px 0px; color: red;">
                            <fmt:formatNumber var="formatTotalPrice" value="${sessionScope.Rtotal}"  />
                            Tổng tiền:    ${formatTotalPrice}  VNĐ
                        </h2>
                        <!-- Input -->
                        <input type="hidden" name="amount" value="${sessionScope.Rtotal}"/>
                        <input type="hidden" name="total" value="${sessionScope.Rtotal}"/>
                        <div style="display: flex; justify-content: center">
                            <div id="html_element"></div>
                        </div>
                        <div id="error" style="color : red; text-align: center; padding-bottom: 15px"></div>
                        <div style="text-align: center;">
                            <input name="userID" type="hidden" value="${user.idUser}" />
                            <input type="submit" name="btAction" value="Thanh toán đơn hàng" class="btn btn-success btn-lg"/>
                        </div>
                    </div>
                </div>
             </div>
        </div>
    </form>
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
