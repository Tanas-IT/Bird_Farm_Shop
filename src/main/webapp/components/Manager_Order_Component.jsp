<%-- 
    Document   : Manager_Order_Component
    Created on : 26-Oct-2023, 14:10:27
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="col-md-pull-12" style="display: block; " >
        <a class="navbar-brand" style="font-size: 20px" href="DispatchServlet?btAction=ManagerViewOrder">Đang xử lý</a>

        <a class="navbar-brand" style="font-size: 20px" href="DispatchServlet?btAction=ManagerViewBill">Đã xử lý</a>

        <a class="navbar-brand" style="font-size: 20px" href="DispatchServlet?btAction=ManagerViewDeliveryOrder">Đang giao đến</a>

        <a class="navbar-brand" style="font-size: 20px" href="DispatchServlet?btAction=ManagerSuccessOrder">Đã xong</a>

        <a class="navbar-brand" style="font-size: 20px" href="DispatchServlet?btAction=ManagerViewCancelOrder">Đơn hàng đã hủy</a>

        <a class="navbar-brand" style="font-size: 20px" href="DispatchServlet?btAction=ManagerViewCustomerCancelOrder">Đơn hàng bị hủy</a>

    </div>
    <br>
    <br>
    <br>
    <br>
</html>
