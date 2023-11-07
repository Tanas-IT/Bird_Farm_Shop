<%-- 
    Document   : myorder
    Created on : Jun 13, 2022, 3:35:42 PM
    Author     : Admin
--%>
<%@page import="birdfarm.dto.BirdDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="birdfarm.shopping.RequiredCart"%>
<%@page import="birdfarm.dto.BirdTypeDTO"%>
<%@page import="birdfarm.dto.UserDTO"%>
<%@page import="birdfarm.dto.BirdFeedbackDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
        <title>Ghép cặp chim</title>
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
        <link rel="stylesheet" typ="text/css" href="css/toast.css">
        
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"></script>
        
        <style>
            .mtop {
                margin-top: 6%;
            }
            .title-order {
                display: flex;
                justify-content: center;
                color: red;
            }
            .back-to-homePage {
                padding-top: 100px;
                position: relative;
                top: 55px;
                
            }
            .paginate_button {
                margin-left: 12px;
            }
            table td {
                padding-top: 37px!important;
            }
            table td:nth-child(1) {
                padding-top: 0.75rem!important;
            }
        </style>
    </head>
    <body>
          <%
            UserDTO user = (UserDTO) session.getAttribute("user");
            RequiredCart cart = (RequiredCart) session.getAttribute("RCART");
            String idBird = (String) session.getAttribute("idBird");
        %>
        
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
                        <button class="cart btn" type="submit" name="btAction" value="Xem giỏ hàng">
                            <i class="fa-solid fa-cart-shopping"></i>
                            <!--No cart:  header_cart-list--no-cart-->
                                    <% if(cart == null || cart.getRcart().isEmpty()) {%>
                                    <div class="header_cart">
                                        <div class="header__cart-list header_cart-list--no-cart">
                                        <img class="header__cart-no-cart-img" src="img/no_cart.png"/>
                                        <span class="header__cart-list-no-cart-msg">Chưa có sản phẩm</span>
                                        </div>
                                    </div>
                                    <% } else { %>
                                    <div class="header_cart">
                                    <div class="header__cart-list">
                                    <h4 class="header__cart-heading">Sản phẩm đã thêm</h4>
                                    <ul class="header__cart-list-item">
                                        <!--Cart Item-->
                                        <%for (Map.Entry<String, BirdDTO> entry : cart.getRcart().entrySet()) {
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
                                                                String formattedNumber = "";
                                                                if(entry.getValue().getGender().equals("Trống")) {
                                                                    formattedNumber = decimalFormat.format(entry.getValue().getFeeBirdNestMale());
                                                                }
                                                                if(entry.getValue().getGender().equals("Mái")) {
                                                                    formattedNumber = decimalFormat.format(entry.getValue().getFeeBirdNestFemale());
                                                                }
                                                            %> 
                                                            <%= formattedNumber + " VND" %>
                                                        </span>
                                                        <span class="header__cart-item-multiply">x</span>
                                                        <span class="header__cart-item-quantity"><%= entry.getValue().getQuantity() %></span>
                                                    </div>
                                                </div>
                                                <div class="header__cart-item-body">
                                                    <span class="header__cart-item-description">
                                                        Giới tính: <%= entry.getValue().getGender() %>
                                                    </span>
                                                    <span class="header__cart-item-remove">
                                                        <a style="color:red" class="text-decoration-none" data-idRemove="<%= entry.getKey() %>" href="DispatchServlet?btAction=RemoveItemPairing&idRemove=<%= entry.getKey() %>&userID=<%= user.getIdUser().trim()%>">Xóa</a>
                                                    </span>
                                                </div>
                                            </div>
                                        </li>
                                        <% } %>
                                    </ul>
                                    <%  int RquantityOfCart = (int)session.getAttribute("RquantityOfCart");
                                        if (RquantityOfCart == 2) {%>
                                    <form action="DispatchServlet">
                                            <input id="userID" type="hidden" name="userID" value="<%= user.getIdUser()%>" />
                                            <input id="birdID" type="hidden" name="birdID" value="<%= idBird %>" />
                                            <input type="submit" name="btAction" class="header__cart-view-cart btn btn-danger" value="Xem chi tiết đơn hàng" />
                                    </form>
                                    <%}%>
                                    </div>
                                </div>
                           <%}%>
                            Giỏ hàng
                            <span class="badge bg-warning text-white ms-1 rounded-pill">
                                <% if (session.getAttribute("RquantityOfCart") != null) {%>
                                <%= session.getAttribute("RquantityOfCart")%>
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
        <div class="back-to-homePage">
            <form action="DispatchServlet">
                <c:set var="user" value="${sessionScope.user}"/>
                <input type="hidden" name="userID" value="${user.idUser}"/>
                <button name="btAction" type="submit" class="bg-white" value="Trang chủ" style="border: none;color: #7DB32B; text-decoration: none; font-size: 20px; font-weight: bold;">
                    <i class="fa-solid fa-arrow-left" style="color: #7db32b; margin:0 10px"></i>Trở về trang chủ
                </button>
            </form>
        </div>
            
                
                <div style="transform: translateY(65px)">
                    <h1 class="text-center text-primary">Ghép Chim</h1>
                </div>    
                
        <div class="container" style="display: flex; max-width: 100%">
        <div class="container mtop" style="width:100%">
            <h2 class="text-center text-danger">Danh sách chim trống</h2>
            <table class="table table-striped table-bordered" id="sortTable">
                
                <thead>
                    <tr>
                        <th>Hình ảnh</th>
                        <th>Tên</th>
                        <th>Thành tích thi đấu</th>
                        <th>Lịch sử sinh sản</th>
                        <th>Phí</th>
                        <th>Loài chim</th>
                        <th>Ghép cặp</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<BirdDTO> maleList = (List<BirdDTO>) session.getAttribute("LIST_M");
                        if (maleList != null) {
                            for (BirdDTO bird : maleList) {
                    %>
                    <tr>
                        <td> <img src="<%= bird.getImageURL()%>" alt="alt" width="100px" height="100px" style="border-radius: 10px;"/></td>
                        <td><%= bird.getName()%></td>
                        <td><%= bird.getAchievement()%></td>
                        <td><%= bird.getReproductiveHistory()%></td>
                        <td>
                            <%
                                DecimalFormat decimalFormat = new DecimalFormat("###,###");
                                String formattedNumber = decimalFormat.format(bird.getFeeBirdNestMale());
                            %> 
                            <%= formattedNumber + " VND" %>
                        </td>
                        <td><%= bird.getBirdSpecies()%></td>
                        <td>
                            <form action="DispatchServlet">
                                <input id="userID" type="hidden" name="userID" value="${user.getIdUser()}" />
                                <input id="birdID" type="hidden" name="birdID" value="<%= bird.getIdBird()%>" />
                                <input id="birdName" type="hidden" name="birdName" value="<%= bird.getName()%>" />
                                <input id="birdQuantity" type="hidden" name="birdQuantity" value="1" />
                                <input style="background-color: #7DB32B; color: #fff" class="btn" type="submit" name="btAction" value="Ghép cặp" class="primary-btn" />
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="3">Không có chim trống nào khả dụng</td>
                    </tr>
                    <% } %>
                </tbody>
                
            </table>
                
                
                
        </div>
                 <div class="container mtop" style="width:100%">
                     <h2 class="text-center text-danger">Danh sách chim mái</h2>
            <table class="table table-striped table-bordered" id="sortTable2">
                <thead>
                    <tr>
                        <th>Hình ảnh</th>
                        <th>Tên</th>
                        <th>Thành tích thi đấu</th>
                        <th>Lịch sử sinh sản</th>
                        <th>Phí</th>
                        <th>Loài chim</th>
                        <th>Thêm vào giỏ hàng</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<BirdDTO> fmaleList = (List<BirdDTO>) session.getAttribute("LIST_F");
                        if (fmaleList != null) {
                            for (BirdDTO birdFemale : fmaleList) {
                    %>
                    <tr>
                        <td> <img src="<%= birdFemale.getImageURL()%>" alt="alt" width="100px" height="100px" style="border-radius: 10px;"/></td>
                        <td><%= birdFemale.getName()%></td>
                        <td><%= birdFemale.getAchievement()%></td>
                        <td><%= birdFemale.getReproductiveHistory()%></td>
                        <td>
                            <%
                                DecimalFormat decimalFormat = new DecimalFormat("###,###");
                                String formattedNumber = decimalFormat.format(birdFemale.getFeeBirdNestFemale());
                            %> 
                            <%= formattedNumber + " VND" %>
                        </td>
                        <td><%= birdFemale.getBirdSpecies()%></td>
                        <td>
                            <form action="DispatchServlet">
                                <input id="userID" type="hidden" name="userID" value="${user.getIdUser()}" />
                                <input id="birdID" type="hidden" name="birdID" value="<%=birdFemale.getIdBird()%>" />
                                <input id="birdName" type="hidden" name="birdName" value="<%=birdFemale.getName()%>" />
                                <input id="birdQuantity" type="hidden" name="birdQuantity" value="1" />
                                <input style="background-color: #7DB32B; color: #fff" class="btn" type="submit" name="btAction" value="Ghép cặp" class="primary-btn" />
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="3">Không có chim mái nào khả dụng</td>
                    </tr>
                    <% } %>
                </tbody>   
            </table>  
        </div>
                </div>
         <div id='notificationPairing'>${requestScope.MESSAGE_PAIRING}</div>
        <div class="mtop"></div>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="js/toast.js"></script>
        <script>
            $(document).ready(function () {
                $('#sortTable').DataTable({
                    "language": {
                        "decimal": "",
                        "emptyTable": "No data available in table",
                        "info": " _START_ đến _END_ của _TOTAL_ bản ghi",
                        "infoEmpty": "HIển thị 0 to 0 of 0 bản ghi",
                        "infoFiltered": "(kết quả từ _MAX_ tổng số bản ghi)",
                        "infoPostFix": "",
                        "thousands": ",",
                        "lengthMenu": "Hiển thị _MENU_ bản ghi",
                        "loadingRecords": "Loading...",
                        "processing": "",
                        "search": "Tìm kiếm:",
                        "zeroRecords": "Không tìm thấy kết quả nào",
                        "paginate": {
                            "first": "F",
                            "last": "L",
                            "next": "Sau",
                            "previous": "Trước"
                        },
                        "aria": {
                            "sortAscending": ": activate to sort column ascending",
                            "sortDescending": ": activate to sort column descending"
                        }
                    }
                });
                      $('#sortTable2').DataTable({
                    "language": {
                        "decimal": "",
                        "emptyTable": "No data available in table",
                        "info": " _START_ đến _END_ của _TOTAL_ bản ghi",
                        "infoEmpty": "HIển thị 0 to 0 of 0 bản ghi",
                        "infoFiltered": "(kết quả từ _MAX_ tổng số bản ghi)",
                        "infoPostFix": "",
                        "thousands": ",",
                        "lengthMenu": "Hiển thị _MENU_ bản ghi",
                        "loadingRecords": "Loading...",
                        "processing": "",
                        "search": "Tìm kiếm:",
                        "zeroRecords": "Không tìm thấy kết quả nào",
                        "paginate": {
                            "first": "F",
                            "last": "L",
                            "next": "Sau",
                            "previous": "Trước"
                        },
                        "aria": {
                            "sortAscending": ": activate to sort column ascending",
                            "sortDescending": ": activate to sort column descending"
                        }
                    }
                });
            });
        
            var notification = document.getElementById('notificationPairing');
              if (${requestScope.MESSAGE_PAIRING != null}) {
                  notification.style.display = 'block'; // Hiển thị thông báo
                  setTimeout(function () {
                      notification.style.display = 'none'; // Ẩn thông báo sau 3 giây (3000 milliseconds)
                  }, 3500);
              }
        </script>
    </body>
</html>
