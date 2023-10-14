<%-- 
    Document   : birdDetail
    Created on : Oct 4, 2023, 11:11:22 PM
    Author     : ASUS
--%>

<%@page import="birdfarm.dto.UserDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="birdfarm.dto.BirdDTO"%>
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
    </head>

    <body>
        <%  ArrayList<BirdDTO> listBird = (ArrayList<BirdDTO>) request.getAttribute("listBird");
            String idBird = (String) request.getAttribute("idBird");
            UserDTO user = (UserDTO) session.getAttribute("user");
            BirdDTO birdDetail = null;
            BirdDTO birdRelated1 = null;
            BirdDTO birdRelated2 = null;
            BirdDTO birdRelated3 = null;
            BirdDTO birdRelated4 = null;
            for (BirdDTO bird : listBird) {
                if (bird.getIdBird().equals(idBird)) {
                    birdDetail = bird;
                    break;
                }
            }
            ArrayList<BirdDTO> listBirdRandom = birdDetail.getRandomBirds(listBird, birdDetail, 4);
            birdRelated1 = listBirdRandom.get(0);
            birdRelated2 = listBirdRandom.get(1);
            birdRelated3 = listBirdRandom.get(2);
            birdRelated4 = listBirdRandom.get(3);
        %>
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
                            <%  String url = "DispatchServlet";
                                String userId = null;
                                if (user != null) {
                                    userId = user.getIdUser();
                                    url = "DispatchServlet?btAction=Home&txtUsername=" + user.getUsername() + "&txtPassword=" + user.getPassword();
                                }
                            %>
                            <form action=<%= url%>>
                                <% if(user != null) { %>
                                    <input type="hidden" name="userID" value="<%= userId %>" />
                                <%}%>
                                <input style="background-color: #f3e4e4;border: none;font-weight: 600;font-size: 18px;" id="home-link" type="submit" class="nav-link nav-active" aria-current="page" value="Trang chủ"/>
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
        <!-- Product Details Section Begin -->
        <section class="product-details spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="product__details__pic">
                            <div class="product__details__pic__item ">
                                <img style="height: 500px" class="w-50 product__details__pic__item--large"
                                     src="<%= birdDetail.getImageURL()%>" alt="<%= birdDetail.getName()%>">
                            </div>
                            <div class="img-description">
                                <img style="margin-left: 0; width: 124px; height: 93px; background-size: cover; margin-right: 15px; cursor: pointer" data-imgbigurl="<%= birdDetail.getImageURL()%>"
                                     src="<%= birdDetail.getImageURL()%>" alt="<%= birdDetail.getName()%>" class="thumbnail">
                                <%for (String img : birdDetail.getSubImageURL()) {%>
                                <img data-imgbigurl="<%= img %>" style="margin-left: 0; cursor: pointer; width: 124px; height: 93px; background-size: cover; margin-right: 15px"
                                     src="<%= img %>" alt="<%= birdDetail.getName()%>" class="thumbnail">
                                <%}%> 
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="product__details__text">
                            <h3><%= birdDetail.getName()%></h3>
                            <div class="product__details__rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-half-o"></i>
                                <span>(18 reviews)</span>
                            </div>
                            <%
                                DecimalFormat decimalFormat = new DecimalFormat("###,###");
                                String formattedNumber = decimalFormat.format(birdDetail.getSalePrice());
                            %> 
                            <div class="product__details__price"><h6 style="color:red;">Giá: <%= formattedNumber + " VND/con"%></h6></div>
                            <p style="font-size: 20px;"><%= birdDetail.getShortDescription()%></p>
                            <p style="color: #fe5e5e;font-size: 16px;font-weight: bold;">Đột biến: <%if(birdDetail.isMutation()){%>Có<%} else {%>Không<%}%></p>
                            <div class="fs-18 text-black mb-2">
                                    <div style="color: #fe5e5e;font-size: 18px;margin-bottom: 40px;font-weight: bold;">Số lượng:  <i class="btn-minus fa-solid fa-square-minus fa-xl" style="color: #59d682; margin-top: 12px;"></i>
                                            <input style="width: 30px; border: 0.5px solid #ce9999cc; border-radius: 5px" class="quantityOfBird text-center" type="text" id="quantityInput" value="1" min="1" max="<%=birdDetail.getQuantity()%>">
                                            <i class="btn-plus fa-solid fa-square-plus fa-xl" style="color: #59d682; margin-top: 12px;"></i> con
                                            <span style="margin-left: 15px; font-size: 14px;" class="fst-italic text-muted">Tối đa <%=birdDetail.getQuantity()%> con</span>
                                    </div>
                            </div>
                            <% if (user != null) {%>
                            <form action="DispatchServlet">
                                <input type="hidden" name="userID" value="<%= user.getIdUser()%>" />
                                <input type="hidden" name="birdID" value="<%= birdDetail.getIdBird()%>" />
                                <input type="hidden" name="birdName" value="<%= birdDetail.getName()%>" />
                                <input type="hidden" name="birdQuantity" value="<%= birdDetail.getQuantity()%>" />
                                <input type="hidden" name="birdPrice" value="<%= birdDetail.getSalePrice()%>" />
                                <input type="hidden" name="birdImage" value="<%= birdDetail.getImageURL()%>" />
                                <input type="submit" name="btAction" value = "Thêm Vào Giỏ Hàng" class="primary-btn"/>
                            </form>
                            <% } else { %>
                            <a href="Login.jsp" style="color:#7fad39; cursor: pointer; border: 1px solid #7fad39" class="text-decoration-none primary-btn bg-white">
                                <i class="fa-solid fa-cart-shopping" style="color: #7fad39;"></i>
                                Thêm vào giỏ hàng
                            </a>
                            <% }%>
                            <% if (user != null) {%>
                            <form action="DispatchServlet">
                                <input type="hidden" name="userID" value="<%= user.getIdUser()%>" />
                                <input type="hidden" name="birdID" value="<%= birdDetail.getIdBird()%>" />
                                <input type="hidden" name="birdName" value="<%= birdDetail.getName()%>" />
                                <input type="hidden" name="birdQuantity" value="<%= birdDetail.getQuantity()%>" />
                                <input type="hidden" name="birdPrice" value="<%= birdDetail.getSalePrice()%>" />
                                <input type="hidden" name="birdImage" value="<%= birdDetail.getImageURL()%>" />
                                <input type="submit" name="btAction" value = "Mua Ngay" class="primary-btn"/>
                            </form>
                            <% } else { %>
                            <a href="Login.jsp" class="pointer text-decoration-none primary-btn">Mua Ngay</a>
                            <% }%>
                            <ul>
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
                        <div class="text-center video-URL"><%= birdDetail.getVideoURL() %></div>
                    </div>
                    <div class="col-lg-12">
                        <h3 style="color: #7fad39" class="bird-title_descrption">Thông tin chi tiết</h2>
                        <hr style="border-top: 2px solid #000; opacity: 1"/>
                        <h4 style="color: blue" >Tổng quan</h4>
                        <p style="text-indent: 40px; font-size: 20px">-<%= birdDetail.getOverview() %></p>
                        <h4 style="color: blue" >Tuổi</h4>
                        <p style="text-indent: 40px; font-size: 20px"><%= birdDetail.getAge()%></p>
                        <h4 style="color: blue" >Loại chim</h4>
                        <p style="text-indent: 40px; font-size: 20px"><%= birdDetail.getPeriod()%></p>
                        <h4 style="color: blue" >Thành tích thi đấu</h4>
                        <p style="text-indent: 40px; font-size: 20px">
                            <% if(birdDetail.getAchievement() != null) {%>
                                    <%= birdDetail.getAchievement()%>
                            <%} else { %>
                                    Không có
                            <%}%>
                        </p>
                        <h4 style="color: blue" >Lịch sử sinh sản</h4>
                        <p style="text-indent: 40px; font-size: 20px">
                            <% if(birdDetail.getReproductiveHistory()!= null) {%>
                                    <%= birdDetail.getReproductiveHistory()%>
                            <%} else { %>
                                    Không có
                            <%}%>
                        </p>
                        <h4 style="color: blue" >Chim bố và chim mẹ</h4>
                        <div class="row">
                            <div class="col-lg-6">
                                <h5 class="text-center text-danger">Chim Bố</h5>
                                <img style="display: block; margin: 0 auto;height: 200px" class="w-50 text-center" src="<%= birdDetail.getFatherBird().getImageURL() %>" alt="<%= birdDetail.getFatherBird().getName() %>">
                                <h5 class="text-center mt-3"><%= birdDetail.getFatherBird().getName() %></h5>
                                <ul style="list-style-type: none; font-size: 18px">
                                    <li><span style="color: red; font-weight: bold;">Đột biến: </span><%if(birdDetail.getFatherBird().isMutation()) {%>Có<%}%>Không</li>
                                    <li><span style="color: red; font-weight: bold;">Thành tích thi đấu: </span><%= birdDetail.getFatherBird().getAchievement()%></li>
                                    <li><span style="color: red; font-weight: bold;">Lịch sử sinh sản: </span><%= birdDetail.getFatherBird().getReproductiveHistory()%></li>
                                    <li><span style="color: red; font-weight: bold;">Mô tả: </span><%= birdDetail.getFatherBird().getShortDescription()%></li>
                                </ul>
                            </div>
                            <div class="col-lg-6">
                                <h5 class="text-center text-danger">Chim Mẹ</h5>
                                <img style="display: block; margin: 0 auto;height: 200px" class="w-50 text-center" src="<%= birdDetail.getMotherBird().getImageURL() %>" alt="<%= birdDetail.getMotherBird().getName() %>">
                                <h5 class="text-center mt-3"><%= birdDetail.getMotherBird().getName() %></h5>
                                <ul style="list-style-type: none; font-size: 18px">
                                    <li><span style="color: red; font-weight: bold;">Đột biến: </span><%if(birdDetail.getMotherBird().isMutation()) {%>Có<%}%>Không</li>
                                    <li><span style="color: red; font-weight: bold;">Thành tích thi đấu: </span><%= birdDetail.getMotherBird().getAchievement()%></li>
                                    <li><span style="color: red; font-weight: bold;">Lịch sử sinh sản: </span><%= birdDetail.getMotherBird().getReproductiveHistory()%></li>
                                    <li><span style="color: red; font-weight: bold;">Mô tả: </span><%= birdDetail.getMotherBird().getShortDescription() %></li>
                                </ul>
                            </div>
                        </div>
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
                            <div style="width: 100%; height: 300px; background-size: cover; border-radius: 3px;" class="product__item__pic set-bg" data-setbg="<%=birdRelated1.getImageURL()%>">
                                <ul class="product__item__pic__hover">
                                    <li><a href="DispatchServlet?btAction=View More&id=<%=birdRelated1.getIdBird()%>"><i class="fas fa-eye"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a class="text-decoration-none" href="DispatchServlet?btAction=View More&id=<%=birdRelated1.getIdBird()%>"><%= birdRelated1.getName()%></a></h6>
                                    <%
                                        String formattedNumberRelated1 = decimalFormat.format(birdRelated1.getSalePrice());
                                    %> 
                                <h5><%= formattedNumberRelated1 + " VND"%></h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="product__item">
                            <div style="width: 100%; height: 300px; background-size: cover; border-radius: 3px;" class="product__item__pic set-bg" data-setbg="<%=birdRelated2.getImageURL()%>">
                                <ul class="product__item__pic__hover">
                                    <li><a href="DispatchServlet?btAction=View More&id=<%=birdRelated2.getIdBird()%>"><i class="fas fa-eye"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a class="text-decoration-none" href="DispatchServlet?btAction=View More&id=<%=birdRelated2.getIdBird()%>"><%= birdRelated2.getName()%></a></h6>
                                    <%
                                        String formattedNumberRelated2 = decimalFormat.format(birdRelated2.getSalePrice());
                                    %> 
                                <h5><%= formattedNumberRelated2 + " VND"%></h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="product__item">
                            <div style="width: 100%; height: 300px; background-size: cover; border-radius: 3px;" class="product__item__pic set-bg" data-setbg="<%=birdRelated3.getImageURL()%>">
                                <ul class="product__item__pic__hover">
                                    <li><a href="DispatchServlet?btAction=View More&id=<%=birdRelated3.getIdBird()%>"><i class="fas fa-eye"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a class="text-decoration-none"><%= birdRelated3.getName()%></a></h6>
                                    <%
                                        String formattedNumberRelated3 = decimalFormat.format(birdRelated3.getSalePrice());
                                    %> 
                                <h5><%= formattedNumberRelated3 + " VND"%></h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="product__item">
                            <div style="width: 100%; height: 300px; background-size: cover; border-radius: 3px;" class="product__item__pic set-bg" data-setbg="<%=birdRelated4.getImageURL()%>">
                                <ul class="product__item__pic__hover">
                                    <li><a href="DispatchServlet?btAction=View More&id=<%=birdRelated4.getIdBird()%>"><i class="fas fa-eye"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a class="text-decoration-none"><%= birdRelated4.getName()%></a></h6>
                                    <%
                                        String formattedNumberRelated4 = decimalFormat.format(birdRelated4.getSalePrice());
                                    %> 
                                <h5><%= formattedNumberRelated4 + " VND"%></h5>
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

    </body>

</html>