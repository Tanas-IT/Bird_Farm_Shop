<%-- 
    Document   : paymentResultVNP
    Created on : Jul 3, 2023, 5:10:38 PM
    Author     : 1005h
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="Assets/css/COD.css">
        <link rel="icon" type="image/x-icon" href="img/bird_logo.png">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Bird Farm Shop</title>
        <!-- Favicon-->
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
        <link rel="stylesheet" type="text/css" href="css/header_cart.css">
        <title>Hóa đơn</title>
    </head>
    <body>
        <c:if test="${sessionScope.user == null}">
            <c:redirect url="Login.jsp"></c:redirect>
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
                            <a　id="home-link" class="nav-link nav-active" aria-current="page" href="#">
                                <h5 class="background-hover">Trang chủ</h5>
                            </a>
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
                    <form action="DispatchServlet">
                        <input type="hidden" name="userID" value="${user.idUser}" />
                        <button class="cart btn" type="submit" name="btAction" value="Xem giỏ hàng">
                            <i class="fa-solid fa-cart-shopping"></i>
                            <!--No cart:  header_cart-list--no-cart-->
                            <c:choose>
                                <c:when test="${empty cart}">
                                    <div class="header_cart">
                                        <div class="header__cart-list header_cart-list--no-cart">
                                            <img class="header__cart-no-cart-img" src="img/no_cart.png"/>
                                            <span class="header__cart-list-no-cart-msg">Chưa có sản phẩm</span>
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="header_cart">
                                        <div class="header__cart-list">
                                            <h4 class="header__cart-heading">Sản phẩm đã thêm</h4>
                                            <ul class="header__cart-list-item">
                                                <!--Cart Item-->
                                                <c:forEach var="entry" items="${cart.cart}">
                                                    <c:set var="type" value="Chim phổ thông" />
                                                    <c:choose>
                                                        <c:when test="${entry.value.type == 1}">
                                                            <c:set var="type" value="Tổ chim" />
                                                        </c:when>
                                                        <c:when test="${entry.value.type == 2}">
                                                            <c:set var="type" value="Chim cao cấp" />
                                                        </c:when>
                                                        <c:when test="${entry.value.type == 3}">
                                                            <c:set var="type" value="Chim giống" />
                                                        </c:when>
                                                    </c:choose>
                                                    <li class="header__cart-item">
                                                        <img class="header__cart-img" src="${entry.value.imageURL}">
                                                        <div class="header__cart-item-info">
                                                            <div class="header__cart-item-head">
                                                                <h5 class="header__cart-item-name">${entry.value.name}</h5>
                                                                <div class="header__cart-item-price-wrap">
                                                                    <span class="header__cart-item-price">
                                                                        <fmt:formatNumber type="number" value="${entry.value.salePrice}" pattern="###,###"/> VND
                                                                    </span>
                                                                    <span class="header__cart-item-multiply">x</span>
                                                                    <span class="header__cart-item-quantity">${entry.value.quantity}</span>
                                                                </div>
                                                            </div>
                                                            <div class="header__cart-item-body">
                                                                <span class="header__cart-item-description">
                                                                    Phân loại hàng: ${type}
                                                                </span>
                                                                <span class="header__cart-item-remove">Xóa</span>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                            <form action="DispatchServlet">
                                                <input type="hidden" name="userID" value="${user.idUser}" />
                                                <input type="hidden" name="birdID" value="${idBird}" />
                                                <input type="submit" name="btAction" class="header__cart-view-cart btn btn-danger" value="Xem chi tiết" />
                                            </form>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                            Giỏ hàng
                            <span class="badge bg-warning text-white ms-1 rounded-pill">
                                <% if (session.getAttribute("quantityOfCart") != null) {%>
                                <%= session.getAttribute("quantityOfCart")%>
                                <%} else { %>
                                0
                                <%}%>
                            </span>
                        </button>
                    </form>

                    <c:set var="image" value="img/user-image.png" />
                    <c:if test="${not empty user.image}">
                        <c:set var="image" value="${user.image}" />
                    </c:if>
                    <div style="width: 154px">
                        <img style="width: 30px; height: 30px; background-size: cover; border-radius: 50%;" src="${image}">
                        <p style="display:inline; font-weight: 500;width: 154px">Xin chào,</p><br/>
                        <p style="display:inline; font-weight: 500;width: 154px">${user.fullName}</p>
                    </div>
                    <form action="Login.jsp">
                        <button style="margin-left: 10px;" type="submit" class="btn-register btn btn-danger">
                            Đăng xuất
                        </button>
                    </form>
                </div>
            </div>

        </nav>
        <div class="container">
            <div class="table-responsive">
                <h1>Thông tin người nhận</h1>
                <c:if test="${sessionScope.user != null}">
                    <c:if test="${not empty sessionScope.user}">
                        <table class="table table-striped">
                            <tr>
                                <th>FullName:</th>
                                <td>${sessionScope.user.fullName}</td>
                            </tr>
                            <tr>
                                <th>Email:</th>
                                <td>${sessionScope.EMAIL}</td>
                            </tr>
                        </table>
                    </c:if>
                </c:if>
            </div>
        </div>
        <div class="container">
            <div class="table-responsive">
                <h1>Hóa đơn</h1>
                <c:if test="${sessionScope.ORDERDETAIL != null}">
                    <c:if test="${not empty sessionScope.ORDERDETAIL}">
                        <c:forEach var="birdItem" items="${sessionScope.ORDERDETAIL}">
                        <table class="table table-striped">
                            <tr>
                                <th>Mã đơn hàng</th>
                                <td>${birdItem.idOrder}</td>
                            </tr>
                            <tr>
                                <th>Ngày giao</th>
                                <td>${birdItem.createdDate}</td>
                            </tr>
                            <tr>
                                <th>Trạng thái</th>
                                <td>${birdItem.status}</td>
                            </tr>
                            <tr>
                                <th>Lưu ý</th>
                                <td>${birdItem.note}</td>
                            </tr>
                            <tr>
                                <th>Họ và tên người nhận</th>
                                <td>${birdItem.fullName}</td>
                            </tr>
                            
                            <tr>
                                <th>Tên sản phẩm</th>
                                <td>${birdItem.bird.name}</td>
                            </tr>
                            <tr>
                                <th>Mô tả</th>
                                <td>${birdItem.bird.shortDescription}</td>
                            </tr>
                            <tr>
                                <th>Email</th>
                                <td>${sessionScope.EMAIL}</td>
                            </tr>
                            <tr>
                                <th>Đơn giá</th>
                                <td>
                                    <fmt:formatNumber var="formatPrice" value=" ${birdItem.price}"  />
                                        ${formatPrice}  VNĐ
                                </td>
                            </tr>
                            <tr>
                                <th>Số lượng</th>
                                <td>${birdItem.quantity}</td>
                            </tr>
                            <tr>
                                <th>Tổng tiền</th>
                                <td>
                                    <fmt:formatNumber var="formatTotalPrice" value="${birdItem.price * birdItem.quantity}"  />
                                     ${formatTotalPrice}  VNĐ
                                </td>
                            </tr>
                            <tr>
                                <th>Địa chỉ</th>
                                <td>${sessionScope.ORDER.receiverAddress}</td>
                            </tr>
                            </c:forEach>
                        </table>
                    </c:if>
                </c:if>
            </div>
        </div>
        <div style="text-align: center; margin-top: 20px;">
            <a href="DispatchServlet?btAction=Login&txtUsername=${user.username}&txtPassword=${user.password}" class="btn btn-success btn-lg">Quay lại trang mua hàng</a>
        </div>
        <!-- Footer -->
        <%@include file="components/footerComponent.jsp" %>
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
