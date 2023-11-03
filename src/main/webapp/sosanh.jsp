<%-- 
    Document   : sosanh
    Created on : Oct 10, 2023, 10:54:07 PM
    Author     : ASUS
--%>

<%@page import="birdfarm.shopping.Cart"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="birdfarm.dto.BirdDTO"%>
<%@page import="birdfarm.dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi-VN">
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
    <style>
        .productname-cp {
            font-size: 16px;
            line-height: 150%;
            color: #222;
            font-weight: bold;
            text-transform: uppercase;
            margin-top: 10px;
        }
        td {
            max-width: 500px;
            border: 1px solid rgb(0 0 0 / 10%);
            font-size: 18px;
        }
        .btn-addCart {
            display: block;
            overflow: hidden;
            background: #fb6e2e;
            border-radius: 3px;
            text-transform: uppercase;
            padding: 10px 5px;
            margin: 10px;
            color: #fff;
            width: 250px;
            border: none;
            margin-left: 90px;
        }
        .btn-addCart:hover {
            background: #fb6e2e;
            border:none;
        }
        .btn-viewMore {
            display: block;
            overflow: hidden;
            background: #2f80ed;
            border-radius: 3px;
            text-transform: uppercase;
            padding: 10px 5px;
            margin: 10px;
            color: #fff;
            width: 250px;
            border: none;
            margin-left: 90px;
        }
        .btn-viewMore:hover {
            background: #2f80ed;
            border:none;
        }
    </style>
    <body class="">
        <%
            String idBird = (String) request.getAttribute("idBird");
            UserDTO user = (UserDTO) session.getAttribute("user");
            BirdDTO bird1 = (BirdDTO) request.getAttribute("bird1");
            BirdDTO bird2 = (BirdDTO) request.getAttribute("bird2");
            Cart cart = (Cart) session.getAttribute("CART");
        %>
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
                            <%  String url = "DispatchServlet";
                                String userId = null;
                                if (user != null) {
                                    userId = user.getIdUser();
                                    url = "DispatchServlet?btAction=Home&txtUsername=" + user.getUsername() + "&txtPassword=" + user.getPassword();
                                }
                            %>
                            <form action=<%= url%>>
                                <% if (user != null) {%>
                                <input type="hidden" name="userID" value="<%= userId%>" />
                                <%}%>
                                <input style="background-color: #f3e4e4;border: none;font-weight: 600;font-size: 18px;" id="home-link" type="submit" class="nav-link nav-active" aria-current="page" value="Trang chủ"/>
                            </form>
                        </li>
                        <li class="nav-item">
                            <% if (user != null) {%>
                            <a id="about-link" class="nav-link" href="about.jsp?userID=<%= user.getIdUser()%>" onclick="handleButtonClick(this)">
                                <h5 class="background-hover">Về chúng tôi</h5>
                            </a>
                            <%}%>
                            <% if (user == null) {%>
                            <a id="about-link" class="nav-link" href="about.jsp" onclick="handleButtonClick(this)">
                                <h5 class="background-hover">Về chúng tôi</h5>
                            </a>
                            <%}%>
                        </li>
                        <li class="nav-item">
                            <a id="about-link" class="nav-link" href="DispatchServlet?btAction=Pairing&userID=<%= user.getIdUser()%>" onclick="handleButtonClick(this)">
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
                        <input type="hidden" name="userID" value="<%= user.getIdUser().trim()%>" />
                        <button id="cart-content"  class="cart btn" type="submit" name="btAction" value="Xem giỏ hàng">
                            <i class="fa-solid fa-cart-shopping"></i>
                            <!--No cart:  header_cart-list--no-cart-->
                                    <% if(cart == null || cart.getCart().isEmpty()) {%>
                                    <div class="header_cart">
                                        <div class="header__cart-list header_cart-list--no-cart">
                                        <img class="header__cart-no-cart-img" src="img/no_cart.png"/>
                                        <span class="header__cart-list-no-cart-msg">Chưa có sản phẩm</span>
                                        </div>
                                    </div>
                                    <% } else { %>
                                    <div  class="header_cart">
                                    <div class="header__cart-list">
                                    <h4 class="header__cart-heading">Sản phẩm đã thêm</h4>
                                    <ul  class="header__cart-list-item">
                                        <!--Cart Item-->
                                        <%for (Map.Entry<String, BirdDTO> entry : cart.getCart().entrySet()) {
                                                String type = "Chim phổ thông";
                                               if(entry.getValue().getType() == 1) type = "Tổ chim";
                                               else if(entry.getValue().getType() == 2) type = "Chim cao cấp";
                                               else if(entry.getValue().getType() == 3) type = "Chim giống"; 
                                        %>
                                        <li class="header__cart-item">
                                            <img class="header__cart-img" src="<%= entry.getValue().getImageURL() %>">
                                            <div class="header__cart-item-info">
                                                <div class="header__cart-item-head">
                                                    <h5 class="header__cart-item-name"><%= entry.getValue().getName()%></h5>
                                                    <div class="header__cart-item-price-wrap">
                                                        <span class="header__cart-item-price">
                                                             <%
                                                                DecimalFormat decimalFormat = new DecimalFormat("###,###");
                                                                String formattedNumber = decimalFormat.format(entry.getValue().getSalePrice());
                                                            %> 
                                                            <%= formattedNumber + " VND" %>
                                                        </span>
                                                        <span class="header__cart-item-multiply">x</span>
                                                        <span class="header__cart-item-quantity"><%= entry.getValue().getQuantityOfUser() %></span>
                                                    </div>
                                                </div>
                                                <div class="header__cart-item-body">
                                                    <span class="header__cart-item-description">
                                                        Phân loại hàng: <%= type %>
                                                    </span>
                                                    <span class="header__cart-item-remove">
                                                        <span data-idRemove="<%= entry.getKey() %>" onclick="RemoveItemFromCart(this)" >Xóa</span>
                                                    </span>
                                                </div>
                                            </div>
                                        </li>
                                        <% } %>
                                    </ul>
                                    <form action="DispatchServlet">
                                            <input id="userID" type="hidden" name="userID" value="<%= user.getIdUser()%>" />
                                            <input id="birdID" type="hidden" name="birdID" value="<%= idBird %>" />
                                            <input type="submit" name="btAction" class="header__cart-view-cart btn btn-danger" value="Xem chi tiết" />
                                    </form>
                                    </div>
                                </div>
                           <%}%>
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
                    
                            <% String image = "img/user-image.png";
                                if(user.getImage() != null) {
                                    image = user.getImage();
                            }%>
                    <div style="width: 154px">
                        <img style="width: 30px; height: 30px; background-size: cover; border-radius: 50%;" src="<%=image%>">
                        <p style="display:inline; font-weight: 500;width: 154px">Xin chào,</p><br/>
                        <p style="display:inline; font-weight: 500;width: 154px"> <%=user.getFullName()%></p>
                    </div>
                    <form action="LogoutServlet">
                        <button style="margin-left: 10px;" type="submit" class="btn-register btn btn-danger">
                            Đăng xuất
                        </button>
                    </form>
                </div>
            </div>
        </nav>

        <section style="max-width: 1200px; margin: auto;" class="w-100 py-5">
            <table style="margin-top: 130px;" class="table">
                <thead>
                    <tr class="bg-light">
                        <th>
                            <div style="transform: translateY(-61px)" class="product-cp">
                                <p style="font-size: 16px;line-height: 150%;color: #666;">So sánh 2 chim:</p>
                                <p  class="text-primary productname-cp"><%= bird1.getName()%></p>
                                &
                                <p class="text-primary productname-cp"> <%= bird2.getName()%></p>
                            </div>


                        </th>
                        <td class="text-center">
                            <img style="max-width: 275px; object-fit: contain; width: 100%; height: 300px; background-size: cover; border-top-left-radius: 3px; border-top-right-radius: 3px" class="card-img-top" src="<%=bird1.getImageURL()%>" alt="<%=bird1.getName()%>" />
                        </td>
                        <td class="text-center ">
                            <img style="max-width: 275px; object-fit: contain;width: 100%; height: 300px; background-size: cover; border-top-left-radius: 3px; border-top-right-radius: 3px" class="card-img-top" src="<%=bird2.getImageURL()%>" alt="<%=bird2.getName()%>" />
                        </td>
                    </tr>
                </thead>
                <tbody style="border: 1px solid rgb(0 0 0 / 10%);">
                    <% if (bird1.getType() == 1 || bird1.getType() == 0) {%>
                    <tr>
                        <td class="fw-bold">Số lượng</td>
                        <td class="text-center"><%= bird1.getQuantity()%> con</td>
                        <td style="border: 1px solid rgb(0 0 0 / 10%);" class="text-center"><%= bird1.getQuantity()%> con</td>
                    </tr>
                    <%} else {%>
                    <tr>
                        <td class="fw-bold">Giới tính</td>
                        <td class="text-center"><%= bird1.getGender()%></td>
                        <td style="border: 1px solid rgb(0 0 0 / 10%);" class="text-center"><%= bird2.getGender()%></td>
                    </tr>
                    <%}%>
                    <tr>
                        <td class="fw-bold">Mô tả</td>
                        <td>- <%= bird1.getShortDescription()%></td>
                        <td>- <%= bird2.getShortDescription()%></td>
                    </tr>
                    <tr>
                        <td class="fw-bold">Loài</td>
                        <td><%= bird1.getBirdSpecies()%></td>
                        <td><%= bird2.getBirdSpecies()%></td>
                    </tr>
                    <tr>
                        <td class="fw-bold">Tuổi</td>
                        <td><%= bird1.getAge()%></td>
                        <td><%= bird2.getAge()%></td>
                    </tr>
                    <tr>
                        <td class="fw-bold">Giá tiền</td>
                        <%
                            DecimalFormat decimalFormat = new DecimalFormat("###,###");
                            String formattedBird1Number = decimalFormat.format(bird1.getSalePrice());
                            String formattedBird2Number = decimalFormat.format(bird2.getSalePrice());
                        %> 
                        <td class="text-danger" style="font-size:18px; font-weight: bold;"><%= formattedBird1Number + " VND"%></td>
                        <td class="text-danger" style="font-size:18px; font-weight:bold;"><%= formattedBird2Number + " VND"%> </td>
                    </tr>
                    <tr>
                        <td class="fw-bold">Đột biến</td>
                        <td class="text-danger" style="font-size:18px; font-weight: bold;"><%if (bird1.isMutation()) {%>Có<%} else {%>Không<%}%></td>
                        <td class="text-danger" style="font-size:18px; font-weight: bold;"><%if (bird2.isMutation()) {%>Có<%} else {%>Không<%}%></td>
                    </tr>

                    <tr>
                        <td class="fw-bold">Thành tích thi đấu</td>
                        <td class="text-danger" style="font-size:18px; font-weight: bold;">
                            <% if (bird1.getAchievement() != null) {%>
                            <%= bird1.getAchievement()%>
                            <%} else { %>
                            Không có
                            <%}%>
                        </td>
                        <td class="text-danger" style="font-size:18px; font-weight: bold;">
                            <% if (bird2.getAchievement() != null) {%>
                            <%= bird2.getAchievement()%>
                            <%} else { %>
                            Không có
                            <%}%>
                        </td>
                    </tr>
                    <tr>
                        <td class="fw-bold">Lịch sử sinh sản</td>
                        <td>
                            <% if (bird1.getReproductiveHistory() != null) {%>
                            <%= bird1.getReproductiveHistory()%>
                            <%} else { %>
                            Không có
                            <%}%>
                        </td>
                        <td>
                            <% if (bird2.getReproductiveHistory() != null) {%>
                            <%= bird2.getReproductiveHistory()%>
                            <%} else { %>
                            Không có
                            <%}%>
                        </td>
                    </tr>
                    <tr>
                        <td class="fw-bold">Loại chim</td>
                        <td><%= bird1.getPeriod()%></td>
                        <td><%= bird2.getPeriod()%></td>
                    </tr>
                    <tr>
                        <td class="fw-bold">Chim Bố</td>
                        <td>
                            <img style="display: block; margin: 0 auto;height: 200px" class="w-50 text-center" src="<%= bird1.getFatherBird().getImageURL()%>" alt="<%= bird1.getFatherBird().getName()%>">
                            <h5 class="text-center mt-3"><%= bird1.getFatherBird().getName()%></h5>
                            <ul style="font-size: 18px">
                                <li><span style="color: red; font-weight: bold;">Giới tính: </span><%= bird1.getFatherBird().getGender()%></li>
                                <li><span style="color: red; font-weight: bold;">Đột biến: </span><%if (bird1.getFatherBird().isMutation()) {%>Có<%}%>Không</li>
                                <li><span style="color: red; font-weight: bold;">Loại chim: </span><%= bird1.getFatherBird().getPeriod()%></li>
                                <li><span style="color: red; font-weight: bold;">Tuổi: </span><%= bird1.getFatherBird().getAge()%></li>
                                <li><span style="color: red; font-weight: bold;">Thành tích thi đấu: </span>
                                    <% if (bird1.getFatherBird().getAchievement() != null) {%>
                                    <%= bird1.getFatherBird().getAchievement()%>
                                    <%} else { %>
                                    Không có
                                    <%}%>
                                </li>
                                <li><span style="color: red; font-weight: bold;">Lịch sử sinh sản: </span>
                                    <% if (bird1.getFatherBird().getReproductiveHistory() != null) {%>
                                    <%= bird1.getFatherBird().getReproductiveHistory()%>
                                    <%} else { %>
                                    Không có
                                    <%}%>
                                </li>
                            </ul>
                        </td>
                        <td>
                            <img style="display: block; margin: 0 auto;height: 200px" class="w-50 text-center" src="<%= bird2.getFatherBird().getImageURL()%>" alt="<%= bird2.getFatherBird().getName()%>">
                            <h5 class="text-center mt-3"><%= bird2.getFatherBird().getName()%></h5>
                            <ul style="font-size: 18px">
                                <li><span style="color: red; font-weight: bold;">Giới tính: </span><%= bird2.getFatherBird().getGender()%></li>
                                <li><span style="color: red; font-weight: bold;">Đột biến: </span><%if (bird2.getFatherBird().isMutation()) {%>Có<%}%>Không</li>
                                <li><span style="color: red; font-weight: bold;">Loại chim: </span><%= bird2.getFatherBird().getPeriod()%></li>
                                <li><span style="color: red; font-weight: bold;">Tuổi: </span><%= bird2.getFatherBird().getAge()%></li>
                                <li><span style="color: red; font-weight: bold;">Thành tích thi đấu: </span>
                                    <% if (bird2.getFatherBird().getAchievement() != null) {%>
                                    <%= bird2.getFatherBird().getAchievement()%>
                                    <%} else { %>
                                    Không có
                                    <%}%>
                                </li>
                                <li><span style="color: red; font-weight: bold;">Lịch sử sinh sản: </span>
                                    <% if (bird2.getFatherBird().getReproductiveHistory() != null) {%>
                                    <%= bird2.getFatherBird().getReproductiveHistory()%>
                                    <%} else { %>
                                    Không có
                                    <%}%>
                                </li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td class="fw-bold">Chim Mẹ</td>
                        <td>
                            <img style="display: block; margin: 0 auto;height: 200px" class="w-50 text-center" src="<%= bird1.getMotherBird().getImageURL()%>" alt="<%= bird1.getMotherBird().getName()%>">
                            <h5 class="text-center mt-3"><%= bird1.getMotherBird().getName()%></h5>
                            <ul style="font-size: 18px">
                                <li><span style="color: red; font-weight: bold;">Đột biến: </span><%if (bird1.getMotherBird().isMutation()) {%>Có<%}%>Không</li>
                                <li><span style="color: red; font-weight: bold;">Loại chim: </span><%= bird1.getMotherBird().getPeriod()%></li>
                                <li><span style="color: red; font-weight: bold;">Tuổi: </span><%= bird1.getMotherBird().getAge()%></li>
                                <li><span style="color: red; font-weight: bold;">Thành tích thi đấu: </span>
                                    <% if (bird1.getMotherBird().getAchievement() != null) {%>
                                    <%= bird1.getMotherBird().getAchievement()%>
                                    <%} else { %>
                                    Không có
                                    <%}%>
                                </li>
                                <li><span style="color: red; font-weight: bold;">Lịch sử sinh sản: </span>
                                    <% if (bird1.getMotherBird().getReproductiveHistory() != null) {%>
                                    <%= bird1.getMotherBird().getReproductiveHistory()%>
                                    <%} else { %>
                                    Không có
                                    <%}%>
                                </li>
                            </ul>
                        </td>
                        <td>
                            <img style="display: block; margin: 0 auto;height: 200px" class="w-50 text-center" src="<%= bird2.getMotherBird().getImageURL()%>" alt="<%= bird2.getMotherBird().getName()%>">
                            <h5 class="text-center mt-3"><%= bird2.getMotherBird().getName()%></h5>
                            <ul style="font-size: 18px">
                                <li><span style="color: red; font-weight: bold;">Đột biến: </span><%if (bird2.getMotherBird().isMutation()) {%>Có<%}%>Không</li>
                                <li><span style="color: red; font-weight: bold;">Loại chim: </span><%= bird2.getMotherBird().getPeriod()%></li>
                                <li><span style="color: red; font-weight: bold;">Tuổi: </span><%= bird2.getMotherBird().getAge()%></li>
                                <li><span style="color: red; font-weight: bold;">Thành tích thi đấu: </span>
                                    <% if (bird2.getMotherBird().getAchievement() != null) {%>
                                    <%= bird2.getMotherBird().getAchievement()%>
                                    <%} else { %>
                                    Không có
                                    <%}%>
                                </li>
                                <li><span style="color: red; font-weight: bold;">Lịch sử sinh sản: </span>
                                    <% if (bird2.getMotherBird().getReproductiveHistory() != null) {%>
                                    <%= bird2.getMotherBird().getReproductiveHistory()%>
                                    <%} else { %>
                                    Không có
                                    <%}%>
                                </li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <div class="product-actions justify-content-between card-footer p-4 pb-2 pt-0 border-top-0 bg-transparent">
                                <% if (userId != null) {%> 
                                <div class="btn-add">
                                    <form action="DispatchServlet">
                                        <input type="hidden" name="userID" value="<%= user.getIdUser()%>" />
                                        <input type="hidden" name="birdID" value="<%= bird1.getIdBird()%>" />
                                        <input type="hidden" name="birdName" value="<%= bird1.getName()%>" />
                                        <input type="hidden" name="birdQuantity" value="<%= bird1.getQuantity()%>" />
                                        <input type="hidden" name="birdID1" value="<%= bird1.getIdBird()%>" />
                                        <input type="hidden" name="birdID2" value="<%= bird2.getIdBird()%>" />
                                        <input type="submit" name="btAction" value = "Thêm vào giỏ hàng" class="btn-addCart btn-item btn btn-outline-dark mt-auto"/>
                                    </form>
                                </div>
                                <%} else {%>
                                <div class="btn-add"><a class="btn-addCart btn-item btn btn-outline-dark mt-auto" href="Login.jsp">Thêm vào giỏ hàng</a></div>
                                <%}%>
                            </div>
                        </td>
                        <td>
                            <div class="product-actions justify-content-between card-footer p-4 pb-2 pt-0 border-top-0 bg-transparent">
                                <% if (userId != null) {%> 
                                <div class="btn-add">
                                    <form action="DispatchServlet">
                                        <input type="hidden" name="userID" value="<%= user.getIdUser()%>" />
                                        <input type="hidden" name="birdID" value="<%= bird2.getIdBird()%>" />
                                        <input type="hidden" name="birdName" value="<%= bird2.getName()%>" />
                                        <input type="hidden" name="birdQuantity" value="<%= bird2.getQuantity()%>" />
                                        <input type="hidden" name="birdID1" value="<%= bird1.getIdBird()%>" />
                                        <input type="hidden" name="birdID2" value="<%= bird2.getIdBird()%>" />
                                        <input type="submit" name="btAction" value = "Thêm vào giỏ hàng" class="btn-addCart btn-item btn btn-outline-dark mt-auto"/>
                                    </form>
                                </div>
                                <%} else {%>
                                <div class="btn-add"><a class="btn-addCart btn-item btn btn-outline-dark mt-auto" href="Login.jsp">Thêm vào giỏ hàng</a></div>
                                <%}%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <div class="product-actions justify-content-between card-footer p-4 pb-2 pt-0 border-top-0 bg-transparent">
                                <div><a class="btn-viewMore btn-item btn btn-outline-dark mt-auto" href="DispatchServlet?btAction=View More&id=<%=bird1.getIdBird()%>&userID=<%= user.getIdUser() %>">Xem thêm</a></div>
                            </div>
                        </td>
                        <td>
                            <div class="product-actions justify-content-between card-footer p-4 pb-2 pt-0 border-top-0 bg-transparent">
                                <div><a class="btn-viewMore btn-item btn btn-outline-dark mt-auto" href="DispatchServlet?btAction=View More&id=<%=bird2.getIdBird()%>&userID=<%= user.getIdUser() %>">Xem thêm</a></div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>


        </section>



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
        <!-- End Google Tag Manager -->

    </body>
</html>

