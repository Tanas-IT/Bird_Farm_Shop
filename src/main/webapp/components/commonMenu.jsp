<%-- 
    Document   : guestMenuComponent
    Created on : Sep 27, 2023, 3:04:07 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav style="background-color:#f3e4e4 !important; position:fixed; width: 100%; z-index: 100; padding-bottom: 0; cursor: pointer;" class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container container-header px-4 px-lg-5">
        <a style="margin: 0" class="navbar-brand" href="#!">
            <img class="logo" src="img/bird_logo.png" alt="logo"/>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item">
                    <a　id="home-link" class="nav-link nav-active" aria-current="page" href="#" onclick="handleButtonClick(this)">
                        <h5 class="background-hover">Trang chủ</h5>
                    </a>
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
