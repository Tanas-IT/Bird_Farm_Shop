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
                        <i class="pe-7s-user" style="font-size: 100px;"></i>
                        <p>Nguyen Duc Anh</p>
                        <p>Admin</p>
                    </div>

                    <ul class="nav">
                        <li>
                            <a href="DispatchServlet?btAction=AdminControlAccount">
                                <i class="pe-7s-user"></i>
                                <p>Tai khoan</p>
                            </a> 
                        </li>

                        <li>
                            <a href="DispatchServlet?btAction=AdminViewProduct">
                                <i class="pe-7s-note2"></i>
                                <p>Danh Muc San Pham</p>
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
