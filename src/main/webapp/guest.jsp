<%-- 
    Document   : guest
    Created on : Sep 27, 2023, 3:01:26 PM
    Author     : ASUS
--%>

<%@page import="birdfarm.dto.BirdTypeDTO"%>
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
            .sidebar {
                right: -30%;
                width: 450px;
                background-color: #fff;
                z-index: 10000;
                position: fixed;
                top: 0;
                height: 100%;
                transition: all 1s ease;
            }
            .sidebar ul {
                list-style-type: none;
            }
            .sidebar #navigate {
                background-color: #7DB32B;
            }
            .sidebar #navigate header  h4 {
                margin: 35px 15px 15px 30px;
                text-align: center;
                transform: translateY(-32px);
                color: #fff;
                line-height: 70px;
                font-size: 26px;
                user-select: none;
            }
            .sidebar ul {
                padding-right: 2rem;
            }
            .sidebar ul h5 {
                display: block;
                height: 100%;
                line-height: 65px;
                font-size: 20px;
                box-sizing: border-box;
            }
            #btn-checkFilter {
                display: none;
            }
            label #btn-cancel {
                position: absolute;
                cursor: pointer;
                right: 30px;
                top: 17px;
                font-size: 30px;
                font-weight: bold;
                color: #fff;
                padding: 10px;
                z-index: 100001;
            }
            #btn-reset {
                margin-top: 30px;
                width: 141px;
                text-align: center;
                height: 42px;
                border-radius: 10px;
                border: 2px solid rgb(182 182 182/1);
            }
            #btn-reset a {
                display: block;
                padding: 3px;
                font-size: 20px;
                text-decoration: none;
                color: rgb(182 182 182/1);
            }
            #btn-apply {
                margin-top: 30px;
                width: 141px;
                text-align: center;
                height: 42px;
                border-radius: 10px;
                background-color: #7db32b
            }
            #btn-apply a {
                display: block;
                padding: 7px;
                font-size: 18px;
                text-decoration: none;
                color: #fff;
                font-weight: bold;
            }
            .slick-track {
                margin-left:0;
            }
            @media (max-width: 1024px) {
                .container-feedback {
                    display: block !important;
                    margin-top: 10px;
                }
            }
        </style>
        <%
            ArrayList<BirdDTO> listPremiumBird = (ArrayList<BirdDTO>) request.getAttribute("listPremiumBird");
            ArrayList<BirdDTO> listBirdsInLots = (ArrayList<BirdDTO>) request.getAttribute("listBirdsInLots");
            ArrayList<BirdDTO> listBirdNest = (ArrayList<BirdDTO>) request.getAttribute("listBirdNest");
            ArrayList<BirdDTO> listBirdBestSeller = (ArrayList<BirdDTO>) request.getAttribute("listBirdBestSeller");
            ArrayList<BirdFeedbackDTO> listBirdFeedback = (ArrayList<BirdFeedbackDTO>) request.getAttribute("listBirdFeedback");
            ArrayList<BirdTypeDTO> listBirdType = (ArrayList<BirdTypeDTO>) request.getAttribute("listBirdType");
        %>
        <!--Common Menu-->
        <nav style="background-color:#f3e4e4 !important; position:fixed; width: 100%; z-index: 100; padding-bottom: 0; cursor: pointer;" class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container container-header px-4 px-lg-5">
                <a style="margin: 0" class="navbar-brand" href="DispatchServlet">
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
                            <a id="about-link" class="nav-link" href="about.jsp" onclick="handleButtonClick(this)">
                                <h5 class="background-hover">Về chúng tôi</h5>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a id="about-link" class="nav-link" href="Login.jsp" onclick="handleButtonClick(this)">
                                <h5 class="background-hover">Ghép cặp</h5>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Login.jsp" role="button" aria-expanded="false" onclick="handleButtonClick(this)">
                                <h5 class="background-hover">Hàng đã mua</h5>
                            </a>
                        </li>
                    </ul>
                    <div class=" input-group input-button">
                        <form class="w-100" action="DispatchServlet">
                            <input oninput="searchByName(this)" name="txtSearchBird" class="form-control border-end-0 border rounded-pill" type="text" placeholder="search" id="example-search-input">
                        </form>
                    </div>
                    <form action="Login.jsp">
                        <button class="cart btn btn-outline-dark" type="submit">
                            <i class="fa-solid fa-cart-shopping"></i>
                            Giỏ hàng
                            <span class="badge bg-warning text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>
                    <form action="Login.jsp">
                        <button type="submit" class="btn-login btn btn-primary">
                            Đăng nhập
                        </button>
                    </form>
                    <form action="Register.jsp">
                        <button type="submit" class="btn-register btn btn-danger">
                            Đăng kí
                        </button>
                    </form>
                </div>
            </div>

        </nav>
        <!--Menu Category-->
        <%@include file="components/menuCategory.jsp" %>
         <div class="sidebar fixed">
            <div id="navigate">
                <input type="checkbox" id="btn-checkFilter" onchange="checkFilter()">
                <label for="btn-checkFilter">
                    <i class ="fas fa-times" id="btn-cancel"></i>
                </label>
                <header><h4>Sắp xếp</h4></header>
            </div>
            
            <ul>
                <h5 >Theo giá tiền</h5>
                <li>
                    <select class="form-control" id="selectItemPrice" name="selectItemPrice">
                        <option value="0">Chọn....</option>
                        <option value="Từ thấp đến cao">Từ thấp đến cao</option>
                        <option value="Từ cao đến thấp">Từ cao đến thấp</option>
                    </select>
                </li>
                <h5 >Theo loài chim</h5>
                <li>
                    <select class="form-control" id="selectItemSpecies" name="selectItemSpecies">
                        <option value="0">Chọn....</option>
                         <% for(BirdTypeDTO birdType : listBirdType) {%>
                            <option value="<%= birdType.getBirdTypeName() %>"><%= birdType.getBirdTypeName() %></option>
                        <%}%>
                    </select>
                </li>
                <h5 >Theo giới tính</h5>
                <li>
                    <select class="form-control" id="selectItemGender" name="selectItemGender">
                        <option value="0">Chọn....</option>
                        <option value="Trống">Trống</option>
                        <option value="Mái">Mái</option>
                    </select>
                </li>
                <h5>Theo loại chim</h5>
                <li>
                    <select class="form-control" id="selectItemPeriod" name="selectItemPeriod">
                        <option value="0">Chọn....</option>
                        <option value="Chim non">Chim non</option>
                        <option value="Chim chuyền">Chim chuyền</option>
                        <option value="Chim trưởng thành">Chim trưởng thành</option>
                    </select>
                </li>
                <h5>Theo danh mục</h5>
                <li>
                    <select class="form-control" id="selectItemCategory" name="selectItemCategory">
                        <option value="">Chọn....</option>
                        <option value="2">Chim cao cấp</option>
                        <option value="1">Tổ chim</option>
                        <option value="0">Chim phổ thông</option>
                        <option value="4">Chim giống</option>
                    </select>
                </li>
                
            </ul>
                <div class="product-actions justify-content-between card-footer p-4 pb-2 pt-0 border-top-0 bg-transparent">
                    <div id="btn-reset"><a class="mt-auto" href="#" onclick="resetSelects()">Làm mới</a></div>
                    <div id="btn-apply">
                        <a onclick="filter()" class="mt-auto" href="#">Áp dụng</a></div>
            </div>
        </div>
        <!--HomePage Slider-->
        <%@include file="components/sliderComponent.jsp" %>
        <section id="content" class="py-5">
            <div style="max-width: 1920px !important; padding-left: 3.5rem !important" class="container px-4 w-100">
                <div id="birdPremiumId" style="display: flex; justify-content: space-between">
                    <h2 class="title-category">Chim Cao Cấp</h2>
                    <button class="bg-white" onclick="viewAll(this)" value="<%= listPremiumBird.get(0).getType() %>" style="border: none;color: #7DB32B; text-decoration: none; font-size: 20px; font-weight: bold;">Xem tất cả<i class="fa-solid fa-arrow-right" style="color: #7db32b; margin-left: 10px"></i></button>
                </div>
                <div class="row-item row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-5 align-items-center w-100">
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
                                    <%} else {%>
                                         Đột biến: Không 
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
                                <div class="btn-add"><a class="btn-addCart btn-item btn btn-outline-dark mt-auto" href="Login.jsp">Mua ngay</a></div>
                                <div><a class="btn-viewMore btn-item btn btn-outline-dark mt-auto" href="DispatchServlet?btAction=View More&id=<%=birdPremium.getIdBird()%>">Xem thêm</a></div>
                            </div>
                            <a href="#" id="btn-compare_<%=birdPremium.getIdBird()%>" class="text-decoration-none btn-compare text-primary" onclick="compare('<%= birdPremium.getIdBird()%>', '<%= birdPremium.getType()%>')">
                                <i class="text-primary bi bi-plus-circle"></i>
                                So sánh
                            </a>
                        </div>
                    </div>
                    <% } %>
                </div>
                <div id="birdNestId"  style="display: flex; justify-content: space-between">
                    <h2 class="title-category">Tổ Chim</h2>
                    <button class="bg-white" onclick="viewAll(this)" value="<%= listBirdNest.get(0).getType() %>" style="border: none;color: #7DB32B; text-decoration: none; font-size: 20px; font-weight: bold;">Xem tất cả<i class="fa-solid fa-arrow-right" style="color: #7db32b; margin-left: 10px"></i></button>
                </div>
                <div class="row-item row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-5 align-items-center w-100">
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
                                    <%} else {%>
                                         Đột biến: Không 
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
                                <div class="btn-add"><a class="btn-addCart btn-item btn btn-outline-dark mt-auto" href="Login.jsp">Mua ngay</a></div>
                                <div><a class="btn-viewMore btn-item btn btn-outline-dark mt-auto" href="DispatchServlet?btAction=View More&id=<%=birdNest.getIdBird()%>">Xem thêm</a></div>
                            </div>
                            <a href="#" id="btn-compare_<%=birdNest.getIdBird()%>" class="text-decoration-none btn-compare text-primary" onclick="compare('<%= birdNest.getIdBird()%>', '<%= birdNest.getType()%>')">
                                <i class="text-primary bi bi-plus-circle"></i>
                                So sánh
                            </a>
                        </div>
                    </div>
                    <% } %>
                </div>

                <div id="birdCommonId" style="display: flex; justify-content: space-between">
                    <h2  class="title-category">Chim Phổ Thông</h2>
                    <button class="bg-white" onclick="viewAll(this)" value="<%= listBirdsInLots.get(0).getType() %>" style="border: none;color: #7DB32B; text-decoration: none; font-size: 20px; font-weight: bold;">Xem tất cả<i class="fa-solid fa-arrow-right" style="color: #7db32b; margin-left: 10px"></i></button>
                </div>
                <div class="row-item row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-5 align-items-center w-100">
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
                                        <%= birdsInLots.getPeriod()%>
                                    </div>
                                    <% if (birdsInLots.isMutation()) { %>
                                    <div class="d-flex justify-content-center text-black mb-2">
                                        Đột biến: Có 
                                    </div>
                                    <%} else {%>
                                         Đột biến: Không 
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
        <section class="py-5 text-black">
            <div style="background-color: #f3f3f3;">
                <div class="pt-3 d-flex align-items-center justify-content-center fs-1 section-title">
                    <hr class="d-inline-block me-3" width="15%" />
                    Bán Chạy Nhất
                    <hr class="d-inline-block ms-3" width="15%" />
                </div>
                <div style="margin-top: 20px;margin-left: -5px;" class="row-item row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-5 justify-content-center align-items-center w-100">
                    <% for (BirdDTO bird : listBirdBestSeller) {%>
                    <div id="<%= bird.getIdBird()%>" class="col mb-5">
                        <div style="background-color: #ffff;  overflow: hidden; max-height: 100%; border: 0.5px solid #d2d2d2; border-radius: 8px;" class="h-100">
                            <!-- Product image-->
                            <img id="img-<%= bird.getIdBird()%>" style="width: 100%; height: 300px; background-size: cover; border-top-left-radius: 3px; border-top-right-radius: 3px" class="card-img-top" src="<%=bird.getImageURL()%>" alt="<%=bird.getName()%>" />
                            <!-- Product details-->
                            <div class="card-body p-2">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h6 id="name-<%= bird.getIdBird()%>" class="text-center fw-bolder"><%=bird.getName()%></h6>
                                    <!-- Product reviews-->
                                    <div style="font-size: 16px; color:#bb9d05;" class="d-flex justify-content-center mb-2">
                                        Giới tính: <%= bird.getGender()%>
                                    </div>
                                    <% if (bird.isMutation()) { %>
                                    <div class="d-flex justify-content-center text-black mb-2">
                                        Đột biến: Có 
                                    </div>
                                    <%} else {%>
                                         Đột biến: Không 
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
                                        String formattedNumber = decimalFormat.format(bird.getSalePrice());
                                    %> 
                                    <h6 style="color:red;">Giá: <%= formattedNumber + " VND"%></h6>
                                    <%%>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="product-actions justify-content-between card-footer p-4 pb-2 pt-0 border-top-0 bg-transparent">
                                <div class="btn-add"><a class="btn-addCart btn-item btn btn-outline-dark mt-auto" href="Login.jsp">Mua ngay</a></div>
                                <div><a class="btn-viewMore btn-item btn btn-outline-dark mt-auto" href="DispatchServlet?btAction=View More&id=<%=bird.getIdBird()%>">Xem thêm</a></div>
                            </div>
                            <a href="#" id="btn-compare_<%=bird.getIdBird()%>" class="text-decoration-none btn-compare text-primary" onclick="compare('<%= bird.getIdBird()%>', '<%= bird.getType()%>')">
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
                </div>
            </div>
            <div class="container">
                <div class="container-feedback">
                    <% int i = 0;
                        for (BirdFeedbackDTO birdFeedback : listBirdFeedback) {
                        if(i <=1) {
                    %> 
                    <div style="margin-top:30px; margin-right: 20px;" class="col-md-6">
                        <div class="client_box">
                            <div style="height: 233px;" class="detail_box">
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
                    <%}
                        i++;
                    }%>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
            function checkFilter() {
                var sidebar = document.querySelector('.sidebar');
                 sidebar.style.right = "-30%";
            }
            function openFilter() {
                var sidebar = document.querySelector('.sidebar');
                sidebar.style.right = "0";
            }
            function resetSelects() {
                 var select1 = document.getElementById('selectItemPrice');
                 var select2 = document.getElementById('selectItemSpecies');
                 var select3 = document.getElementById('selectItemGender');
                 var select4 = document.getElementById('selectItemPeriod');
                 var select5 = document.getElementById('selectItemCategory');
                 select1.selectedIndex = 0;
                 select2.selectedIndex = 0;
                 select3.selectedIndex = 0;
                 select4.selectedIndex = 0;
                 select5.selectedIndex = 0;
                 resetInterface();
            }
            function filter() {
                 var selectItemPriceValue = document.getElementById('selectItemPrice').value;
                 var selectItemSpeciesValue = document.getElementById('selectItemSpecies').value;
                 var selectItemGenderValue = document.getElementById('selectItemGender').value;
                 var selectItemPeriodValue = document.getElementById('selectItemPeriod').value;
                 var selectItemCategoryValue = document.getElementById('selectItemCategory').value;
                    $.ajax({
                       url: "/HomePage/FilterBirdServlet",
                       type: "get",  // send it through get method
                       data: {
                           selectItemPrice: selectItemPriceValue,
                           selectItemSpecies: selectItemSpeciesValue,
                           selectItemGender: selectItemGenderValue,
                           selectItemPeriod: selectItemPeriodValue,
                           selectItemCategory: selectItemCategoryValue,
                       },
                       success: function (data) {
                           if(selectItemPriceValue == 0 && selectItemSpeciesValue == 0 
                                   && selectItemGenderValue == 0 && selectItemPeriodValue == 0
                                    && selectItemCategoryValue == "") {
                                resetInterface();
                           }
                            var row = document.getElementById("content");
                            row.innerHTML = data;
                       },
                       error: function(data) {
                          console.log(data);
                        }
                    });
                }
        </script>
    </body>
</html>
