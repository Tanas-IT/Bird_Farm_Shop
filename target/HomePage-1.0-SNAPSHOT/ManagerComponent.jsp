<%-- 
    Document   : ManagerComponent
    Created on : 03-Oct-2023, 19:53:12
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <div class="sidebar" data-color="green" data-image="assets/img/sidebar-5.jpg">

        <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->


        <div class="sidebar-wrapper">
            <div class="logo">
                <a href="#" class="simple-text">
                    Bird Farm
                </a>
            </div>

            <div class="user-image" style="text-align: center;">
                <i class="pe-7s-user" style="font-size: 100px;"></i>
                <p>Nguyen Duc Anh</p>
                <p>Admin</p>
            </div>

            <ul class="nav">

                <li>
                    <a href="DispatchServlet?btAction=ManagerViewOrder">
                        <i class="pe-7s-news-paper"></i>
                        <p>Đơn hàng</p>
                    </a>
                </li>
                <li>
                    <a href="DispatchServlet?btAction=ManagerViewBill">
                        <i class="pe-7s-note2"></i>
                        <p>Hóa Đơn</p>
                    </a>
                </li>
                <li>
                    <a href="Manager_Chart.jsp">
                        <i class="pe-7s-graph1"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li>
                    <a href="DispatchServlet?btAction=ManagerViewProduct">
                        <i class="pe-7s-drawer"></i>
                        <p>Tất cả sản phẩm</p>
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
                <a href="#">
                    <i class="pe-7s-back pe-rotate-180" style="font-size: 50px; margin-top: 50px; color: black;"></i>
                </a>
            </div>
        </div>
    </div>
</html>
