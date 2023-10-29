<%-- 
    Document   : homeMenuComponent
    Created on : Mar 21, 2022, 8:41:40 AM
    Author     : KhoaHD7621
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url var="homeUrl" value="HomeController"></c:url>
<c:url var="shopUrl" value="ViewAllController"></c:url>
<c:url var="blogUrl" value="blog"></c:url>
<c:url var="aboutUrl" value="AboutUsController"></c:url>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Header desktop -->
        <nav style="background-color:#f3e4e4 !important; position:fixed; width: 100%; z-index: 100; padding-bottom: 0; cursor: pointer;" class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container container-header px-4 px-lg-5">
                <a style="margin: 0" class="navbar-brand" href="#!">
                    <img class="logo" src="img/bird_logo.png" alt="logo"/>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item">
                            <a class="nav-link nav-active" aria-current="page" href="index.html" onclick="handleButtonClick(this)">
                                <h5 class="background-hover">Home</h5>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-active" href="about.jsp" onclick="handleButtonClick(this)">
                                <h5 class="background-hover">About Us</h5>
                            </a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link nav-active dropdown-toggle background-hover" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" onclick="DropdownClick(this)">
                                    <h5 style="display: inline-block" class="background-hover">Bird Pairing</h5>
                            </a>
                            <ul id="myDropdown" class="nav-activedropdown-menu-style dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-hover dropdown-padding dropdown-item" href="#!">By the store's available</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-hover dropdown-padding dropdown-item" href="#!">Brought by you</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-active" href="#" role="button" aria-expanded="false" onclick="handleButtonClick(this)">
                                <h5 class="background-hover">Purchased Items</h5>
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
                    
                    <form class="d-flex">
                        <button class="cart btn btn-outline-dark" type="submit">
                            <i class="fa-solid fa-cart-shopping"></i>
                            Cart
                            <span class="badge bg-warning text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>
                    <button type="button" class="btn-login btn btn-primary">Login</button>
                    <button type="button" class="btn-register btn btn-danger">Register</button>
                </div>
            </div>
        </nav>


<!-- Menu Mobile -->
<div class="menu-mobile">
    <ul class="topbar-mobile p-0">
        <li>
            <div class="left-top-bar">
                Free shipping for standard order over $100
            </div>
        </li>

        <li>
            <div class="right-top-bar flex-w h-full">
                <a class="text-decoration-none flex-c-m trans-04 p-lr-25" href="#"><i class="bi bi-phone me-2"></i>+84 123456789</a>
                <a class="text-decoration-none flex-c-m trans-04 p-lr-25" href="#"><i class="bi bi-envelope me-2"></i>info@myflower.com</a>
            </div>
        </li>
        <li>
            <div class="right-top-bar flex-w h-full">
                <a href="#" class="flex-c-m trans-04 p-lr-25"><i class="bi bi-facebook"></i></a>
                <a href="#" class="flex-c-m trans-04 p-lr-25"><i class="bi bi-twitter"></i></a>
                <a href="#" class="flex-c-m trans-04 p-lr-25"><i class="bi bi-instagram"></i></a>
            </div>
        </li>
    </ul>
</div>

<!-- Modal Search -->
<!--<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
    <div class="container-search-header">
        <button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
            <i class="bi bi-x-lg"></i>
        </button>
        <form action="SearchController" class="wrap-search-header flex-w p-l-15">
            <button class="flex-c-m trans-04">
                <i class="zmdi zmdi-search"></i>
            </button>
            <input class="plh3" type="text" name="keyword" value="${requestScope.keyword}" placeholder="Search..." required>
            <select class="plh3" name="searchby">
                <option value="byname" ${requestScope.searchby eq "byname" ? "selected" : ""}>Name</option>
                <option value="bycategory" ${requestScope.searchby eq "bycategory" ? "selected" : ""}>Category</option>
            </select>
            <div class="text-center w-100 mt-4">
                <button type="submit">Search</button>
            </div>
        </form>
    </div>-->
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/scripts.js"></script>