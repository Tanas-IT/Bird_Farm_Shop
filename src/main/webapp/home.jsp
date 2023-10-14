<%-- 
    Document   : home
    Created on : Oct 5, 2023, 10:42:24 PM
    Author     : ASUS
--%>

<%@page import="birdfarm.dto.UserDTO"%>
<%@page import="birdfarm.dto.BirdFeedbackDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.DecimalFormat"%>
<%@page import="birdfarm.dto.BirdDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
    </head>
    <body>
        <%
            ArrayList<BirdDTO> listPremiumBird = (ArrayList<BirdDTO>) request.getAttribute("listPremiumBird");
            ArrayList<BirdDTO> listBirdsInLots = (ArrayList<BirdDTO>) request.getAttribute("listBirdsInLots");
            ArrayList<BirdDTO> listBirdNest = (ArrayList<BirdDTO>) request.getAttribute("listBirdNest");
            ArrayList<BirdDTO> listBirdBestSeller = (ArrayList<BirdDTO>) request.getAttribute("listBirdBestSeller");
            ArrayList<BirdFeedbackDTO> listBirdFeedback = (ArrayList<BirdFeedbackDTO>) request.getAttribute("listBirdFeedback");
            UserDTO user = (UserDTO) request.getAttribute("user");
        %>
        <style>
            .btn-minus:hover, .btn-plus:hover {
                cursor: pointer;
            }
            .container-feedback {
                display: flex !important;
            }
            .btn-compare {
                display: block;
                margin-left: 1.5rem;
                margin-bottom: 1rem;
                cursor: pointer;
            }

            @media (max-width: 1024px) {
                .container-feedback {
                    display: block !important;
                    margin-top: 10px;
                }
            }
        </style>
        <!--Common Menu-->
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
                            <a id="about-link" class="nav-link" href="about.jsp?userID=<%= user.getIdUser()%>" onclick="handleButtonClick(this)">
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
<!--                            <span class="input-group-append">
                                <button type="submit" style="z-index: 10" for="example-search-input" class="btn-search btn btn-outline-secondary border-bottom-0 border rounded-pill ms-n5">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>-->
                        </form>
                    </div>
                    <form action="DispatchServlet">
                        <input type="hidden" name="userID" value="<%= user.getIdUser().trim()%>" />
                        <button class="cart btn btn-outline-dark" type="submit" name="btAction" value="Xem giỏ hàng">
                            <i class="fa-solid fa-cart-shopping"></i>
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
                    <div>
                        <img style="width: 16px; height: 16px; background-size: cover" src="https://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png">
                        <p style="display:inline; font-weight: 500;">Chào <%=user.getFullName()%></p>
                    </div>
                    <form action="Login.jsp">
                        <button style="margin-left: 10px;" type="submit" class="btn-register btn btn-danger">
                            Đăng xuất
                        </button>
                    </form>
                </div>
            </div>

        </nav>

        <!--Menu Category-->
        <%@include file="components/menuCategory.jsp" %>
        <!--HomePage Slider-->
        <%@include file="components/sliderComponent.jsp" %>
        <section id="content" class="py-5">
            <div style="max-width: 1920px !important;" class="container px-4 px-lg-5 w-100">
                <div style="display: flex; justify-content: space-between">
                    <h2 class="title-category">Chim Cao Cấp</h2>
                    <button class="bg-white" onclick="viewAll(this)" value="<%= listPremiumBird.get(0).getType() %>" style="border: none;color: #7DB32B; text-decoration: none; font-size: 20px; font-weight: bold;">Xem tất cả<i class="fa-solid fa-arrow-right" style="color: #7db32b; margin-left: 10px"></i></button>
                </div>
                <div class="row-item row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-5 justify-content-center align-items-center w-100">
                    <% for (BirdDTO birdPremium : listPremiumBird) {%>
                    <div  id="<%= birdPremium.getIdBird()%>" class="col mb-5">
                        <div style="overflow: hidden; max-height: 100%;" class="card h-100">
                            <!-- Product image-->
                            <img id="img-<%= birdPremium.getIdBird()%>" style="width: 100%; height: 300px; background-size: cover; border-top-left-radius: 3px; border-top-right-radius: 3px" class="card-img-top" src="<%=birdPremium.getImageURL()%>" alt="<%=birdPremium.getName()%>" />
                            <!-- Product details-->
                            <div class="card-body p-2">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h6 id="name-<%= birdPremium.getIdBird()%>" class="text-center fw-bolder"><%=birdPremium.getName()%></h6>
                                    <!-- Product reviews-->
                                    <div style="font-size: 16px; color:#bb9d05;" class="d-flex justify-content-center mb-2">
                                        Giới tính: <%= birdPremium.getGender()%>
                                    </div>
                                    <% if (birdPremium.isMutation()) { %>
                                    <div class="d-flex justify-content-center text-black mb-2">
                                        Đột biến: Có 
                                    </div>
                                    <%}%>
                                    <div class="d-flex justify-content-center text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <%
                                        DecimalFormat decimalFormat = new DecimalFormat("###,###");
                                        String formattedNumber = decimalFormat.format(birdPremium.getSalePrice());
                                    %> 
                                    <h6 style="color:red;">Giá: <%= formattedNumber + " VND"%></h6>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="product-actions justify-content-between card-footer p-4 pb-2 pt-0 border-top-0 bg-transparent">
                                <div class="btn-add">
                                    <form action="DispatchServlet">
                                        <input type="hidden" name="userID" value="<%= user.getIdUser().trim()%>" />
                                        <input type="hidden" name="birdID" value="<%= birdPremium.getIdBird()%>" />
                                        <input type="hidden" name="birdName" value="<%= birdPremium.getName()%>" />
                                        <input type="hidden" name="birdQuantity" value="<%= birdPremium.getQuantity()%>" />
                                        <input type="hidden" name="birdPrice" value="<%= birdPremium.getSalePrice()%>" />
                                        <input type="hidden" name="birdImage" value="<%= birdPremium.getImageURL()%>" />
                                        <input type="submit" name="btAction" value = "Mua ngay" class="btn-addCart btn-item btn btn-outline-dark mt-auto"/>
                                    </form>
                                </div>
                                <div><a class="btn-viewMore btn-item btn btn-outline-dark mt-auto" href="DispatchServlet?btAction=View More&id=<%=birdPremium.getIdBird()%>&userID=<%= user.getIdUser() %>">Xem thêm</a></div>
                            </div>
                            <a href="#" id="btn-compare_<%=birdPremium.getIdBird()%>" class="text-decoration-none btn-compare text-primary" onclick="compare('<%= birdPremium.getIdBird()%>', '<%= birdPremium.getType()%>')">
                                <i class="text-primary bi bi-plus-circle"></i>
                                So sánh
                            </a>
                        </div>
                    </div>
                    <% } %>
                </div>
                <div style="display: flex; justify-content: space-between">
                    <h2 class="title-category">Tổ Chim</h2>
                    <button class="bg-white" onclick="viewAll(this)" value="<%= listBirdNest.get(0).getType() %>" style="border: none;color: #7DB32B; text-decoration: none; font-size: 20px; font-weight: bold;">Xem tất cả<i class="fa-solid fa-arrow-right" style="color: #7db32b; margin-left: 10px"></i></button>
                </div>
                <div class="row-item row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-5 justify-content-center align-items-center w-100">
                    <% for (BirdDTO birdNest : listBirdNest) {%>
                    <div id="<%= birdNest.getIdBird()%>" class="col mb-5">
                        <div style="overflow: hidden; max-height: 100%;" class="card h-100">
                            <% if (birdNest.getSalePrice() > 500000) { %>
                            <!-- Sale badge-->
                            <div class="badge text-white position-absolute" style="font-size: 15px; background-color:#7DB32B; top: 0.5rem; right: 0.5rem">Sale</div>
                            <%}%>
                            <!-- Product image-->
                            <img id="img-<%= birdNest.getIdBird()%>" style="width: 100%; height: 300px; background-size: cover; border-top-left-radius: 3px; border-top-right-radius: 3px" class="card-img-top" src="<%=birdNest.getImageURL()%>" alt="<%=birdNest.getName()%>" />
                            <!-- Product details-->
                            <div class="card-body p-2">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h6 id="name-<%= birdNest.getIdBird()%>" class="fw-bolder"><%=birdNest.getName()%></h6>
                                    <!-- Product reviews-->
                                    <div style="color: #bb9d05;" class="d-flex justify-content-center fs-18 mb-2">
                                        Chim non
                                    </div>
                                    <% if (birdNest.isMutation()) { %>
                                    <div class="d-flex justify-content-center text-black mb-2">
                                        Đột biến: Có 
                                    </div>
                                    <%}%>
                                    <div class="d-flex justify-content-center text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <%
                                        DecimalFormat decimalFormat = new DecimalFormat("###,###");
                                        String formattedNumber = decimalFormat.format(birdNest.getSalePrice());
                                        String saleNumber = decimalFormat.format(birdNest.getSalePrice() + birdNest.getSalePrice() * 0.1);
                                    %> 
                                    <h6 style="color:red;">
                                        Giá: <% if (birdNest.getSalePrice() > 500000) {%><span class="text-muted text-decoration-line-through"><%= saleNumber%></span> <%}%>
                                        <span><%= formattedNumber + " VND"%></span>
                                    </h6>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="product-actions justify-content-between card-footer p-4 pb-2 pt-0 border-top-0 bg-transparent">
                                <div class="btn-add">
                                    <form action="DispatchServlet">
                                        <input type="hidden" name="userID" value="<%= user.getIdUser()%>" />
                                        <input type="hidden" name="birdID" value="<%= birdNest.getIdBird()%>" />
                                        <input type="hidden" name="birdName" value="<%= birdNest.getName()%>" />
                                        <input type="hidden" name="birdQuantity" value="<%= birdNest.getQuantity()%>" />
                                        <input type="hidden" name="birdPrice" value="<%= birdNest.getSalePrice()%>" />
                                        <input type="hidden" name="birdImage" value="<%= birdNest.getImageURL()%>" />
                                        <input type="submit" name="btAction" value = "Add to Cart" class="btn-addCart btn-item btn btn-outline-dark mt-auto"/>
                                    </form>
                                </div>
                                <div><a class="btn-viewMore btn-item btn btn-outline-dark mt-auto" href="DispatchServlet?btAction=View More&id=<%=birdNest.getIdBird()%>&userID=<%= user.getIdUser() %>">Xem thêm</a></div>
                            </div>
                            <a href="#" id="btn-compare_<%=birdNest.getIdBird()%>" class="text-decoration-none btn-compare text-primary" onclick="compare('<%= birdNest.getIdBird()%>', '<%= birdNest.getType()%>')">
                                <i class="text-primary bi bi-plus-circle"></i>
                                So sánh
                            </a>
                        </div>
                    </div>
                    <% } %>
                </div>

                <div style="display: flex; justify-content: space-between">
                    <h2 class="title-category">Chim Phổ Thông</h2>
                    <button class="bg-white" onclick="viewAll(this)" value="<%= listBirdsInLots.get(0).getType() %>" style="border: none;color: #7DB32B; text-decoration: none; font-size: 20px; font-weight: bold;">Xem tất cả<i class="fa-solid fa-arrow-right" style="color: #7db32b; margin-left: 10px"></i></button>
                </div>
                <div class="row-item row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-5 justify-content-center align-items-center w-100">
                    <% for (BirdDTO birdsInLots : listBirdsInLots) {%>
                    <div id="<%= birdsInLots.getIdBird()%>" class="col mb-5">
                        <div style="overflow: hidden; max-height: 100%;" class="card h-100">
                            <% if (birdsInLots.getSalePrice() > 500000) { %>
                            <!-- Sale badge-->
                            <div class="badge text-white position-absolute" style="font-size: 15px; background-color:#7DB32B; top: 0.5rem; right: 0.5rem">Sale</div>
                            <%}%>
                            <!-- Product image-->
                            <img id="img-<%= birdsInLots.getIdBird()%>" style="width: 100%; height: 300px; background-size: cover; border-top-left-radius: 3px; border-top-right-radius: 3px" class="card-img-resize card-img-top" src="<%=birdsInLots.getImageURL()%>" alt="<%=birdsInLots.getName()%>" />
                            <!-- Product details-->
                            <div class="card-body p-2">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h6 id="name-<%= birdsInLots.getIdBird()%>" class="fw-bolder"><%=birdsInLots.getName()%></h6>
                                    <!-- Product quantity-->
                                    <div style="color: #bb9d05;" class="d-flex justify-content-center fs-18 mb-2">
                                        <%= birdsInLots.getPeriod() %>
                                    </div>
                                    <% if (birdsInLots.isMutation()) { %>
                                    <div class="d-flex justify-content-center text-black mb-2">
                                        Đột biến: Có 
                                    </div>
                                    <%}%>
                                    <div class="d-flex justify-content-center text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <%
                                        DecimalFormat decimalFormat = new DecimalFormat("###,###");
                                        String formattedNumber = decimalFormat.format(birdsInLots.getSalePrice());
                                        String saleNumber = decimalFormat.format(birdsInLots.getSalePrice() + birdsInLots.getSalePrice() * 0.1);
                                    %> 
                                    <h6 style="color:red;">
                                        Giá: <% if (birdsInLots.getSalePrice() > 500000) {%><span class="text-muted text-decoration-line-through"><%= saleNumber%></span> <%}%>
                                        <span><%= formattedNumber + " VND/Con"%></span>
                                    </h6>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="product-actions justify-content-between card-footer p-4 pb-2 pt-0 border-top-0 bg-transparent">
                                <div class="btn-add">
                                    <form action="DispatchServlet">
                                        <input type="hidden" name="userID" value="<%= user.getIdUser()%>" />
                                        <input type="hidden" name="birdID" value="<%= birdsInLots.getIdBird()%>" />
                                        <input type="hidden" name="birdName" value="<%= birdsInLots.getName()%>" />
                                        <input type="hidden" name="birdQuantity" value="<%= birdsInLots.getQuantity()%>" />
                                        <input type="hidden" name="birdPrice" value="<%= birdsInLots.getSalePrice()%>" />
                                        <input type="hidden" name="birdImage" value="<%= birdsInLots.getImageURL()%>" />
                                        <input type="submit" name="btAction" value = "Add to Cart" class="btn-addCart btn-item btn btn-outline-dark mt-auto"/>
                                    </form>
                                </div>
                                <div><a class="btn-viewMore btn-item btn btn-outline-dark mt-auto" href="DispatchServlet?btAction=View More&id=<%=birdsInLots.getIdBird()%>&userID=<%= user.getIdUser() %>">Xem thêm</a></div>
                            </div>
                            <div class="product-actions justify-content-between card-footer p-4 pb-2 pt-0 border-top-0 bg-transparent">
                                <div class="btn-add"><a class="btn-addCart btn-item btn btn-outline-dark mt-auto" href="Login.jsp">Mua ngay</a></div>
                                <div><a class="btn-viewMore btn-item btn btn-outline-dark mt-auto" href="DispatchServlet?btAction=View More&id=<%=birdsInLots.getIdBird()%>">Xem thêm</a></div>
                            </div>
                            <a href="#" id="btn-compare_<%=birdsInLots.getIdBird()%>" class="text-decoration-none btn-compare text-primary" onclick="compare('<%= birdsInLots.getIdBird()%>', '<%= birdsInLots.getType()%>')">
                                <i class="text-primary bi bi-plus-circle"></i>
                                So sánh
                            </a>
                        </div>
                    </div>
                    <% }%>
                </div>
        </section>
        <!-- Banner 2 -->
        <%@include file="components/homeBanner2Component.jsp" %>
        <!-- Section Best Seller -->
        <section  id="content"class="py-5 text-black">
            <div style="background-color: #f3f3f3;">
                <div class="pt-3 d-flex align-items-center justify-content-center fs-1 section-title">
                    <hr class="d-inline-block me-3" width="15%" />
                    Bán Chạy Nhất
                    <hr class="d-inline-block ms-3" width="15%" />
                </div>
                <div style="margin-top: 20px;margin-left: -5px;" class="row-item row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-5 justify-content-center align-items-center w-100">
                    <% for (BirdDTO birdBestSeller : listBirdBestSeller) {%>
                    <div id="<%= birdBestSeller.getIdBird()%>" class="col mb-5">
                        <div style="background-color: #ffff;  overflow: hidden; max-height: 100%; border: 0.5px solid #d2d2d2; border-radius: 8px;" class="h-100">
                            <!-- Product image-->
                            <img id="img-<%= birdBestSeller.getIdBird()%>" style="width: 100%; height: 300px; background-size: cover; border-top-left-radius: 3px; border-top-right-radius: 3px" class="card-img-top" src="<%=birdBestSeller.getImageURL()%>" alt="<%=birdBestSeller.getName()%>" />
                            <!-- Product details-->
                            <div class="card-body p-2">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h6 id="name-<%= birdBestSeller.getIdBird()%>" class="text-center fw-bolder"><%=birdBestSeller.getName()%></h6>
                                    <!-- Product reviews-->
                                    <div style="font-size: 16px; color:#bb9d05;" class="d-flex justify-content-center mb-2">
                                        Giới tính: <%= birdBestSeller.getGender()%>
                                    </div>
                                    <% if (birdBestSeller.isMutation()) { %>
                                    <div class="d-flex justify-content-center text-black mb-2">
                                        Đột biến: Có 
                                    </div>
                                    <%}%>
                                    <div class="d-flex justify-content-center text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <%
                                        DecimalFormat decimalFormat = new DecimalFormat("###,###");
                                        String formattedNumber = decimalFormat.format(birdBestSeller.getSalePrice());
                                    %> 
                                    <h6 style="color:red;">Giá: <%= formattedNumber + " VND"%></h6>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="product-actions justify-content-between card-footer p-4 pb-2 pt-0 border-top-0 bg-transparent">
                                <div class="btn-add">
                                    <form action="DispatchServlet">
                                        <input type="hidden" name="userID" value="<%= user.getIdUser()%>" />
                                        <input type="hidden" name="birdID" value="<%= birdBestSeller.getIdBird()%>" />
                                        <input type="hidden" name="birdName" value="<%= birdBestSeller.getName()%>" />
                                        <input type="hidden" name="birdQuantity" value="<%= birdBestSeller.getQuantity()%>" />
                                        <input type="hidden" name="birdPrice" value="<%= birdBestSeller.getSalePrice()%>" />
                                        <input type="hidden" name="birdImage" value="<%= birdBestSeller.getImageURL()%>" />
                                        <input type="submit" name="btAction" value = "Add to Cart" class="btn-addCart btn-item btn btn-outline-dark mt-auto"/>
                                    </form>
                                </div>
                                <div><a class="btn-viewMore btn-item btn btn-outline-dark mt-auto" href="DispatchServlet?btAction=View More&id=<%=birdBestSeller.getIdBird()%>&userID=<%= user.getIdUser() %>">Xem thêm</a></div>
                            </div>
                            <div class="product-actions justify-content-between card-footer p-4 pb-2 pt-0 border-top-0 bg-transparent">
                                <div class="btn-add"><a class="btn-addCart btn-item btn btn-outline-dark mt-auto" href="Login.jsp">Mua ngay</a></div>
                                <div><a class="btn-viewMore btn-item btn btn-outline-dark mt-auto" href="DispatchServlet?btAction=View More&id=<%=birdBestSeller.getIdBird()%>">Xem thêm</a></div>
                            </div>
                            <a href="#" id="btn-compare_<%=birdBestSeller.getIdBird()%>" class="text-decoration-none btn-compare text-primary" onclick="compare('<%= birdBestSeller.getIdBird()%>', '<%= birdBestSeller.getType()%>')">
                                <i class="text-primary bi bi-plus-circle"></i>
                                So sánh
                            </a>
                        </div>
                    </div>
                    <% } %>
                </div>
        </section>
        <section class="client_section text-black">
            <div class="container">
                <div class="heading_container justify-content-center">
                    <div class="text-danger d-flex align-items-center justify-content-center fs-1 section-title pt-5">
                        <hr class="d-inline-block me-3" width="5%" />
                        Khách hàng của chúng tôi nói gì
                        <hr class="d-inline-block ms-3" width="5%" />
                    </div>
                    <!--            <div class="section_number">
                                    04
                                </div>-->
                </div>
            </div>
            <div class="container">
                <div class="container-feedback">
                    <% for (BirdFeedbackDTO birdFeedback : listBirdFeedback) {
                    %> 
                    <div style="margin-top:30px; margin-right: 20px;" class="col-md-6">
                        <div class="client_box">
                            <div class="detail_box">
                                <div class="img_box">
                                    <img style="height: 94px;" src="https://cdn.icon-icons.com/icons2/2468/PNG/512/user_icon_149329.png">
                                </div>
                                <h5>
                                    <%= birdFeedback.getUserFullName()%> - <i><%= birdFeedback.getCreateDate()%></i> - <b><%=birdFeedback.getBirdName()%></b>
                                </h5>
                                <p style="text-indent: 40px">- <%= birdFeedback.getContent()%></p>
                            </div>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
        </section>
        <!-- Subscribe News Letter -->
        <%@include file="components/subscribeNewsLetterComponent.jsp" %>
        <!-- Footer -->
        <%@include file="components/footerComponent.jsp" %>
        <div class="stickCompare">
            <label class="error" style="display: none">Bạn đã chọn sản phẩm này rồi, vui lòng chọn sản phẩm khác!</label>
            <a href="javascript:;" onclick="clearCompare(event);" class="clearall">Thu gọn <i class="fa-solid fa-chevron-down" style="color: #000000;"></i></a>
            <ul class="listcompare" data-catename="Điện thoại">
                <li id="" class="formsg">
                    <a href="javascript:" class="cp-plus cp-plus_new" onclick="OpenPopup(this)">
                        <i class="icImageCompareNew"></i>
                        <p>Thêm sản phẩm</p>
                    </a>
                </li>
                <li class="formsg">
                    <a href="javascript:" class="cp-plus cp-plus_new" onclick="OpenPopup(this)">
                        <i class="icImageCompareNew"></i>
                        <p>Thêm sản phẩm</p>
                    </a>
                </li>
            </ul>
            <div class="closecompare">
                <form action="DispatchServlet">
                    <input id="birdID1" type="hidden" name="birdID1" value=""/>
                    <input id="birdID2" type="hidden" name="birdID2" value=""/>
                    <input style="border:none;" class="doss prevent" type="submit" name="btAction" value="So sánh ngay">
                </form>
                <a href="javascript:;" onclick="RemoveAllIdCompare()" class="txtremoveall">
                    Xóa tất cả sản phẩm
                </a>
            </div>
        </div>
        <div class="popup-button">
            <a class="text-decoration-none" href="javascript:;" onclick="showCompare()" id="ss-now" style="display: inline;">
                <i class="fas fa-exchange-alt" style="color: #3181ed;"></i>
                <span>So sánh</span>
            </a>
        </div>
        <div id="notification"></div>
        <!-- Back to top -->
        <div class="btn-back-to-top" id="myBtn">
            <span class="symbol-btn-back-to-top">
                <i class="fa-solid fa-angle-up" style="color: #ffffff;"></i>
            </span>
        </div>
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
        <script src="js/scripts.js"></script>
        <script src="js/main.js"></script>
        <script src="js/load-more.js"></script>
        <script src="vendor/slick/slick.min.js"></script>
        <script src="js/slick-custom.js"></script>
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="js/compare.js"></script>
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
                var initialContent = document.getElementById("content").innerHTML;
                function resetInterface() {
                    var parentElement = document.getElementById("content");

                    // Xóa tất cả các phần tử con trong phần tử cha
                    while (parentElement.firstChild) {
                        parentElement.removeChild(parentElement.firstChild);
                    }

                    // Khôi phục giao diện ban đầu
                    parentElement.innerHTML = initialContent;
                    $('.row-item').slick({
                    infinite: true,
                    slidesToShow: 5,
                    slidesToScroll: 1,
                    arrows: true,
                    prevArrow:"<button type='button' class='slick-prev pull-left slick-arrow'><i class='fa fa-angle-left' aria-hidden='true'></i></button>",
                    nextArrow:"<button type='button' class='slick-next pull-right slick-arrow'><i class='fa fa-angle-right' aria-hidden='true'></i></button>",
                    responsive: [
                        {
                            breakpoint: 1024,
                            settings: {
                              slidesToShow: 3,
                              slidesToScroll: 1,
                              infinite: true,
                            }
                        },
                        {
                            breakpoint: 768,
                            settings: {
                              slidesToScroll: 1,
                              slidesToShow: 3
                            }
                          },
                        {
                            breakpoint: 480,
                            settings: {
                              slidesToShow: 1,
                              slidesToScroll: 1,
                              infinite: false,
                            }
                        },

                    ]
                });
                }
                function searchByName(param) {
                    var txtSearch = param.value;
                    $.ajax({
                       url: "/HomePage/BirdSearchServlet",
                       type: "get",  // send it through get method
                       data: {
                           txtSearchBird: txtSearch
                       },
                       success: function (data) {
                           if (txtSearch.trim() === "") {
                                resetInterface();
                           } else {
                                var row = document.getElementById("content");
                                row.innerHTML = data;
                           }
                       },
                       error: function(data) {
                          console.log(data);
                        }
                    });
                }
                function viewAll(typeParam) {
                    var typeOfBird = typeParam.value;
                     $.ajax({
                       url: "/HomePage/ViewAllBirdServlet",
                       type: "get",  // send it through get method
                       data: {
                           idType: typeOfBird,
                       },
                       success: function (data) {
                           if (typeOfBird < 0) {
                                resetInterface();
                           } else {
                                var row = document.getElementById("content");
                                row.innerHTML = data;
                           }
                       },
                       error: function(data) {
                           console.log(data);
                        }
                    });
                }
        </script>
    </body>
</html>


