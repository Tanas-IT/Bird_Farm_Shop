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
        </style>
    </head>
    <body>
        <c:set var="checkStatus" value="" />
        <c:set var="idOrder" value="" />
        <c:set var="idBird" value="" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
        <div class="page-content container">
            <div class="page-header text-blue-d2">
                <h1 class="page-title text-secondary-d1">
                    <small class="page-info">
                        <i class="fa fa-angle-double-right text-80"></i>
                        <c:forEach var="orderItem" items="${requestScope.listMyOrderinDetail}" varStatus="count">
                            <c:if test="${count.index == 0}">
                                Mã hóa đơn: ${orderItem.idOrder}
                                <c:set var="idOrder" value="${orderItem.idOrder}" />
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
                                                <c:if test="${orderItem.paymentId == 2}">
                                                    <span>Hình thức thanh toán: Online Banking qua VNPAY</span>
                                                </c:if>
                                                <c:if test="${orderItem.paymentId == 1}">
                                                    <span>Hình thức thanh toán: Thanh toán trực tiếp</span>
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
                                                <div class="my-2"><i class="fa fa-circle text-blue-m2 text-xs mr-1"></i> <span class="text-600 text-90">ID:</span> ${orderItem.idOrder}</div>
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
                                <div class="row text-600 text-white bgc-default-tp1 py-25">
                                    <div class="d-none d-sm-block col-1">STT</div>
                                    <div class="d-none d-sm-block col-2">Hình ảnh</div>
                                    <div class="d-none d-sm-block col-2">Tên sản phẩm</div>
                                    <div class="col-9 col-sm-2">Mô tả</div>
                                    <div class="d-none d-sm-block col-2 col-sm-1">Số lượng</div>
                                    <div class="d-none d-sm-block col-sm-2">Đơn giá</div>
                                    <div class="col-2">Tổng</div>
                                </div>
                                <c:forEach var="orderDetailItem" items="${requestScope.Order_Detail}" varStatus="counter">
                                    <div class="text-95 text-secondary-d3">
                                        <c:if test="${counter.count % 2 != 0}">
                                            <c:set var="idBird" value="${orderDetailItem.bird.idBird}" />
                                            <div class="row mb-2 mb-sm-0 py-25 bgc-default-l4 py-25">
                                                <div class="col-1 d-none d-sm-block">${counter.count}</div>
                                                <div class="col-2 d-none d-sm-block">
                                                    <img style="width: 50%; object-fit: cover" src="${orderDetailItem.bird.imageURL}" alt="${orderDetailItem.bird.name}">
                                                </div>
                                                <div class="col-3 col-sm-2">${orderDetailItem.bird.name}</div>
                                                <div title="${orderDetailItem.bird.shortDescription}" class="col-3 col-sm-2 text-ellipsis">${orderDetailItem.bird.shortDescription}</div>
                                                <div class="col-1 d-none d-sm-block">${orderDetailItem.bird.quantity}</div>
                                                <div class="col-2 d-none d-sm-block text-95">
                                                    <fmt:formatNumber var="formatPrice" value="${orderDetailItem.bird.salePrice}" />
                                                    ${formatPrice}
                                                </div>
                                                <div class="col-2 col-sm-2 text-secondary-d2">
                                                    <fmt:formatNumber var="formatTotalPrice" value="${orderDetailItem.bird.quantity * orderDetailItem.bird.salePrice}" />
                                                    ${formatTotalPrice} VNĐ
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${counter.count % 2 == 0}">
                                            <div class="row mb-2 mb-sm-0 py-25">
                                                <div class="col-1 d-none d-sm-block">${counter.count}</div>
                                                <div class="col-2 d-none d-sm-block">
                                                    <img style="width: 50%; object-fit: cover" src="${orderDetailItem.bird.imageURL}" alt="${orderDetailItem.bird.name}">
                                                </div>
                                                <div class="col-3 col-sm-2">${orderDetailItem.bird.name}</div>
                                                <div title="${orderDetailItem.bird.shortDescription}" class="col-3 col-sm-2 text-ellipsis">${orderDetailItem.bird.shortDescription}</div>
                                                <div class="col-1 d-none d-sm-block">${orderDetailItem.bird.quantity}</div>
                                                <div class="col-2 d-none d-sm-block text-95">
                                                    <fmt:formatNumber var="formatPrice" value="${orderDetailItem.bird.salePrice}" />
                                                    ${formatPrice}
                                                </div>
                                                <div class="col-2 col-sm-2 text-secondary-d2">
                                                    <fmt:formatNumber var="formatTotalPrice" value="${orderDetailItem.bird.quantity * orderDetailItem.bird.salePrice}" />
                                                    ${formatTotalPrice} VNĐ
                                                </div>
                                            </div>
                                        </c:if>

                                    </div>
                                    <div class="row border-b-2 brc-default-l2"></div>
                                </c:forEach>
                                <c:forEach var="orderItem" items="${requestScope.listMyOrderinDetail}" varStatus="count">
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
                                                            <fmt:formatNumber var="formatFinalTotalPrice" value="${orderItem.total}" />
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
                                <a href="DispatchServlet?btAction=History" style="padding: 8px" class="btn btn-info btn-bold px-4 float-right mt-3 mt-lg-0">Quay về trang lịch sử</a>
                                <c:if test="${checkStatus  eq 'Đã xong'}">
                                    <%@include file="components/FeedbackOrderBirdComponent.jsp" %>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript">

        </script>
    </body>
</html>
