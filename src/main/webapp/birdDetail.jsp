<%-- 
    Document   : birdDetail
    Created on : Oct 4, 2023, 11:11:22 PM
    Author     : ASUS
--%>

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
        <c:set var="idBird" value="${sessionScope.idBird}" />
        <c:set var="listBird" value="${requestScope.listBird}" />
        <c:set var="user" value="${sessionScope.user}" />
        <c:set var="birdDetail" value="" />
        <c:set var="birdRelated1" value="" />
        <c:set var="birdRelated2" value="" />
        <c:set var="birdRelated3" value="" />
        <c:set var="birdRelated4" value="" />

        <c:forEach var="bird" items="${listBird}">
            <c:if test="${bird.idBird eq idBird}">
                <c:set var="birdDetail" value="${bird}" />
            </c:if>
        </c:forEach>

        <c:set var="listBirdRandom" value="${birdDetail.getRandomBirds(listBird, birdDetail, 4)}" />
        <c:set var="birdRelated1" value="${listBirdRandom[0]}" />
        <c:set var="birdRelated2" value="${listBirdRandom[1]}" />
        <c:set var="birdRelated3" value="${listBirdRandom[2]}" />
        <c:set var="birdRelated4" value="${listBirdRandom[3]}" />

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
                        <c:set var="trimmedUserId" value="${fn:trim(user.getIdUser())}" />
                        <input type="hidden" name="userID" value="${trimmedUserId}" />
                        <button id="cart-content" class="cart btn" type="submit" name="btAction" value="Xem giỏ hàng">
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
                                                                <span class="header__cart-item-remove">
                                                                    <span data-idRemove="${entry.key}" onclick="RemoveItemFromCart(this)" >Xóa</span>
                                                            </span>
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
                        <p style="display:inline; font-weight: 500;width: 154px">Xin chào,</p><br/>
                        <p style="display:inline; font-weight: 500;width: 154px"><c:out value="${user.getFullName()}" /></p>
                    </div>
                    <form action="LogoutServlet">
                        <button style="margin-left: 10px;" type="submit" class="btn-register btn btn-danger">
                            Đăng xuất
                        </button>
                    </form>
                </div>
            </div>
        </nav>

        <!-- Product Details Section Begin -->
        <section class="product-details spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="product__details__pic">
                            <div class="product__details__pic__item">
                                <img style="height: 500px" class="w-50 product__details__pic__item--large"
                                     src="<c:out value="${birdDetail.getImageURL()}" />" alt="<c:out value="${birdDetail.getName()}" />">
                            </div>
                            <div class="img-description">
                                <img style="margin-left: 0; width: 124px; height: 93px; background-size: cover; margin-right: 15px; cursor: pointer"
                                     data-imgbigurl="<c:out value="${birdDetail.getImageURL()}" />"
                                     src="<c:out value="${birdDetail.getImageURL()}" />" alt="<c:out value="${birdDetail.getName()}" />"
                                     class="thumbnail">
                                <c:if test="${not empty birdDetail.getSubImageURL()}">
                                    <c:forEach var="img" items="${birdDetail.getSubImageURL()}">
                                        <img data-imgbigurl="<c:out value="${img}" />" style="margin-left: 0; cursor: pointer; width: 124px; height: 93px; background-size: cover; margin-right: 15px"
                                             src="<c:out value="${img}" />" alt="<c:out value="${birdDetail.getName()}" />" class="thumbnail">
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="product__details__text">
                            <h3><c:out value="${birdDetail.getName()}" /></h3>
                            <div class="product__details__rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-half-o"></i>
                            </div>
                            <c:set var="decimalFormat" value="${java.text.DecimalFormat.getInstance()}" />
                            <fmt:formatNumber var="formattedNumber" value="${birdDetail.salePrice}"  />
                        </div>
                        <div class="product__details__price">
                            <h6 style="color:red;">Giá: <c:out value="${formattedNumber}" /> VND/con</h6>
                        </div>
                        <p style="font-size: 20px;"><c:out value="${birdDetail.getShortDescription()}" /></p>
                        <p style="color: #fe5e5e;font-size: 16px;font-weight: bold;">
                            Đột biến:
                            <c:if test="${birdDetail.isMutation()}">
                                Có
                            </c:if>
                            <c:if test="${not birdDetail.isMutation()}">
                                Không
                            </c:if>
                        </p>
                        <div class="fs-18 text-black mb-2">
                            <div style="color: #fe5e5e;font-size: 18px;margin-bottom: 40px;font-weight: bold;">
                                Số lượng:
                                <i onclick="decrementQuantity()" class="btn-minus fa-solid fa-square-minus fa-xl" style="color: #59d682; margin-top: 12px;"></i>
                                <input style="width: 30px; border: 0.5px solid #ce9999cc; border-radius: 5px" class="quantityOfBird text-center" type="text" id="quantityInput" value="1" min="1" max="<c:out value="${birdDetail.getQuantity()}" />">
                                <c:if test="${birdDetail.type == 1}">
                                    <i onclick="incrementQuantity()" class="btn-plus fa-solid fa-square-plus fa-xl" style="color: #59d682; margin-top: 12px;"></i> tổ
                                    <span style="margin-left: 15px; font-size: 14px;" class="fst-italic text-muted">Tối đa <c:out value="${birdDetail.getQuantity()}" /> tổ</span>
                                </c:if>
                                <c:if test="${birdDetail.type != 1}">
                                    <i onclick="incrementQuantity()" class="btn-plus fa-solid fa-square-plus fa-xl" style="color: #59d682; margin-top: 12px;"></i> con
                                    <span style="margin-left: 15px; font-size: 14px;" class="fst-italic text-muted">Tối đa <c:out value="${birdDetail.getQuantity()}" /> con</span>
                                </c:if>
                            </div>
                        </div>
                        <div class="d-flex">
                            <c:if test="${user ne null}">
                                <form action="DispatchServlet">
                                    <input id="userID" type="hidden" name="userID" value="${user.getIdUser()}" />
                                    <input id="birdID" type="hidden" name="birdID" value="${birdDetail.getIdBird()}" />
                                    <input id="birdName" type="hidden" name="birdName" value="${birdDetail.getName()}" />
                                    <input id="birdQuantity" type="hidden" name="birdQuantity" value="1" />
                                    <div style="background-color: #7fad39; margin-right: 5px; padding-left: 10px">
                                        <i class="fa-solid fa-cart-shopping" style="color: #fff;"></i>
                                        <input style="border:none; margin-bottom: 0; margin-right: 10px; padding: 16px 12px 14px" type="submit" name="btAction" value="Thêm Vào Giỏ Hàng" class="primary-btn" />
                                    </div>
                                </form>
                            </c:if>
                            <c:if test="${user eq null}">
                                <a href="Login.jsp" style="color:#7fad39; cursor: pointer; border: 1px solid #7fad39; padding: 15px 28px 15px;" class="text-decoration-none primary-btn bg-white">
                                    <i class="fa-solid fa-cart-shopping" style="color: #7fad39;"></i>
                                    Thêm Vào Giỏ Hàng
                                </a>
                            </c:if>
                            <c:if test="${user ne null}">
                                <form action="DispatchServlet">
                                    <input type="hidden" name="userID" value="${user.getIdUser()}" />
                                    <input type="hidden" name="birdID" value="${birdDetail.getIdBird()}" />
                                    <input type="hidden" name="birdQuantity" value="1" />
                                    <input type="hidden" name="selectedItem" value="${birdDetail.getIdBird()}"/>
                                    <input style="border:none;padding: 15px 28px 15px;" type="submit" name="btAction" value="Mua ngay" class="primary-btn" />
                                </form>
                            </c:if>
                            <c:if test="${user eq null}">
                                <a style="margin-left: 20px" href="Login.jsp" class="pointer text-decoration-none primary-btn">Mua Ngay</a>
                            </c:if>
                        </div>
                        <ul class="product_sharing-social">
                            <li><b>Khả dụng</b> <span>Còn hàng</span></li>
                            <li><b>Giao hàng:</b> <span>1 ngày vận chuyển. <samp class="fst-italic">Giao hàng miễn phí ngay hôm nay</samp></span></li>
                            <li><b>Chia sẻ: </b>
                                <div class="share">
                                    <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                                    <a href="#"><i class="fa-brands fa-twitter"></i></a>
                                    <a href="#"><i class="fa-brands fa-instagram"></i></a>
                                    <a href="#"><i class="fa-brands fa-pinterest"></i></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->
    <section class="bird-descrption">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3 style="color: #7fad39" class="bird-title_descrption">Mô tả sản phẩm</h2>
                        <hr style="border-top: 2px solid; opacity: 1"/>
                        <c:if test="${not empty birdDetail.getVideoURL()}">
                            <div class="text-center video-URL">${birdDetail.getVideoURL()}</div>
                        </c:if> 
                </div>
                <div class="col-lg-12">
                    <h3 style="color: #7fad39" class="bird-title_descrption">Thông tin chi tiết</h2>
                        <hr style="border-top: 2px solid #000; opacity: 1"/>
                        <h4 style="color: blue" >Tổng quan</h4>
                        <p style="text-indent: 40px; font-size: 20px">${birdDetail.getOverview()}</p>
                        <h4 style="color: blue" >Tuổi</h4>
                        <p style="text-indent: 40px; font-size: 20px">${birdDetail.getAge()}</p>
                        <h4 style="color: blue" >Loại chim</h4>
                        <p style="text-indent: 40px; font-size: 20px">${birdDetail.getPeriod()}</p>
                        <h4 style="color: blue" >Thành tích thi đấu</h4>
                        <p style="text-indent: 40px; font-size: 20px">
                            <c:if test="${not empty birdDetail.getAchievement()}">
                                ${birdDetail.getAchievement()}
                            </c:if>
                            <c:if test="${empty birdDetail.getAchievement()}">
                                Không có
                            </c:if>
                        </p>
                        <h4 style="color: blue" >Lịch sử sinh sản</h4>
                        <p style="text-indent: 40px; font-size: 20px">
                            <c:if test="${not empty birdDetail.getReproductiveHistory()}">
                                ${birdDetail.getReproductiveHistory()}
                            </c:if>
                            <c:if test="${empty birdDetail.getReproductiveHistory()}">
                                Không có
                            </c:if>
                        </p>
                        <c:if test="${birdDetail.getFatherBird() != null && birdDetail.getIdMotherBird() != null}">
                            <h4 style="color: blue" >Chim bố và chim mẹ</h4>
                            <div class="row">
                                <div class="col-lg-6">
                                    <h5 class="text-center text-danger">Chim Bố</h5>
                                    <img style="display: block; margin: 0 auto;height: 200px" class="w-50 text-center" src="${birdDetail.getFatherBird().getImageURL()}" alt="${birdDetail.getFatherBird().getName()}">
                                    <h5 class="text-center mt-3">${birdDetail.getFatherBird().getName()}</h5>
                                    <ul style="list-style-type: none; font-size: 18px">
                                        <li><span style="color: red; font-weight: bold;">Đột biến: </span><c:if test="${birdDetail.getFatherBird().isMutation()}">Có</c:if><span>Không</span></li>
                                        <li><span style="color: red; font-weight: bold;">Tuổi: </span>${birdDetail.getFatherBird().getAge()}</li>
                                        <li><span style="color: red; font-weight: bold;">Thành tích thi đấu: </span>${birdDetail.getFatherBird().getAchievement()}</li>
                                        <li><span style="color: red; font-weight: bold;">Lịch sử sinh sản: </span>${birdDetail.getFatherBird().getReproductiveHistory()}</li>
                                        <li><span style="color: red; font-weight: bold;">Mô tả: </span>${birdDetail.getFatherBird().getShortDescription()}</li>
                                    </ul>
                                </div>
                                <div class="col-lg-6">
                                    <h5 class="text-center text-danger">Chim Mẹ</h5>
                                    <img style="display: block; margin: 0 auto;height: 200px" class="w-50 text-center" src="${birdDetail.getMotherBird().getImageURL()}" alt="${birdDetail.getMotherBird().getName()}">
                                    <h5 class="text-center mt-3">${birdDetail.getMotherBird().getName()}</h5>
                                    <ul style="list-style-type: none; font-size: 18px">
                                        <li><span style="color: red; font-weight: bold;">Đột biến: </span><c:if test="${birdDetail.getMotherBird().isMutation()}">Có</c:if>Không</li>
                                        <li><span style="color: red; font-weight: bold;">Tuổi: </span>${birdDetail.getMotherBird().getAge()}</li>
                                        <li><span style="color: red; font-weight: bold;">Thành tích thi đấu: </span>${birdDetail.getMotherBird().getAchievement()}</li>
                                        <li><span style="color: red; font-weight: bold;">Lịch sử sinh sản: </span>${birdDetail.getMotherBird().getReproductiveHistory()}</li>
                                        <li><span style="color: red; font-weight: bold;">Mô tả: </span>${birdDetail.getMotherBird().getShortDescription()}</li>
                                    </ul>
                                </div>
                            </div>
                        </c:if>
                </div>
                <hr style="border-top: 2px solid; opacity: 1; margin: 15px 0 0 0"/>
            </div>
        </div>
    </section>
    <!-- Related Product Section Begin -->
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="d-flex justify-content-center align-items-center col-lg-12">
                    <div class="section-title related__product__title">
                        <h2 class="fw-bold">Các chim khác</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div style="width: 100%; height: 300px; background-size: cover; border-radius: 3px;" class="product__item__pic set-bg" data-setbg="${birdRelated1.getImageURL()}">
                            <ul class="product__item__pic__hover">
                                <li><a href="DispatchServlet?btAction=View More&id=${birdRelated1.getIdBird()}&userID=${user.getIdUser()}"><i class="fas fa-eye"></i></a></li>
                                <li>
                                    <c:if test="${user ne null}">
                                        <form class="myForm" action="DispatchServlet">
                                            <input id="userID" type="hidden" name="userID" value="${user.getIdUser()}" />
                                            <input id="birdID" type="hidden" name="birdID" value="${birdRelated1.getIdBird()}" />
                                            <input id="birdName" type="hidden" name="birdName" value="${birdRelated1.getName()}" />
                                            <input id="birdQuantity" type="hidden" name="birdQuantity" value="1" />
                                            <input class="AddToCart" style="display:none" type="submit" name="btAction" value="Thêm Vào Giỏ Hàng" class="primary-btn" />
                                        </form>
                                        <a class="myLink" href="#"><i class="fa fa-shopping-cart"></i></a>
                                        </c:if>
                                        <c:if test="${user eq null}">
                                        <a href="Login.jsp" style="color:#7fad39; cursor: pointer; border: 1px solid #7fad39; padding: 15px 28px 15px;" class="text-decoration-none primary-btn bg-white">
                                            <i class="fa-solid fa-cart-shopping" style="color: #7fad39;"></i>
                                            <a href="Login.jsp"><i class="fa fa-shopping-cart"></i></a>
                                        </a>
                                    </c:if>
                                </li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a class="text-decoration-none" href="DispatchServlet?btAction=View More&id=${birdRelated1.getIdBird()}&userID=${user.getIdUser()}">${birdRelated1.getName()}</a></h6>
                                <fmt:formatNumber var="formattedNumberRelated1" value="${birdRelated1.salePrice}"  />
                            <h5>${formattedNumberRelated1} VND</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div style="width: 100%; height: 300px; background-size: cover; border-radius: 3px;" class="product__item__pic set-bg" data-setbg="${birdRelated2.getImageURL()}">
                            <ul class="product__item__pic__hover">
                                <li><a href="DispatchServlet?btAction=View More&id=${birdRelated2.getIdBird()}&userID=${user.getIdUser()}"><i class="fas fa-eye"></i></a></li>
                                <li>
                                     <c:if test="${user ne null}">
                                        <form id="myForm" action="DispatchServlet">
                                            <input id="userID" type="hidden" name="userID" value="${user.getIdUser()}" />
                                            <input id="birdID" type="hidden" name="birdID" value="${birdRelated2.getIdBird()}" />
                                            <input id="birdName" type="hidden" name="birdName" value="${birdRelated2.getName()}" />
                                            <input id="birdQuantity" type="hidden" name="birdQuantity" value="1" />
                                            <input class="AddToCart" style="display:none" type="submit" name="btAction" value="Thêm Vào Giỏ Hàng" class="primary-btn" />
                                        </form>
                                        <a class="myLink" href="#"><i class="fa fa-shopping-cart"></i></a>
                                        </c:if>
                                        <c:if test="${user eq null}">
                                        <a href="Login.jsp" style="color:#7fad39; cursor: pointer; border: 1px solid #7fad39; padding: 15px 28px 15px;" class="text-decoration-none primary-btn bg-white">
                                            <i class="fa-solid fa-cart-shopping" style="color: #7fad39;"></i>
                                            <a href="Login.jsp"><i class="fa fa-shopping-cart"></i></a>
                                        </a>
                                    </c:if>
                                </li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a class="text-decoration-none" href="DispatchServlet?btAction=View More&id=${birdRelated2.getIdBird()}&userID=${user.getIdUser()}">${birdRelated2.getName()}</a></h6>
                                <fmt:formatNumber var="formattedNumberRelated2" value="${birdRelated2.salePrice}"  />
                            <h5>${formattedNumberRelated2} VND</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div style="width: 100%; height: 300px; background-size: cover; border-radius: 3px;" class="product__item__pic set-bg" data-setbg="${birdRelated3.getImageURL()}">
                            <ul class="product__item__pic__hover">
                                <li><a href="DispatchServlet?btAction=View More&id=${birdRelated3.getIdBird()}&userID=${user.getIdUser()}"><i class="fas fa-eye"></i></a></li>
                                <li>
                                    <c:if test="${user ne null}">
                                        <form id="myForm" action="DispatchServlet">
                                            <input id="userID" type="hidden" name="userID" value="${user.getIdUser()}" />
                                            <input id="birdID" type="hidden" name="birdID" value="${birdRelated3.getIdBird()}" />
                                            <input id="birdName" type="hidden" name="birdName" value="${birdRelated3.getName()}" />
                                            <input id="birdQuantity" type="hidden" name="birdQuantity" value="1" />
                                            <input class="AddToCart" style="display:none" type="submit" name="btAction" value="Thêm Vào Giỏ Hàng" class="primary-btn" />
                                        </form>
                                        <a class="myLink" href="#"><i class="fa fa-shopping-cart"></i></a>
                                        </c:if>
                                        <c:if test="${user eq null}">
                                        <a href="Login.jsp" style="color:#7fad39; cursor: pointer; border: 1px solid #7fad39; padding: 15px 28px 15px;" class="text-decoration-none primary-btn bg-white">
                                            <i class="fa-solid fa-cart-shopping" style="color: #7fad39;"></i>
                                            <a href="Login.jsp"><i class="fa fa-shopping-cart"></i></a>
                                        </a>
                                    </c:if>
                                </li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a class="text-decoration-none">${birdRelated3.getName()}</a></h6>
                                <fmt:formatNumber var="formattedNumberRelated3" value="${birdRelated3.salePrice}"  />
                            <h5>${formattedNumberRelated3} VND</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div style="width: 100%; height: 300px; background-size: cover; border-radius: 3px;" class="product__item__pic set-bg" data-setbg="${birdRelated4.getImageURL()}">
                            <ul class="product__item__pic__hover">
                                <li><a href="DispatchServlet?btAction=View More&id=${birdRelated4.getIdBird()}&userID=${user.getIdUser()}"><i class="fas fa-eye"></i></a></li>
                                <li>
                                    <c:if test="${user ne null}">
                                        <form id="myForm" action="DispatchServlet">
                                            <input id="userID" type="hidden" name="userID" value="${user.getIdUser()}" />
                                            <input id="birdID" type="hidden" name="birdID" value="${birdRelated4.getIdBird()}" />
                                            <input id="birdName" type="hidden" name="birdName" value="${birdRelated4.getName()}" />
                                            <input id="birdQuantity" type="hidden" name="birdQuantity" value="1" />
                                            <input class="AddToCart" style="display:none" type="submit" name="btAction" value="Thêm Vào Giỏ Hàng" class="primary-btn" />
                                        </form>
                                        <a class="myLink" href="#"><i class="fa fa-shopping-cart"></i></a>
                                        </c:if>
                                        <c:if test="${user eq null}">
                                        <a href="Login.jsp" style="color:#7fad39; cursor: pointer; border: 1px solid #7fad39; padding: 15px 28px 15px;" class="text-decoration-none primary-btn bg-white">
                                            <i class="fa-solid fa-cart-shopping" style="color: #7fad39;"></i>
                                            <a href="Login.jsp"><i class="fa fa-shopping-cart"></i></a>
                                        </a>
                                    </c:if>
                                </li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a class="text-decoration-none">${birdRelated4.getName()}</a></h6>
                                <fmt:formatNumber var="formattedNumberRelated4" value="${birdRelated4.salePrice}"  />
                            <h5>${formattedNumberRelated4} VND</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Related Product Section End -->

    <!-- Footer Section Begin -->
    <%@include file="components/footerComponent.jsp" %>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>

    <!-- Bootstrap core JS-->
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
    <script src="js/bird-slide-img.js"></script>
    <script src="js/scripts.js"></script>
    <script src="js/main.js"></script>
    <script src="js/load-more.js"></script>
    <script src="vendor/slick/slick.min.js"></script>
    <script src="js/slick-custom.js"></script>
    <script src="vendor/animsition/js/animsition.min.js"></script>
    <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="js/compare.js"></script>
    <script>

                                        // Lấy các phần tử liên quan
                                        var quantityInput = document.querySelector("#quantityInput");
                                        var incrementButton = document.querySelector(".btn-plus");
                                        var decrementButton = document.querySelector(".btn-minus");
                                        var minValue = parseInt(quantityInput.getAttribute("min"));
                                        var maxValue = parseInt(quantityInput.getAttribute("max"));
                                        var copyValue = document.getElementById("birdQuantity");
                                        // Hàm tăng giá trị
                                        function incrementQuantity() {
                                            var value = parseInt(quantityInput.value);
                                            if (isNaN(value) || value < 1) {
                                                quantityInput.value = 1;
                                            } else if (value < maxValue) {
                                                quantityInput.value = value + 1;
                                            } else {
                                                quantityInput.value = maxValue;
                                            }
                                            copyValue.value = quantityInput.value;
                                        }

                                        // Hàm giảm giá trị
                                        function decrementQuantity() {
                                            var value = parseInt(quantityInput.value);
                                            if (isNaN(value) || value < 1) {
                                                quantityInput.value = 1;
                                            } else if (value > minValue) {
                                                quantityInput.value = value - 1;
                                            } else {
                                                quantityInput.value = minValue;
                                            }
                                            copyValue.value = quantityInput.value;
                                        }
                                        
                                        
                                       const myLinks = document.getElementsByClassName('myLink');
                                        const submitButtons = document.getElementsByClassName('AddToCart');
                                        const products = []; // Mảng lưu trữ thông tin về các sản phẩm

                                        for (let i = 0; i < myLinks.length; i++) {
                                          const myLink = myLinks[i];
                                          const submitButton = submitButtons[i];

                                          myLink.addEventListener('click', function(event) {
                                            event.preventDefault(); // Ngăn chặn hành vi mặc định khi click vào liên kết
                                            submitButton.click(); // Kích hoạt sự kiện submit
                                          });

                                          // Thêm thông tin về sản phẩm vào mảng products
                                          const removeItem = myLink.getAttribute("data-idRemove");
                                          const userIDValue = document.getElementById('userID').value;
                                          products.push({
                                            removeItem: removeItem,
                                            userIDValue: userIDValue
                                          });
                                        }
                                        
                                        function RemoveItemFromCart(element) {
                                            var removeItem = element.getAttribute("data-idRemove");
                                            var userIDValue = document.getElementById('userID').value;
                                            $.ajax({
                                               url: "/HomePage/RemoveItemFromCart",
                                               type: "get",  // send it through get method
                                               data: {
                                                   idRemove: removeItem,
                                                   userID: userIDValue
                                               },
                                               success: function (data) {
                                                   const  returnUrl = "http://localhost:8084/HomePage/DispatchServlet?btAction=View%20More&id="+removeItem+"&userID="+userIDValue;
                                                    var buttonCart = document.getElementById("cart-content");
                                                    buttonCart.innerHTML = data;
                                                    window.location.href = returnUrl;
                                               },
                                               error: function(data) {
                                                  console.log(data);
                                                }
                                            });
                                        }
    </script>
</body>

</html>