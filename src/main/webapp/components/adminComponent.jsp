<%-- 
    Document   : adminComponent
    Created on : 06-Oct-2023, 10:30:45
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="sidebar" data-color="green" data-image="img/sidebar-5.jpg" style="width: 26rem !important;">

        <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->


        <div class="sidebar-wrapper">
            <div class="logo">
                <a href="#" class="simple-text">
                    Bird Farm
                </a>
            </div>

            <div class="user-image" style="text-align: center;">
                <c:if test="${not empty sessionScope.user.image}">
                    <img src="${sessionScope.user.image}" style="width: 40px; height: 40px">
                </c:if>
                <c:if test="${empty sessionScope.user.image}" >
                    <img src="./img/manager.png" style="width: 50px; height: 50px; border-radius: 50%; margin: 20px;"/>
                    <!--<i class="pe-7s-user" style="font-size: 100px;"></i>-->
                </c:if>
                <p>${sessionScope.user.fullName}</p>
                <p>${sessionScope.user.roleName}</p>
            </div>

            <ul class="nav">
                <li>
                    <a href="DispatchServlet?btAction=AdminControlAccount">
                        <i class="pe-7s-user"></i>
                        <p>Tài khoản</p>
                    </a> 
                </li>

                <li>
                    <a href="DispatchServlet?btAction=AdminViewPaymentMethod">
                        <i class="pe-7s-note2"></i>
                        <p>Thanh toán</p>
                    </a>
                </li>

            </ul>
            <div style="text-align: center;">
                <a href="LogoutServlet">
                    <i class="pe-7s-back pe-rotate-180" style="font-size: 50px; margin-top: 50px; color: black;"></i>
                </a>
            </div>
        </div>
    </div>
</html>
