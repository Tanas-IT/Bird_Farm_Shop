

<%@page import="birdfarm.shopping.Cart"%>
<%@page import="java.util.Map"%>
<%@page import="birdfarm.dto.UserDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="birdfarm.dto.BirdDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Bird Farm Shop</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
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
    </head>

    <body>
        <c:set var="cart" value="${sessionScope.CART}" />
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Header Section Begin -->
        <nav style="background-color:#f3e4e4 !important; position:fixed; width: 100%; z-index: 100; padding-bottom: 0; cursor: pointer;" class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container container-header px-4 px-lg-5">
                <a style="margin: 0" class="navbar-brand" href="#!">
                    <img class="logo" src="img/bird_logo.png" alt="logo"/>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item">
                            <c:set var="url" value="DispatchServlet" />
                            <c:set var="userId" value="" />
                            <c:if test="${not empty user}">
                                <c:set var="userId" value="${user.idUser}" />
                                <c:set var="url" value="DispatchServlet?btAction=Home&amp;txtUsername=${user.username}&amp;txtPassword=${user.password}" />
                            </c:if>

                            <form action="${url}">
                                <c:if test="${not empty user}">
                                    <input type="hidden" name="userID" value="${userId}" />
                                </c:if>
                                <input style="background-color: #f3e4e4;border: none;font-weight: 600;font-size: 18px;" id="home-link" type="submit" class="nav-link nav-active" aria-current="page" value="Trang chủ"/>
                            </form>
                        </li>
                        <li class="nav-item">
                            <c:choose>
                                <c:when test="${not empty user}">
                                    <a id="about-link" class="nav-link" href="about.jsp?userID=${user.idUser}" onclick="handleButtonClick(this)">
                                        <h5 class="background-hover">Về chúng tôi</h5>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a id="about-link" class="nav-link" href="about.jsp" onclick="handleButtonClick(this)">
                                        <h5 class="background-hover">Về chúng tôi</h5>
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </li>
                         <li class="nav-item">
                             <c:choose>
                                <c:when test="${not empty user}">
                                    <a id="about-link" class="nav-link" href="DispatchServlet?btAction=Pairing&userID=${user.idUser}" onclick="handleButtonClick(this)">
                                        <h5 class="background-hover">Ghép cặp</h5>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a id="about-link" class="nav-link" href="Login.jsp" onclick="handleButtonClick(this)">
                                        <h5 class="background-hover">Ghép cặp</h5>
                                    </a>
                                </c:otherwise>
                            </c:choose>
                           
                        </li>
                        <li class="nav-item">
                             <c:choose>
                                <c:when test="${not empty user}">
                                    <a class="nav-link" href="DispatchServlet?btAction=HistoryBill" role="button" aria-expanded="false" onclick="handleButtonClick(this)">
                                        <h5 class="background-hover">Hàng đã mua</h5>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a class="nav-link" href="Login.jsp" role="button" aria-expanded="false" onclick="handleButtonClick(this)">
                                        <h5 class="background-hover">Hàng đã mua</h5>
                                    </a>
                                </c:otherwise>
                            </c:choose>
                            
                        </li>
                    </ul>
                    <div class=" input-group input-button">
                        <form class="w-100" action="DispatchServlet">
                            <input oninput="searchByName(this)" name="txtSearchBird" class="form-control border-end-0 border rounded-pill" type="text" placeholder="search" id="example-search-input">
                        </form>
                    </div>
                    <form action="DispatchServlet">
                        <c:set var="trimmedUserId" value="${fn:trim(user.getIdUser())}" />
                        <input type="hidden" name="userID" value="${trimmedUserId}" />
                        <button class="cart btn" type="submit" name="btAction" value="Xem giỏ hàng">
                            <i class="fa-solid fa-cart-shopping"></i>
                            <!--No cart:  header_cart-list--no-cart-->
                            <c:choose>
                                <c:when test="${empty cart}">
                                    <div class="header_cart">
                                        <div class="header__cart-list  header_cart-list--no-cart">
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
                                                    <c:set var="period" value="Chim phổ thông" />
                                                    <c:choose>
                                                        <c:when test="${entry.value.type eq 1}">
                                                            <c:set var="period" value="Tổ chim" />
                                                        </c:when>
                                                        <c:when test="${entry.value.type eq 2}">
                                                            <c:set var="period" value="Chim cao cấp" />
                                                        </c:when>
                                                        <c:when test="${entry.value.type eq 3}">
                                                            <c:set var="period" value="Chim giống" />
                                                        </c:when>
                                                    </c:choose>
                                                    <li class="header__cart-item">
                                                        <img class="header__cart-img" src="${entry.value.imageURL}">
                                                        <div class="header__cart-item-info">
                                                            <div class="header__cart-item-head">
                                                                <h5 class="header__cart-item-name">${entry.value.name}</h5>
                                                                <div class="header__cart-item-price-wrap">
                                                                    <span class="header__cart-item-price">
                                                                        <fmt:formatNumber value="${entry.value.salePrice}" pattern="###,### VND"/>
                                                                    </span>
                                                                    <span class="header__cart-item-multiply">x</span>
                                                                    <span class="header__cart-item-quantity">${entry.value.quantityOfUser}</span>
                                                                </div>
                                                            </div>
                                                            <div class="header__cart-item-body">
                                                               <span class="header__cart-item-description">
                                                                        Phân loại hàng: ${period}
                                                                </span>
                                                                <c:url var="deleteLink" value="DispatchServlet">
                                                                    <c:param name="btAction" value="RemoveItem" />
                                                                    <c:param name="idBirdRemove" value="${entry.value.idBird}"/>
                                                                </c:url>
                                                                <a href="${deleteLink}" class="header__cart-item-remove">Xóa</a> 
                                                            </div>
                                                        </div>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                            <form action="DispatchServlet">
                                                <input id="userID" type="hidden" name="userID" value="${user.idUser}" />
                                                <input id="birdID" type="hidden" name="birdID" value="${birdDetail.idBird}" />
                                                <input type="submit" name="btAction" class="header__cart-view-cart btn btn-danger" value="Xem chi tiết" />
                                            </form>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                            Giỏ hàng
                            <span class="badge bg-warning text-white ms-1 rounded-pill">
                                <c:choose>
                                    <c:when test="${not empty sessionScope.quantityOfCart}">
                                        ${sessionScope.quantityOfCart}
                                    </c:when>
                                    <c:otherwise>
                                        0
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </button>
                    </form>
                    <c:set var="image" value="img/user-image.png" />
                    <c:if test="${not empty user.image}">
                        <c:set var="image" value="${user.image}" />
                    </c:if>
                    <div style="width: 154px">
                        <img style="width: 30px; height: 30px; background-size: cover; border-radius: 50%;" src="${image}">
                        <c:if test="${not empty user.getFullName()}">
                            <p style="display:inline; font-weight: 500;width: 154px">Xin chào,</p><br/>
                            <p style="display:inline; font-weight: 500;width: 154px"><c:out value="${user.getFullName()}" /></p>
                        </c:if>
                        <c:if test="${empty user.getFullName()}">
                            <p style="display:inline; font-weight: 500;width: 154px">Xin chào, Khách</p><br/>
                            <p style="display:inline; font-weight: 500;width: 154px"><c:out value="${user.getFullName()}" /></p>
                        </c:if>
                    </div>
                    <form action="LogoutServlet">
                        <button style="margin-left: 10px;" type="submit" class="btn-register btn btn-danger">
                            Đăng xuất
                        </button>
                    </form>
                </div>
            </div>
        </nav>
        <!-- About -->
        <div class="bg-white">
            <div class="container py-3">
                <div style="margin-bottom: 50px" class="row align-items-center">
                    <i class="fa fa-leaf fa-2x mb-3 text-primary"></i><h2 class="text-center text-black">Wings & Whistles Aviary: Your Ultimate Avian Sanctuary</h2>
                    <div class="col-lg-12" style="margin-top: 50px;">
                        <h3 class="text-center mt-2">Một vài điều về shop của chúng tôi</h3>
                        <ul>
                            <li><p style="text-align: justify;font-weight: bold; margin-bottom: 0">Một nơi tuyệt vời để ngắm chim:</p>Trang trại của chúng tôi không chỉ bán chìm mà còn phù hợp cho các bạn đắm chìm trong khung cảnh và âm thanh mê hoặc của các loài chim đa dạng của chúng tôi. Đi lang thang qua những chuồng chim rộng rãi của chúng tôi, nơi những chú vẹt rực rỡ, những chú chim hoàng yến du dương và những chú chim săn mồi hùng vĩ sẽ chiếm trọn trái tim bạn.</li>
                            <li><p style="font-weight: bold; margin-bottom: 0">Một nơi chuyên cung cấp các chú chim tốt: </p>Cho dù bạn là người chơi chim dày dạn hay người mới bắt đầu, bạn sẽ tìm thấy người bạn đồng hành có lông vũ hoàn hảo trong bộ sưu tập các loài chim khỏe mạnh, được chăm sóc tốt của chúng tôi. Từ những chú chim non đầy màu sắc cho đến những chú vẹt đuôi dài kỳ lạ, chúng tôi có rất nhiều người bạn chim đang tìm kiếm những ngôi nhà yêu thương.</li>
                            <li><p style="font-weight: bold; margin-bottom: 0">Ghép chim chuyên nghiệp: </p>Đội ngũ nhân viên giàu kinh nghiệm của chúng tôi luôn tận tâm để đảm bảo rằng bạn và người bạn lông vũ mới của bạn sẽ có được sự kết hợp hoàn hảo. Chúng tôi cung cấp dịch vụ tư vấn ghép cặp chim được cá nhân hóa để đảm bảo hạnh phúc và hạnh phúc cho cả bạn và người bạn đồng hành của bạn.</li>
                            <li><p style="font-weight: bold; margin-bottom: 0">Cung cấp điều cần thiết về chăm sóc chim: </p>Khám phá bộ sưu tập toàn diện của chúng tôi về các nhu yếu phẩm chăm sóc chim, từ thức ăn cho chim và vật liệu làm tổ chất lượng hàng đầu cho đến lồng, đậu và đồ chơi rộng rãi sẽ giúp những người bạn lông vũ của bạn giải trí.</li>
                            <li><p style="font-weight: bold; margin-bottom: 0">Có nhiều kinh nghiệm trong việc giáo dục: </p>Hãy tham gia cùng chúng tôi để tham gia các chương trình giáo dục tương tác và các sự kiện quan sát chim nhằm phục vụ những người đam mê chim ở mọi lứa tuổi. Tìm hiểu về những hành vi, môi trường sống và nỗ lực bảo tồn độc đáo của những người bạn chim của chúng ta.</li>
                        </ul>
                        <h3 class="text-center">Hãy ghé thăm chúng tôi ngay hôm nay:</h3>
                        <p class="text-center">Sẵn sàng khám phá thế giới loài chim cùng chúng tôi? Nhấp vào nút "Tìm hiểu thêm" để lên kế hoạch cho chuyến thăm của bạn và bay vào thế giới đặc biệt của các loài chim tại Bird Farm Shop của chúng tôi.</p>
                        <c:if test="${user != null}">
                            <a href="DispatchServlet?btAction=Login&amp;txtUsername=${user.username}&amp;txtPassword=${user.password}" style="position: relative;left: 50%;transform: translateX(-50%);color: #fff; background-color: #7DB32B;" class="btn btn-light px-5 rounded-pill shadow-sm">Tìm hiểu thêm</a>
                        </c:if>
                        <c:if test="${user == null}">
                            <a href="BirdProductServlet" style="position: relative;left: 50%;transform: translateX(-50%);color: #fff; background-color: #7DB32B;" class="btn btn-light px-5 rounded-pill shadow-sm">Tìm hiểu thêm</a>
                        </c:if>
                    </div>
                </div>
                <div class="row align-items-center mb-5">
                    <div class="col-lg-6 order-2 order-lg-1"><i class="fa fa-bar-chart fa-2x mb-3 text-primary"></i>
                        <h2 class="text-black">Trang trại chim của chúng tôi</h2>
                        <p class="font-italic text-muted mt-3 mb-4">Khám phá vẻ đẹp ✴️ và sự tuyệt vời ✴️ của thế giới chim qua trang web ✴️ chuyên bán chim  của chúng tôi!</p>
                        <a href="https://chimtri.vn/#home" class="btn btn-light px-5 rounded-pill shadow-sm">Tìm hiểu thêm</a>
                    </div>
                    <div class="col-lg-5 px-5 mx-auto order-1 order-lg-2"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31329.586478731388!2d106.52784040999563!3d11.023742938073461!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3174d3b37484d713%3A0xb6bcaf465ab09f0a!2zVHLhuqFpIENoaW0gVHLEqSBUaMOgbmggQ8O0bmcgLSBD4bunIENoaQ!5e0!3m2!1svi!2s!4v1698222083705!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></div>
                </div>
            </div>
        </div>
        <div class="bg-light">
            <div class="container py-3">
                <div class="row mb-4">
                    <div class="col-lg-5">
                        <h2 class="display-4 text-black">Các thành viên</h2>
                    </div>
                </div>
                <div class="row text-center">
                    <!-- Team item-->
                    <div class="col-xl-3 col-sm-3 mb-5">
                         <div class="bg-white rounded shadow-sm py-5 px-4"><img src="https://avatars.githubusercontent.com/u/77594830?v=4" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
                            <h5 class="mb-0 text-black">Trường nhóm</h5><span class="small text-uppercase text-muted">Huỳnh Phước Tấn</span>
                            <ul class="social mb-0 list-inline mt-3">
                                <li class="list-inline-item"><a href="https://www.facebook.com/khoahd7621/" class="social-link"><i class="bi bi-facebook"></i></a></li>
                                <li class="list-inline-item"><a href="https://github.com/khoahd7621" class="social-link"><i class="bi bi-github"></i></a></li>
                                <li class="list-inline-item"><a href="https://www.instagram.com/khoahd7621/" class="social-link"><i class="bi bi-instagram"></i></a></li>
                                <li class="list-inline-item"><a href="https://www.linkedin.com/in/khoahd7621/?fbclid=IwAR2mB1D7HMm83CI1r7icI9xdkp436ZBc42VABtbttL7YXqHa7lZ4mGuK7NI" class="social-link"><i class="bi bi-linkedin"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-3 mb-5">
                    <div class="bg-white rounded shadow-sm py-5 px-4"><img src="https://avatars.githubusercontent.com/u/77594830?v=4" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
                        <h5 class="mb-0 text-black">Thành viên</h5><span class="small text-uppercase text-muted">Nguyễn Đức Anh</span>
                            <ul class="social mb-0 list-inline mt-3">
                                <li class="list-inline-item"><a href="https://www.facebook.com/khoahd7621/" class="social-link"><i class="bi bi-facebook"></i></a></li>
                                <li class="list-inline-item"><a href="https://github.com/khoahd7621" class="social-link"><i class="bi bi-github"></i></a></li>
                                <li class="list-inline-item"><a href="https://www.instagram.com/khoahd7621/" class="social-link"><i class="bi bi-instagram"></i></a></li>
                                <li class="list-inline-item"><a href="https://www.linkedin.com/in/khoahd7621/?fbclid=IwAR2mB1D7HMm83CI1r7icI9xdkp436ZBc42VABtbttL7YXqHa7lZ4mGuK7NI" class="social-link"><i class="bi bi-linkedin"></i></a></li>
                            </ul>
                    </div>
                   </div>
                    <div class="col-xl-3 col-sm-3 mb-5">
                    <div class="bg-white rounded shadow-sm py-5 px-4"><img src="https://avatars.githubusercontent.com/u/77594830?v=4" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
                        <h5 class="mb-0 text-black">Thành viên</h5><span class="small text-uppercase text-muted">Nguyễn Kỳ Anh Minh</span>
                            <ul class="social mb-0 list-inline mt-3">
                                <li class="list-inline-item"><a href="https://www.facebook.com/khoahd7621/" class="social-link"><i class="bi bi-facebook"></i></a></li>
                                <li class="list-inline-item"><a href="https://github.com/khoahd7621" class="social-link"><i class="bi bi-github"></i></a></li>
                                <li class="list-inline-item"><a href="https://www.instagram.com/khoahd7621/" class="social-link"><i class="bi bi-instagram"></i></a></li>
                                <li class="list-inline-item"><a href="https://www.linkedin.com/in/khoahd7621/?fbclid=IwAR2mB1D7HMm83CI1r7icI9xdkp436ZBc42VABtbttL7YXqHa7lZ4mGuK7NI" class="social-link"><i class="bi bi-linkedin"></i></a></li>
                            </ul>
                    </div>
                    </div>
                    <div class="col-xl-3 col-sm-3 mb-5">
                    <div class="bg-white rounded shadow-sm py-5 px-4"><img src="https://avatars.githubusercontent.com/u/77594830?v=4" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
                        <h5 class="mb-0 text-black">Thành viên</h5><span class="small text-uppercase text-muted">Trương Trí Sỹ</span>
                            <ul class="social mb-0 list-inline mt-3">
                                <li class="list-inline-item"><a href="https://www.facebook.com/khoahd7621/" class="social-link"><i class="bi bi-facebook"></i></a></li>
                                <li class="list-inline-item"><a href="https://github.com/khoahd7621" class="social-link"><i class="bi bi-github"></i></a></li>
                                <li class="list-inline-item"><a href="https://www.instagram.com/khoahd7621/" class="social-link"><i class="bi bi-instagram"></i></a></li>
                                <li class="list-inline-item"><a href="https://www.linkedin.com/in/khoahd7621/?fbclid=IwAR2mB1D7HMm83CI1r7icI9xdkp436ZBc42VABtbttL7YXqHa7lZ4mGuK7NI" class="social-link"><i class="bi bi-linkedin"></i></a></li>
                            </ul>
                    </div>
                    </div>
                    <!-- End-->
                </div>
            </div>
        </div>
        <!-- Subscribe News Letter -->
        <%@include file="components/subscribeNewsLetterComponent.jsp" %>
        <!-- Footer -->
        <%@include file="components/footerComponent.jsp" %>
        <!-- Bootstrap core JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Toast Alert script -->
        <script src="js/toast-alert.js"></script>
        <script src="js/subscribe-newsletter.js"></script>
        <!-- Home Slider JS -->
        <script src="vendor/slick/slick.min.js"></script>
        <script src="js/slick-custom.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script>
                        $('.js-pscroll').each(function () {
                            $(this).css('position', 'relative');
                            $(this).css('overflow', 'hidden');
                            var ps = new PerfectScrollbar(this, {
                                wheelSpeed: 1,
                                scrollingThreshold: 1000,
                                wheelPropagation: false,
                            });

                            $(window).on('resize', function () {
                                ps.update();
                            })
                        });
        </script>
        <!-- Main -->
        <script src="js/main.js"></script>
    </body>
</html>

