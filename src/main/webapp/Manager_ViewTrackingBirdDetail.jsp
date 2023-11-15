<%-- 
    Document   : Manager_ViewFeedback
    Created on : 27-Sep-2023, 23:37:09
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
      <title>View Tracking Detail</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="img/bird_logo.png" />
    <head>
        <meta charset="utf-8" />
        <!-- Font & img CSS     -->
        <link href="css_admin/font-img.css" rel="stylesheet" />
        <!-- Bootstrap core CSS     -->
        <link href="css_admin/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <title>Manager</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="img/bird_logo.png" />

        <!-- Animation library for notifications   -->
        <link href="css_admin/animate.min.css" rel="stylesheet" />

        <!--  Light Bootstrap Table core CSS    -->
        <link href="css_admin/light-bootstrap-dashboard-1.css?v=1.4.0" rel="stylesheet" />


        <!--  CSS for Demo Purpose, don't include it in your project     -->
        <link href="css_admin/demo.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


        <!--     Fonts and icons     -->
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
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
            .form-control{
                font-size: 1.5rem !important;
            }

        </style>

    </head>
    <body>
        <div class="wrapper">
            <c:if test="${sessionScope.user.roleName == 'Quản lý'}">
                    <%@include file="components//ManagerComponent.jsp" %>
            </c:if>
            <c:if test="${sessionScope.user.roleName == 'Nhân viên'}">
                <%@include file="components//StaffComponent.jsp" %>
            </c:if>

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
                    <div class="container-fluid" >
                        
                        <div class="row">
                            <div class="col-md-8" style="font-size: 18px !important">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title" style="font-size: 25px">Cập nhật đơn ghép chim</h4>
                                    </div>
                                    <div class="card-body">
                                        <c:set var="result" value="${requestScope.TRACKING_ORDER_DETAIL_LIST}"/>
                                        <c:forEach items="${result}" var="dto" varStatus="counter">
                                            <form action="DispatchServlet"  method="post" enctype="multipart/form-data" >                                         
                                                <div class="row">
                                                    <div class="col-md-4" >
                                                        <div class="form-group" >
                                                            <label>ID</label>
                                                            <input type="text" class="form-control" disabled="" placeholder="Company" value="${dto.idRequiredOrder}">
                                                            <input type="hidden" name="txtidRequiredOrder" value="${dto.idRequiredOrder}" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 pr-1 pull-right" >
                                                        <div class="form-group">
                                                            <label>Gmail</label>
                                                            <input type="text" class="form-control" disabled="" placeholder="Username" value="${dto.email}">
                                                        </div>
                                                    </div> 
                                                    <div class="col-md-4 pr-1 pull-right" >
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
                                                            <input type="text" class="form-control" disabled="" placeholder="Company" value="${dto.birdFather}">
                                                            <input type="hidden" name="txtpriceBirdDad" value="${dto.importPriceBirdDad}" />

                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 px-1 ">
                                                        <div class="form-group">
                                                            <label>Chim mẹ</label>
                                                            <input type="text" class="form-control" disabled="" placeholder="Country" value="${dto.birdMother}">
                                                            <input type="hidden" name="txtpriceBirdMom" value="${dto.importPriceBirdMom}" />
                                                            <input type="hidden" name="txtfee" value="${dto.fee}" />
                                                            <input type="hidden" name="txtidBirdNest" value="${dto.idBirdNest}" />

                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 pl-1 pull-right" >
                                                        <div class="form-group">
                                                            <label>Trạng thái</label>
                                                            <select class="form-control" name="txtstatus" style="height: 40px">

                                                                <option value="${dto.status}">${dto.status}</option>
                                                                <option value="Chim đã đẻ">Chim đã đẻ</option>
                                                                <option value="Chim đã nở">Chim đã nở</option>
                                                                <option value="Đang giao hàng">Đang giao hàng</option>

                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3 pr-1">
                                                        <div class="form-group">
                                                            <label>Phí chim bố </label>
                                                            <fmt:formatNumber var="feeOfBirdDad" value="${dto.importPriceBirdDad}" pattern="###,### VND"/>
                                                            <input type="text" class="form-control" disabled="" placeholder="Company" value="${feeOfBirdDad}">
                                                            <input type="hidden" name="txtpriceBirdDad" value="${dto.importPriceBirdDad}" />

                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 px-1 ">
                                                        <div class="form-group">
                                                            <label>Phí chim mẹ</label>
                                                            <fmt:formatNumber var="feeOfBirdMom" value="${dto.importPriceBirdMom}" pattern="###,### VND"/>
                                                            <input type="text" class="form-control" disabled="" placeholder="Country" value="${feeOfBirdMom}">
                                                            <input type="hidden" name="txtpriceBirdMom" value="${dto.importPriceBirdMom}" />
                                                            <input type="hidden" name="txtfee" value="${dto.fee}" />
                                                            <input type="hidden" name="txtidBirdNest" value="${dto.idBirdNest}" />

                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 pl-1 pull-right" >
                                                        <div class="form-group">
                                                            <label>ID tổ chim</label>
                                                            <input type="text" class="form-control" disabled="" placeholder="Country" value="${dto.idBirdNest}">


                                                        </div>
                                                    </div>
                                                    <div class="col-md-3 pl-1 pull-right" >
                                                        <div class="form-group">
                                                            <fmt:formatNumber var="totalFee" value="${dto.fee}" pattern="###,### VND"/>
                                                            <label>Tổng phí</label>
                                                            <input type="text" class="form-control" disabled="" placeholder="Country" value="${totalFee}">


                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 pr-1">
                                                        <div class="form-group">
                                                            <label>Ảnh chim bố</label>
                                                            <br>
                                                            <img src="${dto.imageBirdFather}" 
                                                                 style="width: 150px ;height: 150px; border-radius: 50% ">

                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 px-1 ">
                                                        <div class="form-group">
                                                            <label>Ảnh chim mẹ </label>
                                                            <br>
                                                            <img src="${dto.imageBirdMother}" 
                                                                 style="width: 150px ;height: 150px; border-radius: 50% ">

                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 pr-1">
                                                        <div class="form-group">
                                                            <label>Mô tả</label>
                                                            <br>
                                                            <textarea disabled="" rows="4" cols="80" class="form-control" placeholder="Overview" 
                                                                      name="txtreason">${dto.shortDescriptionBirdFather}</textarea>


                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 px-1 ">
                                                        <div class="form-group">
                                                            <label>Mô tả</label>
                                                            <br>
                                                            <textarea disabled="" rows="4" cols="80" class="form-control" placeholder="Overview" 
                                                                      >${dto.shortDescriptionBirdMother}</textarea>

                                                        </div>
                                                    </div>

                                                </div>


                                                <c:if test="${dto.status eq 'Chim đã đẻ'|| dto.status eq 'Đang xử lý' || dto.status eq 'Đang giao hàng'}">
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
                                                            <input type="file" name="file" accept="image/*" >
                                                        </div>

                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12" >
                                                        <div class="form-group" >
                                                            <label>Nội dung</label>
                                                            <textarea  rows="6" cols="80" class="form-control" placeholder="Overview" 
                                                                       name="txtreason" value="${dto.reason}">${dto.reason}</textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">


                                                        <button style="font-size: 15px" type="button" class="btn btn-primary btn-danger btn-fill pull-right" data-toggle="modal" data-target="#exampleModalCenter">
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
                                                                        <button style="font-size: 15px" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                        <button style="font-size: 15px" name="btAction" formnovalidate value="CancelTrackingBird"
                                                                                type="submit" class="btn btn-primary btn-danger ">Xác nhận</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <button style="margin-right: 10px;font-size: 15px" type="submit" class="btn btn-info btn-fill pull-right" 
                                                                name="btAction"  value="UpdateTrackingBird">
                                                            Cập nhật
                                                        </button>

                                                        <button style="margin-right: 12px;font-size: 15px" type="button" class="btn btn-primary btn-success btn-fill pull-right" data-toggle="modal" data-target="#exampleModalCenter_2">
                                                            Hoàn thành
                                                        </button>
                                                        <div class="modal fade" id="exampleModalCenter_2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLongTitle">Hoàn thành đơn hàng</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        Bạn có chắc muốn hoàn thành đơn hàng không ?
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button style="font-size: 15px" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                        <button style="font-size: 15px"  name="btAction" value="DoneTrackingBird"
                                                                                type="submit" formnovalidate class="btn btn-primary btn-danger ">Xác nhận</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        </form>  
                                                        <button type="button" style="margin-right: 10px;font-size: 15px" 
                                                                class="btn btn-primary btn-default btn-fill pull-right" data-toggle="modal" 
                                                                data-target="#exampleModal_1" data-whatever="${dto.email}" data-ever="${dto.fullName}">Gửi Email</button>
                                                        <form action="DispatchServlet" method="POST" enctype="multipart/form-data"> 

                                                            <div class="modal fade" id="exampleModal_1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                <div class="modal-dialog" role="document">
                                                                    <div class="modal-content" style="font-size: 18px">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="exampleModalLabel" style="font-size: 20px">Gửi lời nhắn tới</h5>
                                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <div class="form-group">
                                                                                <label for="recipient-name" class="col-form-label">Email Người nhận:</label>
                                                                                <input type="email" class="form-control accountGmail" name="to" size="50" id="recipient-name">
                                                                                <input type="hidden" name="txtidRequiredOrder" value="${dto.idRequiredOrder}" />

                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label >Chủ đề:</label>
                                                                                <input type="text" name="subject" size="50" class="form-control">
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label for="message-text" class="col-form-label">Nội dung:</label>
                                                                                <textarea class="form-control" rows="10" cols="39" name="message" id="message-text"></textarea>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <input type="file" name="file" requireds>
                                                                            </div>

                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button style="font-size: 15px" type="button" class="btn btn-secondary btn-danger" data-dismiss="modal">Thoát</button>
                                                                            <button style="font-size: 15px" type="submit" class="btn btn-primary" value="ManagerSendMail" name="btAction">Gửi mail</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>

                                                <div class="clearfix"></div>



                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card card-user">
                                        <div class="card card-image1"d>
                                            <label style="font-size: 20px">Hình ảnh cập nhật</label>
                                            <c:if test="${empty dto.imgTracking}">
                                                <img src="img/noUpdateImg.png" 
                                                     style="width: 200px ;height: 200px; border-radius: 50% ">
                                            </c:if>
                                            <c:if test="${not empty dto.imgTracking}">
                                                <img src="${dto.imgTracking}" 
                                                     style="width: 200px ;height: 200px; border-radius: 50% ">
                                            </c:if>
                                        </div>
                                        <div class="card-body">
                                            <div class="author">

                                                <br>
                                                <br>
                                                <br><br>

                                                <a href="DispatchServlet?btAction=HistoryManager&txtidBirdNest=${dto.idBirdNest}">
                                                    History
                                                </a>
                                            </c:forEach>    
                                            <p class="description">

                                            </p>



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


                        </nav>
                    </div>
                </footer>
            </div>
        </div>


    </body>
    <!--   Core JS Files   -->
    <script src="js_admin/jquery.3.2.1.min.js" type="text/javascript"></script>
    <script src="js_admin/bootstrap.min.js" type="text/javascript"></script>


    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
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

    <script>
        $('#exampleModal_1').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget) // Button that triggered the modal
            var recipient = button.data('whatever') // Extract info from data-* attributes
            var recipient_2 = button.data('ever') // Extract info from data-* attributes

            // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
            // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
            var modal = $(this)
            modal.find('.modal-title').text('Gửi lời nhắn tới ' + recipient_2)
            modal.find('.modal-body .form-control.accountGmail').val(recipient)
        })
    </script>


</html>
