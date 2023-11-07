<%-- 
   Document   : viewCart
   Created on : Jun 17, 2023, 4:05:50 PM
   Author     : 1005h
--%>

<%@page import="birdfarm.dto.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="birdfarm.dto.BirdDTO"%>
<%@page import="birdfarm.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="Assets/css/viewCart-jsp.css">
        <title>Cart</title>
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
            UserDTO user = (UserDTO) session.getAttribute("user");
        %>
        <!-- Navbar -->
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
                    <% String image = "img/user-image.png";
                        if (user.getImage() != null) {
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
        <!-- Gioi Thieu 1 -->
        <div class="container-fluid" style="padding: 0;">
            <img src="img/feather.png" alt="Header" style="width: 100px; margin-bottom: 30px;">
        </div>
        <!-- Content -->

        <!-- table -->
        <div class="container" style="margin-top: 30px">
            <h1 style="margin-bottom: 30px; text-align: center;">Giỏ hàng của bạn</h1>
            <div class="table-responsive">
                <c:if test="${sessionScope.RCART == null}">
                    <h5 class="text-center">Giỏ hàng của bạn đang trống, Hãy nhấn vào nút "Thêm hàng" để thêm hàng vào giỏ</h5>
                    <a class="buy-bird" href="DispatchServlet?btAction=Pairing">Thêm hàng</a>
                </c:if>
                <c:if test="${sessionScope.RCART != null}">
                    <c:if test="${not empty sessionScope.RCART}">
                        <form action="DispatchServlet"  onsubmit="return checkCheckbox()"> 
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th style="text-align: center;">Sản phẩm</th>
                                        <th style="text-align: center;">STT</th>
                                        <th style="text-align: center;">Hình ảnh</th>
                                        <th style="text-align: center;">Tên</th>
                                        <th style="text-align: center;">Giới tính</th>
                                        <th style="text-align: center;">Phí ghép cặp</th>
                                        <th style="text-align: center;">Số lượng</th>
                                        <th style="text-align: center;">Tổng tiền</th>
                                        <th style="text-align: center;">Xóa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="product" varStatus="counter" items="${sessionScope.RCART.rcart}">
                                            <tr>
                                                <!--for each qua CheckOut cart kiểm tra nếu có thì check không thì ko check-->
                                                <td style="padding-top: 40px; text-align: center">
                                                <c:if test="${sessionScope.selected eq product.value.idBird}">
                                                    <input readonly="" name="selectedIndexs" checked type="checkbox" value="${counter.count-1}" onchange="updateParamValue(this)"/>
                                                    <input  name="idBird" type="hidden" value="${product.value.idBird}">
                                                </c:if>
                                                <c:if test="${sessionScope.selected ne product.value.idBird}">
                                                    <input readonly="" checked name="selectedIndexs" type="checkbox" value="${counter.count-1}" onchange="updateParamValue(this)"/>
                                                    <input name="idBird" type="hidden" value="${product.value.idBird}">
                                                </c:if>
                                            </td>
                                            <td style="padding-top: 40px; text-align: center;">
                                                ${counter.count}
                                                <input class="stt" type="hidden" name="stt" value="${counter.count}"/>
                                            </td>
                                            <td style="text-align: center;">
                                                <img src="${product.value.imageURL}" alt="alt" width="100px" height="100px" style="border-radius: 10px;"/> 
                                            </td>
                                            <td style="padding-top: 40px; text-align: center;">
                                                <h3 style="border: none; background: none; font-size: 20px; margin: 0 auto; max-width: 200px;">${product.value.name}</h3>
                                            </td>
                                            <!--Edit here-->
                                            <td style="padding-top: 40px; text-align: center;">
                                                <input style="border: none; background-color: transparent; text-align: center;" readonly="true" type="text" name="idBirdType" value="${product.value.gender}"/>
                                            </td>
                                            <td style="padding-top: 40px; text-align: center;">
                                                <c:if test="${product.value.gender == 'Trống'}">
                                                    <fmt:formatNumber var="formatPrice" value="${product.value.feeBirdNestMale}"  />
                                                    <input type="text" name="birdPrice" value="${formatPrice}" readonly="" style="border: none; background-color: transparent; font-size: 20px; text-align: center; max-width: 100px;"/>
                                                </c:if>
                                                <c:if test="${product.value.gender == 'Mái'}">
                                                    <fmt:formatNumber var="formatPrice" value="${product.value.feeBirdNestFemale}"  />
                                                    <input type="text" name="birdPrice" value="${formatPrice}" readonly="" style="border: none; background-color: transparent; font-size: 20px; text-align: center; max-width: 100px;"/>
                                                </c:if>
                                            </td>
                                            <td style="padding-top: 40px; text-align: center;">
                                                <input type="number" name="birdQuantity" max="${product.value.quantity}" value="1" min="1" style="font-size: 20px; border-radius: 10px; text-align: center; max-width: 100px;"/>
                                                <span style="position: absolute;margin: 40px -70px;font-size: 14px;" class="fst-italic text-muted">
                                                    <c:if test="${product.value.type == 1}">
                                                      Tối đa <c:out value="${product.value.quantity}" />  tổ
                                                    </c:if>
                                                    <c:if test="${product.value.type > 1}">
                                                      Tối đa <c:out value="${product.value.quantity}" />  con
                                                    </c:if>
                                                      <c:if test="${product.value.type < 1}">
                                                          <span class="text-primary">Hết hàng</span>
                                                    </c:if>
                                                </span>
                                            </td>
                                            <td style="padding-top: 40px; text-align: center; font-size: 20px; text-align: center; max-width: 100px;" >
                                                <c:if test="${product.value.gender == 'Trống'}">
                                                     <fmt:formatNumber var="formatFinalEachPrice" value="${product.value.quantity * product.value.feeBirdNestMale}"  />
                                                     ${formatFinalEachPrice}
                                                </c:if>
                                                <c:if test="${product.value.gender == 'Mái'}">
                                                     <fmt:formatNumber var="formatFinalEachPrice" value="${product.value.quantity * product.value.feeBirdNestFemale}"  />
                                                    ${formatFinalEachPrice}
                                                </c:if>
                                            </td>
                                             <!--Remove Here-->
                                            <td style="padding-top: 40px; text-align: center;">
                                                <input title="${counter.count}" onclick="RemoveItemEvent(this)" class="btn btn-success" type="button" name="btAction" value="Xóa " />
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <tr>
                                        <td colspan="9">
                                            <div class="container" style="margin-top: 20px;">
                                                <div class="row">
                                                    <div class="col-md-6" style="align-items: center;">
                                                        <fmt:formatNumber var="formatFinalPrice" value="${sessionScope.Rtotal}" pattern="#,##0 VNĐ" />
                                                        <h1>Tổng phí: ${formatFinalPrice}</h1>
                                                    </div>
                                                    <div class="col-md-6" style="text-align: right; display: flex;align-items: end;justify-content: end;margin-bottom: 24px;">
                                                        <c:url var="ChangePairing" value="DispatchServlet">
                                                            <c:param name="userID" value="${user.idUser}" />
                                                            <c:param name="btAction" value="Đổi chim giống khác" />
                                                        </c:url>
                                                        <a style="margin-right: 27px;" type="submit" href="${ChangePairing}" class="text-decoration-none btn btn-success btn-lg">Đổi chim giống khác</a>
                                                        <input type="hidden" name="userID" value="${user.idUser}" />
                                                        <input type="hidden" name="total" value="${sessionScope.Rtotal}" />
                                                        <input onclick="checkCheckbox()" type="submit" name="btAction" value = "Đặt hàng" class="btn btn-success btn-lg"/>   
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </c:if>
                </c:if>
            </div>
        </div>
        <c:forEach var="product" varStatus="counter" items="${sessionScope.RCART.rcart}">
            <form id="form${counter.count}" action="DispatchServlet">
                <input type="hidden" name="userID" value="${user.idUser}" />
                <input type="hidden" name="birdQuantity" value="1">
                <input type="hidden" name="birdIDRemove" value="${product.value.idBird}"/>
                <input class="btn btn-success" type="hidden" name="btAction" value="Xóa " />
            </form>
        </c:forEach>
        <div id='notification'>Bạn chưa chọn sản phẩm nào</div>
        <!-- Footer -->
        <div style="margin-top: 20px;">
            <%@include file="components/footerComponent.jsp" %>
        </div>
        <div id='notificationPairing'>
            ${sessionScope.PAYMENTREQUIRED}
        </div>       
        <!-- End of footer -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
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
                  document.addEventListener("DOMContentLoaded", function (event) {
                      var scrollpos = localStorage.getItem("scrollpos");
                      if (scrollpos)
                          window.scrollTo(0, scrollpos);
                  });

                  window.onscroll = function (e) {
                      localStorage.setItem("scrollpos", window.scrollY);
                  };
                  function updateParamValue(checkbox) {
                      // Lấy giá trị của checkbox
                      var checkboxValue = checkbox.value;


                      var param = document.getElementById("idBirdParam");

                      param.value = checkboxValue;
                  }
                  function calculateTotal() {
                      var quantity = document.getElementById("quantity").value;
                      var price = document.getElementById("price").value;
                      var total = quantity * price;
                      document.getElementById("total").textContent = total;
                  }
                  
                   var notification = document.getElementById('notificationPairing');
                    if (${sessionScope.PAYMENTREQUIRED != null}) {
                        notification.style.display = 'block'; // Hiển thị thông báo
                        <% session.removeAttribute("PAYMENTREQUIRED"); %>
                        setTimeout(function () {
                            notification.style.display = 'none'; // Ẩn thông báo sau 3 giây (3000 milliseconds)
                        }, 3500);
                    }
                    function RemoveItemEvent(remove) {
                        var keyRemove = [];
                        <c:forEach var="product" varStatus="counter" items="${sessionScope.RCART.rcart}">
                                keyRemove.push(${counter.count});
                        </c:forEach>
                        for(var i =0; i < keyRemove.length; i++) {
                            if(remove.getAttribute("title") == keyRemove[i]) {
                                document.getElementById("form"+keyRemove[i]).submit();
                            }
                        
                    }
                }

        </script>
    </body>
</html>