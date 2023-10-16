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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


        <!-- Animation library for notifications   -->
        <link href="css/animate.min.css" rel="stylesheet" />

        <!--  Light Bootstrap Table core CSS    -->
        <link href="css/light-bootstrap-dashboard-1.css?v=1.4.0" rel="stylesheet" />


        <!--  CSS for Demo Purpose, don't include it in your project     -->
        <link href="css/demo.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


        <!--     Fonts and icons     -->
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
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
            .form-control{
                font-size: 1.5rem !important;
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

                        <div class="collapse navbar-collapse">
                            <ul class="nav navbar-nav navbar-left">

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
                                        <h4 class="card-title">Update Tracking</h4>
                                    </div>
                                    <div class="card-body">
                                        <c:set var="result" value="${requestScope.TRACKING_ORDER_DETAIL_LIST}"/>
                                        <c:forEach items="${result}" var="dto" varStatus="counter">
                                            <form action="DispatchServlet">                                         
                                                <div class="row">
                                                    <div class="col-md-4" >
                                                        <div class="form-group" >
                                                            <label>ID</label>
                                                            <input type="text" class="form-control" disabled="" placeholder="Company" value="${dto.idRequiredOrder}">
                                                            <input type="hidden" name="txtidRequiredOrder" value="${dto.idRequiredOrder}" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-8 pr-1 pull-right" >
                                                        <div class="form-group">
                                                            <label>Tên Khách</label>
                                                            <input type="text" class="form-control" disabled="" placeholder="Username" value="${dto.fullName}">
                                                        </div>
                                                    </div>       
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4 pr-1">
                                                        <div class="form-group">
                                                            <label>Chim bố </label>
                                                            <input type="text" class="form-control" disabled="" placeholder="Company" value="${dto.name}">
                                                            <input type="hidden" name="txtpriceBirdDad" value="${dto.importPrice}" />

                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 px-1 ">
                                                        <div class="form-group">
                                                            <label>Chim mẹ</label>
                                                            <input type="text" class="form-control" disabled="" placeholder="Country" value="${dto.name}">
                                                            <input type="hidden" name="txtpriceBirdMom" value="${dto.importPrice}" />
                                                            <input type="hidden" name="txtfeePairing" value="${dto.feePairing}" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 pl-1 pull-right" >
                                                        <div class="form-group">
                                                            <label>Trạng thái</label>
                                                            <select class="form-control" name="txtstatus" style="height: 40px">

                                                                <option>${dto.status}</option>
                                                                <option value="Chim đã đẻ">Chim đã đẻ</option>
                                                                <option value="Chim đã nở">Chim đã nở</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                              
                                                <c:if test="${dto.status eq 'Chim đã đẻ'|| dto.status eq 'Đang xử lý'}">
                                                    <style>
                                                        #chimcon {
                                                            display: none;
                                                        }
                                                    </style>
                                                </c:if>
                                                <div class="row" id="chimcon">
                                                    <div class="col-md-6 pr-1">
                                                        <div class="form-group" >
                                                            <label>Số lượng chim con đực</label>
                                                            <input class="form-control" id="numberInput" type="number" name="txtquantityBirdMaleChild" value="${dto.birdNestMale}" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 px-1">
                                                        <div class="form-group">
                                                            <label>Số lượng chim con cái</label>
                                                            <input class="form-control" id="numberInput" type="number" name="txtquantityBirdFemaleChild" value="${dto.birdNestFemale}" />
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label>Cập nhật hình ảnh</label>
                                                            <input type="text" class="form-control" placeholder="url" 
                                                                   name="txtimgTracking" value="${dto.imgTracking}" >
                                                        </div>

                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label>Nội dung</label>
                                                            <textarea rows="4" cols="80" class="form-control" placeholder="Overview" 
                                                                      name="txtreason" value="${dto.reason}">${dto.reason}</textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">

                                                        <!--                                                        <button style="margin-right: 10px" type="submit" class="btn-danger btn btn-fill pull-right" 
                                                                                                                        name="btAction" value="CancelTrackingBird">
                                                                                                                    Hủy đơn
                                                           
                                                        </button>-->
                                                        <!-- Button trigger modal -->
                                                        <!-- Button trigger modal -->
                                                        <button type="button" class="btn btn-primary btn-danger btn-fill pull-right" data-toggle="modal" data-target="#exampleModalCenter">
                                                            Hủy đơn
                                                        </button>

                                                        <!-- Modal -->
                                                        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLongTitle">Hủy đơn hàng</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        Bạn có chắc muốn hủy đơn hàng không ?
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                        <button  name="btAction" value="CancelTrackingBird"
                                                                                 type="submit" class="btn btn-primary btn-danger ">Xác nhận</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <button style="margin-right: 10px" type="submit" class="btn btn-info btn-fill pull-right" 
                                                                name="btAction" value="UpdateTrackingBird">
                                                            Cập nhật
                                                        </button>
                                                        <button style="margin-right: 10px" type="submit" class="btn-success btn btn-fill pull-right" 
                                                                name="btAction" value="DoneTrackingBird">
                                                            Hoàn thành
                                                        </button>
                                                    </div>
                                                </div>

                                                <div class="clearfix"></div>
                                            </form>  


                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card card-user">
                                        <div class="card card-image1"d>

                                            <img src="${dto.imgTracking}" 
                                                 style="width: 200px ;height: 200px; border-radius: 50% ">

                                        </div>
                                    </c:forEach>    


                                    <div class="card-body">
                                        <div class="author">

                                            <br>
                                            <br>
                                            <br><br>


                                            <p class="description">

                                            </p>

                                            <div class="card card-image1">

                                                <iframe width="100%" height="250"
                                                        src="https://www.youtube.com/embed/0WeG4_kYh6s" 
                                                        frameborder="0" allowfullscreen></iframe>

                                            </div>

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
    <!--   Core JS Files   -->
    <script src="js/jquery.3.2.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>

    <!--  Charts Plugin -->
    <script src="js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
    <script src="js/light-bootstrap-dashboard.js?v=1.4.0"></script>

    <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
    <script src="js/demo.js"></script>
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <script src="js/demo/datatables-demo.js"></script>
    <script>
        function updateInputValue(selectElement) {
            var inputElement = selectElement.previousElementSibling;
            inputElement.value = selectElement.value;
        }
    </script>
    <script>
        var numberInput = document.getElementById("numberInput");

        numberInput.addEventListener("input", function () {
            var currentValue = parseInt(numberInput.value);

            if (currentValue < 0) {
                numberInput.value = 0; // Nếu giá trị là số âm, đặt lại giá trị là 1
            }
        });
    </script>


</html>
