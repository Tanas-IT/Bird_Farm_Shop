<%-- 
    Document   : order-detail
    Created on : Jun 14, 2022, 7:27:41 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Hóa đơn chi tiết</title>
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="icon" type="image/x-icon" href="img/bird_logo.png" />
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body{
                margin-top:20px;
                color: #484b51;
            }
            .text-secondary-d1 {
                color: #728299!important;
            }
            .page-header {
                margin: 0 0 1rem;
                padding-bottom: 1rem;
                padding-top: .5rem;
                border-bottom: 1px dotted #e2e2e2;
                display: -ms-flexbox;
                display: flex;
                -ms-flex-pack: justify;
                justify-content: space-between;
                -ms-flex-align: center;
                align-items: center;
            }
            .page-title {
                padding: 0;
                margin: 0;
                font-size: 1.75rem;
                font-weight: 300;
            }
            .brc-default-l1 {
                border-color: #dce9f0!important;
            }

            .ml-n1, .mx-n1 {
                margin-left: -.25rem!important;
            }
            .mr-n1, .mx-n1 {
                margin-right: -.25rem!important;
            }
            .mb-4, .my-4 {
                margin-bottom: 1.5rem!important;
            }

            hr {
                margin-top: 1rem;
                margin-bottom: 1rem;
                border: 0;
                border-top: 1px solid rgba(0,0,0,.1);
            }

            .text-grey-m2 {
                color: #888a8d!important;
            }

            .text-success-m2 {
                color: #86bd68!important;
            }

            .font-bolder, .text-600 {
                font-weight: 600!important;
            }

            .text-110 {
                font-size: 110%!important;
            }
            .text-blue {
                color: #478fcc!important;
            }
            .pb-25, .py-25 {
                padding-bottom: .75rem!important;
            }

            .pt-25, .py-25 {
                padding-top: .75rem!important;
            }
            .bgc-default-tp1 {
                background-color: rgba(121,169,197,.92)!important;
            }
            .bgc-default-l4, .bgc-h-default-l4:hover {
                background-color: #f3f8fa!important;
            }
            .page-header .page-tools {
                -ms-flex-item-align: end;
                align-self: flex-end;
            }

            .btn-light {
                color: #757984;
                background-color: #f5f6f9;
                border-color: #dddfe4;
            }
            .w-2 {
                width: 1rem;
            }

            .text-120 {
                font-size: 120%!important;
            }
            .text-primary-m1 {
                color: #4087d4!important;
            }

            .text-danger-m1 {
                color: #dd4949!important;
            }
            .text-blue-m2 {
                color: #68a3d5!important;
            }
            .text-150 {
                font-size: 150%!important;
            }
            .text-60 {
                font-size: 60%!important;
            }
            .text-grey-m1 {
                color: #7b7d81!important;
            }
            .align-bottom {
                vertical-align: bottom!important;
            }
            .text-ellipsis {
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }
            .wrapper {
                margin: auto;
            }
            .tab-wrapper {
                text-align: center;
                display: block;
                margin: auto;
            }
                .tabs {
                    margin: 0;
                    padding: 0;
                    display: flex;
                    justify-content: center;
                    margin-bottom: 65px;
                }
                    .tab-link {
                        margin: 0 1%;
                        list-style: none;
                        padding: 10px 40px;
                        color: #aaa;
                        cursor: pointer;
                        font-weight: 700;
                        transition: all ease 0.5s;
                        border-bottom: solid 3px rgba(255,255,255,0.0);
                        letter-spacing: 1px;
                    }
                    .tab-link a {
                        color: #aaa;
                        cursor: pointer;
                        font-weight: 700;
                        text-decoration: none;
                    }
                    .tab-link:hover {
                        color: #999;
                        border-color: #999;
                    }
                    .tab-link.active{
                        color: #333;
                        border-color: #333;
                    }
                    .tab-link:nth-of-type(2).active {
                        border-color: #EE6534;
                    }
                    .tab-link:nth-of-type(2).active a {
                        color: #EE6534;
                    }
                    .tab-link:nth-of-type(1).active {
                        border-color: #1790D2;
                    }
                    .tab-link:nth-of-type(1).active a {
                        color: #1790D2;
                    }
                    .content-wrapper {
                        padding: 40px 80px;
                    }
                    .tab-content {
                        display: none;
                        text-align: center;
                        color: #888;
                        font-weight: 300;
                        font-size: 15px;
                        opacity: 0;
                        transform: translateY(15px);
                        animation: fadeIn 0.5s ease 1 forwards;
                    }
                    .tab-content.active {
                        display: block;
                    }
                    @keyframes fadeIn {
                        100%
                        opacity: 1;
                        transform: none;}
        </style>
    </head>
    <body>
        <c:set var="checkStatus" value="" />
        <c:set var="idOrder" value="" />
        <c:set var="idBird" value="" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
        <div class="wrapper">
            <div class="tab-wrapper">
                <ul class="tabs">
                    <li class="tab-link" data-tab="1">
                        <a style="padding: 20px;" href="DispatchServlet?btAction=HistoryPairingDetail&idOrder=${sessionScope.idRequireOrder}">Xem trạng thái đơn hàng</a>
                    </li>
                     <li class="tab-link active" data-tab="2">
                         <a href="#" >
                            Xem chi tiết đơn ghép chim
                         </a>
                        </li>
                </ul>
           </div>
                        <c:set var="feeBirdNestMale" value=""/>
                        <c:set var="feeBirdNestFeMale" value=""/>
        </div>
        <div style="margin-bottom: 20px;" class="page-content container">
            <div class="page-header text-blue-d2">
                <h1 class="page-title text-secondary-d1">
                    <small class="page-info">
                        <i class="fa fa-angle-double-right text-80"></i>
                        <c:forEach var="orderItem" items="${requestScope.listMyRequiredOrderinDetail}" varStatus="count">
                            <c:if test="${count.index == 0}">
                                Mã hóa đơn: ${orderItem.idRequiredOrder}
                                 <c:set var="idOrder" value="${orderItem.idRequiredOrder}" />
                            </small>
                        </h1>
                    </div>
                    <div class="container px-0">
                        <div class="row mt-4">
                            <div class="col-12 col-lg-12">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="text-center text-150">
                                            <i class="fa fa-book fa-2x text-success-m2 mr-1"></i>
                                            <span class="text-default-d3">Thông tin chi tiết của hóa đơn</span>
                                        </div>
                                    </div>
                                </div>

                                <hr class="row brc-default-l1 mx-n1 mb-4" />
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div>
                                            <span class="text-sm text-grey-m2 align-middle">Họ và tên:</span>
                                            <span class="text-600 text-110 text-blue align-middle">${orderItem.receiverName}</span>
                                        </div>
                                        <div class="text-grey-m2">
                                            <div class="my-1">
                                                Địa chỉ: ${orderItem.receiverAddress}
                                            </div>
                                            <div class="my-1">Số điện thoại: <i class="fa fa-phone fa-flip-horizontal text-secondary"></i> <b class="text-600">${orderItem.receiverPhoneNumber}</b></div>
                                             <div class="my-1">
                                                <c:if test="${orderItem.paymentID == 2}">
                                                     Hình thức thanh toán: Online Banking qua VNPAY
                                                </c:if>
                                                <c:if test="${orderItem.paymentID == 1}">
                                                     Hình thức thanh toán: Thanh toán trực tiếp
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-95 col-sm-6 align-self-start d-sm-flex justify-content-end">
                                        <hr class="d-sm-none" />
                                        <div class="text-grey-m2">
                                            <div class="mt-1 mb-2 text-secondary-m1 text-600 text-125">
                                                Hóa đơn
                                            </div>
                                            <div class="my-2"><i class="fa fa-circle text-blue-m2 text-xs mr-1"></i> <span class="text-600 text-90">ID:</span> ${orderItem.idRequiredOrder}</div>
                                            <div class="my-2"><i class="fa fa-circle text-blue-m2 text-xs mr-1"></i> <span class="text-600 text-90">Ngày tạo:</span> ${orderItem.createdDate}</div>
                                            <div class="my-2"><i class="fa fa-circle text-blue-m2 text-xs mr-1"></i> <span class="text-600 text-90">Trạng thái: </span> <span class="badge badge-warning badge-pill px-25">
                                                    ${orderItem.status}
                                                    <c:set var="checkStatus" value="${orderItem.status}" />
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                        <div class="mt-4">
                             <p style="color: red;">***Hóa đơn còn đang cập nhật: Phí có thể thay đổi</p>
                            <div class="row text-600 text-white bgc-default-tp1 py-25">
                                <div class="d-none d-sm-block col-1">STT</div>
                                <div class="d-none d-sm-block col-2">Hình ảnh</div>
                                <div class="d-none d-sm-block col-2">Tên sản phẩm</div>
                                <div class="col-9 col-sm-2">Mô tả</div>
                                <div class="d-none d-sm-block col-2 col-sm-1">Số lượng</div>
                                <div class="d-none d-sm-block col-sm-2">Phí</div>
                                <div class="col-2">Tổng phí</div>
                            </div>
                            <c:forEach var="orderDetailItem" items="${requestScope.Required_Order_Detail}" varStatus="counter">
                                <div class="text-95 text-secondary-d3">
                                        <c:set var="idBird" value="${orderDetailItem.idBirdNest}" />
                                        <div class="row mb-2 mb-sm-0 py-25 bgc-default-l4 py-25">
                                            <div class="col-1 d-none d-sm-block">${counter.count}</div>
                                            <div class="col-2 d-none d-sm-block">
                                                <img style="width: 50%; object-fit: cover" src="${orderDetailItem.birdFatherImage}" alt="${orderDetailItem.birdFatherName}">
                                            </div>
                                            <div class="col-3 col-sm-2">${orderDetailItem.birdFatherName}</div>
                                            <div title="${orderDetailItem.descriptionOfBirdFather}" class="col-3 col-sm-2 text-ellipsis">${orderDetailItem.descriptionOfBirdFather}</div>
                                            <div class="col-1 d-none d-sm-block">1</div>
                                            <div class="col-2 d-none d-sm-block text-95">
                                                <fmt:formatNumber var="formatMalePrice" value="${orderDetailItem.feeBirdNestMale}" />
                                                <c:set var="feeBirdNestMale" value="${orderDetailItem.feeBirdNestMale}"/>${formatMalePrice}
                                            </div>
                                            <div class="col-2 col-sm-2 text-secondary-d2">
                                                <fmt:formatNumber var="formatMalePrice" value="${orderDetailItem.feeBirdNestMale}" />
                                                
                                                ${formatMalePrice} VNĐ
                                            </div>
                                        </div>
                                        <div class="row mb-2 mb-sm-0 py-25">
                                            <div class="col-1 d-none d-sm-block">${counter.count+1}</div>
                                            <div class="col-2 d-none d-sm-block">
                                                <img style="width: 50%; object-fit: cover" src="${orderDetailItem.birdMotherImage}" alt="${orderDetailItem.birdMotherName}">
                                            </div>
                                            <div class="col-3 col-sm-2">${orderDetailItem.birdMotherName}</div>
                                            <div title="${orderDetailItem.descriptionOfBirdMother}" class="col-3 col-sm-2 text-ellipsis">${orderDetailItem.descriptionOfBirdMother}</div>
                                            <div class="col-1 d-none d-sm-block">1</div>
                                            <div class="col-2 d-none d-sm-block text-95">
                                                <fmt:formatNumber var="formatFemalePrice" value="${orderDetailItem.feeBirdNestFemale}" />
                                                <c:set var="feeBirdNestFeMale" value="${orderDetailItem.feeBirdNestFemale}"/>
                                                ${formatFemalePrice}
                                            </div>
                                            <div class="col-2 col-sm-2 text-secondary-d2">
                                                <fmt:formatNumber var="formatFemalePrice" value="${orderDetailItem.feeBirdNestFemale}" />
                                                ${formatFemalePrice} VNĐ
                                            </div>
                                        </div>
                                </div>
                                <div class="row border-b-2 brc-default-l2"></div>
                            </c:forEach>
                             <p style="color: red;">***Cập nhật: Các phí tính thêm do chim đã đẻ thành công (Vui lòng thanh toán trực tiếp tại shop)</p>
                            <c:forEach var="orderItem" items="${requestScope.listMyRequiredOrderinDetail}" varStatus="count">
                                <c:if test="${orderItem.birdNestMale <= 0 and  orderItem.birdNestFemale <=0}">
                                    Chưa có cập nhật
                                </c:if>
                                <c:if test="${orderItem.birdNestMale > 0 or  orderItem.birdNestFemale > 0}">
                                <div class="row mt-3 text-600 text-white bgc-default-tp1 py-25">
                                        <div class="d-none d-sm-block col-1">STT</div>
                                        <div class="d-none d-sm-block col-2">Hình ảnh</div>
                                        <div class="d-none d-sm-block col-2">Tên sản phẩm</div>
                                        <div class="d-none d-sm-block col-3 col-sm-2">Số lượng</div>
                                        <div class="d-none d-sm-block col-sm-3">Phí thêm</div>
                                        <div class="col-2">Tổng phí thêm</div>
                                </div>
                                 <div class="text-95 text-secondary-d3">
                                        <div class="row mb-2 mb-sm-0 py-25 bgc-default-l4 py-25">
                                            <div class="col-1 d-none d-sm-block">${counter.count+1}</div>
                                            <div class="col-2 d-none d-sm-block">
                                                <img style="width: 50%; object-fit: cover" src="img/Chim_con_duc.jpg" alt="Chim con trống">
                                            </div>
                                            <div class="col-3 col-sm-2">Chim con trống</div>
                                            <div class="col-2 d-none d-sm-block">${orderItem.birdNestMale}</div>
                                            <div class="col-3 d-none d-sm-block text-95">
                                                <c:set var="feeBirdNestMale" value="${feeBirdNestMale}"/>
                                                <fmt:formatNumber var="formatBirdNestMalePrice" value="${feeBirdNestMale}" />
                                                ${formatBirdNestMalePrice}
                                            </div>
                                            <div class="col-3 col-sm-2 text-secondary-d2">
                                                <c:set var="feeBirdNestMale" value="${feeBirdNestMale * orderItem.birdNestMale}"/>
                                                <fmt:formatNumber var="formatBirdNestMalePrice" value="${feeBirdNestMale}" />
                                                ${formatBirdNestMalePrice} VNĐ
                                            </div>
                                        </div>
                                        <div class="row mb-2 mb-sm-0 py-25">
                                            <div class="col-1 d-none d-sm-block">${counter.count+1}</div>
                                            <div class="col-2 d-none d-sm-block">
                                                <img style="width: 50%; object-fit: cover" src="img/Chim_con_cai.jpg" alt="Chim con mái">
                                            </div>
                                            <div class="col-3 col-sm-2">Chim con mái</div>
                                            <div class="col-2 d-none d-sm-block">${orderItem.birdNestFemale}</div>
                                            <div class="col-3 d-none d-sm-block text-95">
                                                <c:set var="feeBirdNestFeMale" value="${feeBirdNestFeMale}" />
                                                <fmt:formatNumber var="formatBirdNestFeMalePrice" value="${feeBirdNestFeMale}" />
                                                ${formatBirdNestFeMalePrice}
                                            </div>
                                            <div class="col-2 col-sm-2 text-secondary-d2">
                                                <c:set var="feeBirdNestFeMale" value="${feeBirdNestFeMale * orderItem.birdNestFemale}" />
                                                <fmt:formatNumber var="formatBirdNestFeMalePrice" value="${feeBirdNestFeMale}" />
                                                ${formatBirdNestFeMalePrice} VNĐ
                                            </div>
                                        </div>
                                </div>
                                <c:if test="${count.index == 0}">
                                    <div class="row mt-3">
                                        <div class="col-12 col-sm-7 text-grey-d2 text-95 mt-2 mt-lg-0">
                                            Lưu ý:  <c:if test="${empty(orderItem.note)}">
                                                        Không có
                                                    </c:if>
                                                    <c:if test="${not empty(orderItem.note)}">
                                                        ${orderItem.note}
                                                    </c:if>
                                        </div>
                                        <div class="col-12 col-sm-5 text-grey text-90 order-first order-sm-last">
                                            <div class="row my-2 align-items-center bgc-primary-l3 p-2">
                                                <div class="col-7 text-right">
                                                    Tổng tiền
                                                </div>
                                                <div class="col-5">
                                                    <span class="text-150 text-success-d3 opacity-2">
                                                        <c:set var="calculateTotal" value="${orderItem.fee + feeBirdNestMale + feeBirdNestFeMale}" />
                                                         <fmt:formatNumber var="formatFinalTotalPrice" value="${calculateTotal}" />
                                                            ${formatFinalTotalPrice} VNĐ
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                 </div>
                                </c:if>
                                </c:if>
                                <c:if test="${count.index == 0 && orderItem.birdNestMale <= 0 or  orderItem.birdNestFemale <= 0}">
                                    <div class="row mt-3">
                                        <div class="col-12 col-sm-7 text-grey-d2 text-95 mt-2 mt-lg-0">
                                            Lưu ý:  <c:if test="${empty(orderItem.note)}">
                                                        Không có
                                                    </c:if>
                                                    <c:if test="${not empty(orderItem.note)}">
                                                        ${orderItem.note}
                                                    </c:if>
                                        </div>
                                        <div class="col-12 col-sm-5 text-grey text-90 order-first order-sm-last">
                                            <div class="row my-2 align-items-center bgc-primary-l3 p-2">
                                                <div class="col-7 text-right">
                                                    Tổng tiền
                                                </div>
                                                <div class="col-5">
                                                    <span class="text-150 text-success-d3 opacity-2">
                                                        <c:set var="calculateTotal" value="${orderItem.fee}" />
                                                         <fmt:formatNumber var="formatFinalTotalPrice" value="${calculateTotal}" />
                                                            ${formatFinalTotalPrice} VNĐ
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                 </div>
                                </c:if>
                            </c:forEach>
                                    <hr/>
                                    <div>
                                        <span class="text-secondary-d1 text-105">Cảm ơn vì đã mua hàng</span>
                                        <a href="myOrderPairing.jsp" style="padding: 8px" class="btn btn-info btn-bold px-4 float-right mt-3 mt-lg-0">Quay về trang lịch sử ghép chim</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
                <script type="text/javascript">
                    $('.tab-link').click( function() {
	
                                var tabID = $(this).attr('data-tab');

                                $(this).addClass('active').siblings().removeClass('active');

                                $('#tab-'+tabID).addClass('active').siblings().removeClass('active');
                        });
                </script>
            </body>
        </html>
