<%-- 
    Document   : Manager_ViewFeedback
    Created on : 27-Sep-2023, 23:37:09
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Update</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="img/bird_logo.png" />
        <meta charset="utf-8" />
        <!-- Font & img CSS     -->
        <link href="css_admin/font-img.css" rel="stylesheet" />
        <!-- Bootstrap core CSS     -->
        <link href="css_admin/bootstrap.min.css" rel="stylesheet" />

        <!-- Animation library for notifications   -->
        <link href="css_admin/animate.min.css" rel="stylesheet" />

        <!--  Light Bootstrap Table core CSS    -->
        <link href="css_admin/light-bootstrap-dashboard-1.css?v=1.4.0" rel="stylesheet" />


        <!--  CSS for Demo Purpose, don't include it in your project     -->
        <link href="css_admin/demo.css" rel="stylesheet" />


        <!--     Fonts and icons     -->
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
        <link href="css_admin/pe-icon-7-stroke.css" rel="stylesheet" />
        <style>
            .card-image1 {
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .card-image1 img {
                border-radius: 50%;
            }
            .text-elipis{
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }

        </style>

    </head>
    <body>
        <div class="wrapper">
            <%@include file="components//ManagerComponent.jsp" %>
            <div class="main-panel">
                <!-- Navbar -->
                <nav class="navbar navbar-default navbar-fixed">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse"
                                    data-target="#navigation-example-2">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="#" style="font-size: 30px">Tạo mới sản phẩm</a>
                        </div>
                        <div class="collapse navbar-collapse">
                            <ul class="nav navbar-nav navbar-left">
                                <li>
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <p class="hidden-lg hidden-md">Dashboard</p>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- End Navbar -->
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-10" >
                                <div class="card">
                                    <div class="card-body">
                                        <form action="DispatchServlet" >        
                                            <h4 class="card-title" style="font-size: 20px">___Thêm vào Bảng BirdProduct___</h4>

                                            <div class="row">
                                                <div class="col-md-3 pr-1">
                                                    <div class="form-group">
                                                        <label>ID Chim</label>
                                                        <input type="text" required="" class="form-control" placeholder="" name="txtId" value="" >
                                                    </div>
                                                </div>
                                                <div class="col-md-3 px-1">
                                                    <div class="form-group">
                                                        <label>Tên Chim</label>
                                                        <input type="text" class="form-control" name="txtName" value="">
                                                    </div>
                                                </div>
                                                <div class="col-md-3 pl-1 " >
                                                    <div class="form-group">
                                                        <label>Giai đoạn chim</label>
                                                        <select class="form-control" name="txtperiod" style="height: 40px">
                                                            <option value="Chim non">Chim non</option>
                                                            <option value="Chim chuyền">Chim chuyền</option>
                                                            <option value="Chim trưởng thành">Chim trưởng thành</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 pl-1 " >
                                                    <div class="form-group">
                                                        <label>Giống loài</label>
                                                        <select class="form-control" name="txtidBirdSpecies" style="height: 40px">
                                                            <option value="1">Chim Chào Mào</option>
                                                            <option value="2">Chim Chích Chòe</option>
                                                            <option value="3">Chim Sơn Ca</option>
                                                            <option value="4">Chim Họa Mi</option>
                                                            <option value="5">Chim Sáo</option>
                                                            <option value="6">Chim Sẻ</option>
                                                            <option value="7">Chim Cu Gáy</option>
                                                            <option value="8">Chim Khướu</option>
                                                            <option value="9">Chim Sâu</option>
                                                            <option value="10">Chim Yến</option>
                                                            <option value="11">Chim Vàng Anh</option>
                                                            <option value="12">Chim Vẹt</option>
                                                            <option value="13">Chim Chìa Vôi</option>
                                                            <option value="14">Chim Vành Khuyên</option>
                                                            <option value="15">Chim Én</option>
                                                            <option value="16">Chim Bồ Câu</option>
                                                            <option value="17">Chim Nhồng</option>
                                                            <option value="18">Chim Trĩ</option>
                                                            <option value="19">Chim Hút Mật</option>
                                                            <option value="20">Chim sả</option>
                                                            <option value="21">Chim Thiên Đường Paradisaeidae</option>
                                                            <option value="22">Chim Giẻ</option>
                                                            <option value="23">Chim Hoàng Khuyên</option>
                                                            <option value="24">Chim Bạc Má</option>
                                                            <option value="25">Chim Quế Lâm</option>
                                                            <option value="26">Chim Huýt Cô</option>
                                                            <option value="27">Chim Cao Cát</option>
                                                            <option value="28">Chim Tiểu Mi</option>
                                                            <option value="29">Chim Công</option>
                                                            <option value="30">Chim Uyên Ương</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3 pr-1">
                                                    <div class="form-group">
                                                        <label>Số lượng</label>
                                                        <input type="number" class="form-control" placeholder="" name="txtQuantity" value="1">
                                                    </div>
                                                </div>
                                                <div class="col-md-3 px-1">
                                                    <div class="form-group">
                                                        <label>Giá nhập vào</label>
                                                        <input type="text" class="form-control" name="txtImportPrice" value="1">
                                                    </div>
                                                </div>
                                                <div class="col-md-3 pl-1">
                                                    <div class="form-group">
                                                        <label>Giá bán ra</label>
                                                        <input type="text" class="form-control" name="txtSalePrice" value="1">
                                                    </div>
                                                </div>
                                                <div class="col-md-3 pl-1">
                                                    <div class="form-group">
                                                        <label>Loại</label>
                                                        <select class="form-control" name="txtType" style="height: 40px">
                                                            <option value="0">Chim phổ thông</option>
                                                            <option value="1">Tổ chim</option>
                                                            <option value="2">Chim cao cấp</option>
                                                            <option value="3">Chim bán chạy</option>
                                                            <option value="4">Chim giống</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label>Giới thiệu về Chim</label>
                                                        <textarea rows="3" cols="30" class="form-control" placeholder="" 
                                                                  name="txtOverView" value=""></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label>Giới thiệu ngắn về chim</label>
                                                        <textarea rows="3" cols="30" class="form-control" placeholder="" 
                                                                  name="txtShortDescription" value=""></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Hình ảnh</label>
                                                        <input type="text" class="form-control" placeholder="url" 
                                                               name="txtImageURL" value="" >
                                                    </div>

                                                </div>
                                                <div class="col-md-6">

                                                    <div class="form-group">
                                                        <label>Video</label>
                                                        <textarea style="height: 41px" type="text" class="form-control text-elipis" placeholder="url" 
                                                                  name="txtvideoURL" ></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <h4 class="card-title" style="font-size: 20px">___Thêm vào Bảng BirdProfile___</h4>

                                            <div class="row">
                                                <div class="col-md-6 pr-1">
                                                    <div class="form-group">
                                                        <label>Thành tích</label>
                                                        <input type="text" class="form-control"  name="txtAchievement" value="">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 px-1">
                                                    <div class="form-group">
                                                        <label>Lịch sử</label>
                                                        <input type="text" class="form-control" name="txtreductiveHistory" value="">
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="row">
                                                <div class="col-md-3 pr-1">
                                                    <div class="form-group">
                                                        <label>Tuổi</label>
                                                        <input type="number" class="form-control"  name="txtAge" value="1">
                                                    </div>
                                                </div>
                                                <div class="col-md-3 px-1">
                                                    <div class="form-group">
                                                        <label>Đột biến</label>
                                                        <select class="form-control" name="txtMutation" style="height: 40px">
                                                            <option value="False">Không đột biến</option>
                                                            <option value="True">Đột biến</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <c:set var="result" value="${requestScope.PRODUCT_LIST}"/>
                                                <div class="col-md-3 pl-1">
                                                    <div class="form-group">
                                                            <label>Chim mẹ</label>
                                                            <select class="form-control" name="txtBirdMother" style="height: 40px">
                                                                <c:forEach var="dto" items="${result}" varStatus="counter">
                                                                    <c:if test="${dto.gender == 'Mái'}">
                                                                        <option value="${dto.idBird}">${dto.name}</option>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 pl-1">
                                                    <div class="form-group">
                                                        <label>Chim bố</label>
                                                        <select class="form-control" name="txtBirdFather" style="height: 40px">
                                                                <c:forEach var="dto" items="${result}" varStatus="counter">
                                                                    <c:if test="${dto.gender == 'Trống'}">
                                                                        <option value="${dto.idBird}">${dto.name}</option>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4 pr-1">
                                                    <div class="form-group">
                                                        <label>Giới tính</label>
                                                        <select class="form-control" name="txtGender" style="height: 40px">
                                                            <option value="Trống">Chim trống</option>
                                                            <option value="Mái">Chim mái</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 px-1">
                                                    <div class="form-group">
                                                        <label>Giá sinh ra chim con đực</label>
                                                        <input type="number" class="form-control" name="txtBirdMaleBorn" value="1">
                                                    </div>
                                                </div>
                                                <div class="col-md-4 pl-1">
                                                    <div class="form-group">
                                                        <label>Giá sinh ra chim con cái</label>
                                                        <input type="number" class="form-control" name="txtBirdFemaleBorn" value="1">
                                                    </div>
                                                </div>

                                            </div>

                                            <button style="margin-right: 15px; margin-bottom:10px;" type="submit" class="btn btn-info btn-fill pull-right" 
                                                    name="btAction" value="CreateProduct">
                                                Thêm sản phẩm
                                            </button>
                                            <button style="margin-right: 15px; margin-bottom:10px;" type="reset" class="btn btn-danger btn-fill pull-right" 
                                                    >
                                                Hủy
                                            </button>
                                            <div class="clearfix"></div>
                                        </form>  
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div class="container-fluid">
                        
                        <br>
                        <br>
                        <br>
                        <br>

                        <div class="col-md-pull-12">
                            <div class="card-font-img">

                                <div class="header-font-img-admin" style="margin-left: 20px;">
                                    <h4 class="title" style="font-size: 30px">Danh sách chim bố và chim mẹ</h4>
                                </div>
                                <div class="content-font-img" style="font-size: 20px !important">
                                    <div class="table-responsive">
                                        <c:set var="result" value="${requestScope.PRODUCT_LIST}"/>
                                        <c:if test="${not empty result}">
                                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Tên</th>
                                                        <th>Giới tính</th>
                                                        <th>Số lượng</th>
                                                        <th>Giá</th>
                                                        <th>Loại</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="dto" items="${result}" varStatus="counter">

                                                        <tr>
                                                            <td style="text-align: center">

                                                                ${dto.idBird}                                                     
                                                            </td>
                                                            <td>${dto.name}</td>
                                                            <td>${dto.gender}</td>
                                                            <td>
                                                                ${dto.quantity}
                                                            </td>
                                                            <td>
                                                                <fmt:formatNumber value="${dto.salePrice}" maxFractionDigits="0"/> VND
                                                            </td>
                                                            <td>
                                                                ${dto.period}
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>

                                        </c:if>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <footer class="footer">
                    <div class="container-fluid">
                        <nav>
                            <ul class="footer-menu">

                            </ul>
                            <p class="copyright text-center">
                            </p>
                        </nav>
                    </div>
                </footer>
            </div>
        </div>


    </body>
    <!--   Core JS Files   -->
    <script src="js_admin/jquery.3.2.1.min.js" type="text/javascript"></script>
    <script src="js_admin/bootstrap.min.js" type="text/javascript"></script>

    <!--  Charts Plugin -->
    <script src="js_admin/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="js_admin/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
    <script src="js_admin/light-bootstrap-dashboard.js?v=1.4.0"></script>

    <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
    <script src="js_admin/demo.js"></script>
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js_admin/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <script src="js_admin/demo/datatables-demo.js"></script>

</html>
