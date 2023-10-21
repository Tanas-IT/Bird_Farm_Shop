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
        <meta charset="utf-8" />
        <!-- Font & img CSS     -->
        <link href="css/font-img.css" rel="stylesheet" />
        <!-- Bootstrap core CSS     -->
        <link href="css/bootstrap.min.css" rel="stylesheet" />

        <!-- Animation library for notifications   -->
        <link href="css/animate.min.css" rel="stylesheet" />

        <!--  Light Bootstrap Table core CSS    -->
        <link href="css/light-bootstrap-dashboard-1.css?v=1.4.0" rel="stylesheet" />


        <!--  CSS for Demo Purpose, don't include it in your project     -->
        <link href="css/demo.css" rel="stylesheet" />


        <!--     Fonts and icons     -->
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
        <link href="css/pe-icon-7-stroke.css" rel="stylesheet" />
        <style>
            .card-image1 {
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .card-image1 img {
                border-radius: 50%;
            }
        </style>

    </head>
    <body>
        <div class="wrapper">
            <%@include file="ManagerComponent.jsp" %>
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
                            <a class="navbar-brand" href="#">Chỉnh sửa thông tin sản phẩm</a>
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
                            <div class="col-md-8">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Edit Profile</h4>
                                    </div>
                                    <div class="card-body">
                                        <c:set var="result" value="${requestScope.SHOW_UPDATE_PRODUCT}"/>
                                        <c:forEach items="${result}" var="dto" varStatus="counter">
                                            <form action="DispatchServlet">                                         
                                                <div class="row">
                                                    <div class="col-md-4 pr-1">
                                                        <div class="form-group">
                                                            <label>ID</label>
                                                            <input type="text" class="form-control" disabled="" placeholder="Company" value="${dto.idBird}">
                                                            <input type="hidden" name="txtIdBird" value="${dto.idBird}" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-8 px-1">
                                                        <div class="form-group">
                                                            <label>Tên chim</label>
                                                            <input type="text" class="form-control" disabled="" placeholder="Username" value="${dto.name}">
                                                        </div>
                                                    </div>       
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 pr-1">
                                                        <div class="form-group">
                                                            <label>Trạng thái mặt hàng   <input type="checkbox" name="txtStatus" value="ON" 
                                                                                                <c:if test="${dto.status}">
                                                                                                    checked="checked"
                                                                                                </c:if>
                                                                                                > </label>
                                                            <input type="text" class="form-control" disabled="" placeholder="Company" value="${dto.status}">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 pl-1">
                                                        <div class="form-group">
                                                            <label>Giai đoạn chim</label>
                                                            <input type="text" class="form-control"  placeholder="Last Name" name="txtPeriod" value="${dto.period}">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4 pr-1">
                                                        <div class="form-group">
                                                            <label>Số lượng</label>
                                                            <input type="text" class="form-control" placeholder="City" name="txtQuantity" value="${dto.quantity}">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 px-1">
                                                        <div class="form-group">
                                                            <label>Giá nhập vào</label>
                                                            <input type="text" class="form-control" placeholder="Country" name="txtImportPrice" value="${dto.importPrice}">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 pl-1">
                                                        <div class="form-group">
                                                            <label>Giá bán ra</label>
                                                            <input type="text" class="form-control" placeholder="ZIP Code" name="txtSalePrice" value="${dto.salePrice}">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Cập nhật hình ảnh</label>
                                                            <input type="text" class="form-control" placeholder="url" 
                                                                   name="txtImageURL" value="${dto.imageURL}" >
                                                        </div>

                                                    </div>
                                                    <div class="col-md-6">

                                                        <div class="form-group">
                                                            <label>Cập nhật Video</label>
                                                            <input type="text" class="form-control" placeholder="url" 
                                                                   name="txtvideoURL" value="${dto.videoURL}" >
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label>Thông tin của Chim</label>
                                                            <textarea rows="4" cols="80" class="form-control" placeholder="Overview" 
                                                                      name="txtOverview" value="${dto.overview}">${dto.overview}</textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <button type="submit" class="btn btn-info btn-fill pull-right" 
                                                        name="btAction" value="UpdateProduct">
                                                    Cập nhật
                                                </button>
                                                <div class="clearfix"></div>
                                            </form>  


                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card card-user">
                                        <div class="card card-image1">

                                            <img src="${dto.imageURL}" style="width: 200px; height: 200px">

                                        </div>
                                   


                                    <div class="card-body">
                                        <div class="author">

                                            <br>
                                            <br>
                                            <br><br>


                                            <p class="description">

                                            </p>

                                            <div class="card card-image1" >
                                                      ${dto.videoURL}
                                            </div>
  </c:forEach>   
                                        </div>
                                        <p class="description text-center">

                                        </p>
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
    <script src="js/jquery.3.2.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>

    <!--  Charts Plugin -->
    <script src="js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
    <script src="js/light-bootstrap-dashboard.js?v=1.4.0"></script>

    <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
    <script src="js/demo.js"></script>

</html>
