<%-- 
    Document   : ManagerComponent
    Created on : 03-Oct-2023, 19:53:12
    Author     : HP
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <div class="sidebar" data-color="green" data-image="assets/img/sidebar-5.jpg">

        <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->


        <div class="sidebar-wrapper">
            <div class="logo">
                <a href="#" class="simple-text">
                    Bird Farm Shop
                </a>
            </div>

            <div class="user-image" style="text-align: center;">
                <c:if test="${not empty sessionScope.user.image}">
                     <img src="${sessionScope.user.image}" style="width: 40px; height: 40px">
                </c:if>
                <c:if test="${empty sessionScope.user.image}" >
                    <img src="./img/manager.png" style="width: 50px; height: 50px; border-radius: 50%; margin: 20px;"/>
                </c:if>
                <p>${sessionScope.user.fullName} </p>
                <p>
                    ${sessionScope.user.roleName}
                </p>
            </div>

            <ul class="nav">

                <li>
                    <a href="DispatchServlet?btAction=ManagerViewOrder">
                        <i class="pe-7s-news-paper"></i>
                        <p>Đơn hàng</p>
                    </a>
                </li>
                <li>
                    <a href="DispatchServlet?btAction=ManagerViewFeedback">
                        <i class="pe-7s-repeat"></i>
                        <p>Phản hồi người dùng</p>
                    </a>
                </li>
                <li>
                    <a href="DispatchServlet?btAction=ManagerViewTrackingList">
                        <i class="pe-7s-note"></i>
                        <p>Theo dõi đơn hàng</p>
                    </a>
                </li>
            </ul>
            <div style="text-align: center;">
                <a href="Login.jsp">
                    <i class="pe-7s-back pe-rotate-180" style="font-size: 50px; margin-top: 50px; color: black;"></i>
                </a>
            </div>
        </div>
    </div>
</html>
