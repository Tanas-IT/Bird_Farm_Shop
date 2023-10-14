

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>About us</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="img/bird_logo.png" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/my-styles.css" rel="stylesheet">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">
    </head>

    <body style="animation-duration: 1500ms; opacity: 1;">
        <!-- Home Menu -->
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
                                if (username != null && password != null) {
                                    url = "DispatchServlet?btAction=Home&txtUsername=" + username + "&txtPassword=" + password;
                                }
                            %>
                            <form action="DispatchServlet">
                                <input type="hidden" name="userID" value="<%= request.getParameter("userID")%>" />
                                <input name="btAction" style="background-color: #f3e4e4;border: none;font-weight: 600;font-size: 18px;" id="home-link" type="submit" class="nav-link nav-active" aria-current="page" value="Trang chủ"/>
                            </form>
        <!--                    <a  class="nav-link nav-active" aria-current="page" href="DispatchServlet?btAction=Home?userID=<%= request.getParameter("userID")%>" onclick="handleButtonClick(this)">
                                <h5 class="background-hover">Trang chủ</h5>
                            </a>-->
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

        <!-- About -->
        <div class="bg-white">
            <div class="container py-3">
                <div style="margin-bottom: 50px" class="row align-items-center">
                    <i class="fa fa-leaf fa-2x mb-3 text-primary"></i><h2 class="text-center text-black">Wings & Whistles Aviary: Your Ultimate Avian Sanctuary</h2>
                    <div class="col-lg-12">
                        <h3 class="text-center mt-2">What We Offer:</h3>
                        <ul>
                            <li><p style="text-align: justify;font-weight: bold; margin-bottom: 0">Bird Watching Wonderland: </p>Immerse yourself in the mesmerizing sights and sounds of our diverse bird species. Wander through our spacious aviaries, where vibrant parrots, melodious canaries, and majestic birds of prey will capture your heart.</li>
                            <li><p style="font-weight: bold; margin-bottom: 0">Feathered Companions for Sale: </p>Whether you're a seasoned birder or a novice, you'll find the perfect feathered companion in our collection of healthy, well-cared-for birds. From colorful budgies to exotic macaws, we have a wide range of avian friends looking for loving homes.</li>
                            <li><p style="font-weight: bold; margin-bottom: 0">Expert Bird Pairing: </p>Our experienced staff is dedicated to ensuring that you and your new feathered friend make the perfect match. We provide personalized bird pairing consultations to ensure the happiness and well-being of both you and your avian companion.</li>
                            <li><p style="font-weight: bold; margin-bottom: 0">Bird Care Essentials: </p>Explore our comprehensive selection of bird care essentials, from top-quality bird feed and nesting materials to spacious cages, perches, and toys that will keep your feathered friends entertained.</li>
                            <li><p style="font-weight: bold; margin-bottom: 0">Educational Experiences: </p>oin us for interactive educational programs and birdwatching events that cater to bird enthusiasts of all ages. Learn about the unique behaviors, habitats, and conservation efforts of our avian friends.</li>
                        </ul>
                        <h3 class="text-center">Visit Us Today:</h3>
                        <p class="text-center">Ready to explore the avian world with us? Click the "Learn More" button to plan your visit and take flight into the extraordinary world of birds at Wings & Whistles Aviary.</p>
                        <a href="index.html" style="position: relative;left: 50%;transform: translateX(-50%);color: #fff; background-color: #7DB32B;" class="btn btn-light px-5 rounded-pill shadow-sm">Learn More</a>
                    </div>
                </div>
                <div class="row align-items-center mb-5">
                    <div class="col-lg-6 order-2 order-lg-1"><i class="fa fa-bar-chart fa-2x mb-3 text-primary"></i>
                        <h2 class="text-black">FPT University Ho Chi Minh campus</h2>
                        <p class="font-italic text-muted mt-3 mb-4">The mission of ✴️ FPT University is to ✴️ train high-quality human resources in the integration period, ✴️ provide global competitiveness for people...</p>
                        <a href="https://hcmuni.fpt.edu.vn/" class="btn btn-light px-5 rounded-pill shadow-sm">Learn More</a>
                    </div>
                    <div class="col-lg-5 px-5 mx-auto order-1 order-lg-2"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.605334621169!2d106.80785771483009!3d10.841484592277386!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752731176b07b1%3A0xb752b24b379bae5e!2sFPT%20University%20HCMC!5e0!3m2!1sen!2s!4v1646899026195!5m2!1sen!2s" width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe></div>
                </div>
            </div>
        </div>
        <div class="bg-light">
            <div class="container py-3">
                <div class="row mb-4">
                    <div class="col-lg-5">
                        <h2 class="display-4 text-black">Our team</h2>
                        <p class="font-italic text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                    </div>
                </div>
                <div class="row text-center">
                    <!-- Team item-->
                    <div class="col-xl-3 col-sm-6 mb-5">
                        <div class="bg-white rounded shadow-sm py-5 px-4"><img src="https://avatars.githubusercontent.com/u/77594830?v=4" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
                            <h5 class="mb-0 text-black">Team 3</h5><span class="small text-uppercase text-muted">CEO - Founder</span>
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

