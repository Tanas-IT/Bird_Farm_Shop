<%-- 
    Document   : Manager_Order_Component
    Created on : 26-Oct-2023, 14:10:27
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <div class="col-md-pull-12" style="display: block; " >
        <c:set var="button" value="${param.btAction}"/>
        <c:if test="${button == 'ManagerViewOrder'}">
            <a class="navbar-brand manager-active" style="font-size: 20px" href="DispatchServlet?btAction=ManagerViewOrder">Đang xử lý</a>
        </c:if>
        <c:if test="${button != 'ManagerViewOrder'}">
            <a class="navbar-brand" style="font-size: 20px" href="DispatchServlet?btAction=ManagerViewOrder">Đang xử lý</a>
        </c:if>
        <c:if test="${button == 'ManagerViewBill'}">
            <a class="navbar-brand manager-active" style="font-size: 20px" href="DispatchServlet?btAction=ManagerViewBill">Đã xử lý</a>
        </c:if>
        <c:if test="${button != 'ManagerViewBill'}">
            <a class="navbar-brand" style="font-size: 20px" href="DispatchServlet?btAction=ManagerViewBill">Đã xử lý</a>
        </c:if>
        <c:if test="${button == 'ManagerViewDeliveryOrder'}">
            <a class="navbar-brand manager-active" style="font-size: 20px" href="DispatchServlet?btAction=ManagerViewDeliveryOrder">Đang giao đến</a>
        </c:if>
        <c:if test="${button != 'ManagerViewDeliveryOrder'}">
            <a class="navbar-brand" style="font-size: 20px" href="DispatchServlet?btAction=ManagerViewDeliveryOrder">Đang giao đến</a>
        </c:if>
        <c:if test="${button == 'ManagerSuccessOrder'}">
            <a class="navbar-brand manager-active" style="font-size: 20px" href="DispatchServlet?btAction=ManagerSuccessOrder">Đã xong</a>
        </c:if>
        <c:if test="${button != 'ManagerSuccessOrder'}">
            <a class="navbar-brand" style="font-size: 20px" href="DispatchServlet?btAction=ManagerSuccessOrder">Đã xong</a>
        </c:if>    
        <c:if test="${button == 'ManagerViewCancelOrder'}">
            <a class="navbar-brand manager-active" style="font-size: 20px" href="DispatchServlet?btAction=ManagerViewCancelOrder">Đơn hàng đã hủy</a>
        </c:if>
            
        <c:if test="${button != 'ManagerViewCancelOrder'}">
            <a class="navbar-brand" style="font-size: 20px" href="DispatchServlet?btAction=ManagerViewCancelOrder">Đơn hàng đã hủy</a>
        </c:if>
        
    </div>
    <br>
    <br>
    <br>
    <br>
</html>
<body>
    <style>
        .manager-active {
            font-size: 20px;
            background-color: red;
            height: 39px;
            border-radius: 5px;
            color: #fff;
        }
        .manager-active:hover {
            color:#fff;
        }
    </style>
</body>
