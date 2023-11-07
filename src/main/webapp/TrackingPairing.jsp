<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>TimeLine</title>
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="icon" type="image/x-icon" href="img/bird_logo.png" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body {
                margin-top: 20px;
            }
            .timeline_area {
                position: relative;
                z-index: 1;
            }
            .single-timeline-area {
                position: relative;
                z-index: 1;
                padding-left: 180px;
            }
            @media only screen and (max-width: 575px) {
                .single-timeline-area {
                    padding-left: 100px;
                }
            }
            .single-timeline-area .timeline-date {
                position: absolute;
                width: 180px;
                height: 100%;
                top: 0;
                left: 0;
                z-index: 1;
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-align: center;
                -ms-flex-align: center;
                -ms-grid-row-align: center;
                align-items: center;
                -webkit-box-pack: end;
                -ms-flex-pack: end;
                justify-content: flex-end;
                padding-right: 60px;
            }
            @media only screen and (max-width: 575px) {
                .single-timeline-area .timeline-date {
                    width: 100px;
                }
            }
            .single-timeline-area .timeline-date::after {
                position: absolute;
                width: 3px;
                height: 100%;
                content: "";
                background-color: #ebebeb;
                top: 0;
                right: 30px;
                z-index: 1;
            }
            .single-timeline-area .timeline-date::before {
                position: absolute;
                width: 11px;
                height: 11px;
                border-radius: 50%;
                background-color: #f1c40f;
                content: "";
                top: 50%;
                right: 26px;
                z-index: 5;
                margin-top: -5.5px;
            }
            .single-timeline-area .timeline-date p {
                margin-bottom: 0;
                color: #020710;
                font-size: 13px;
                text-transform: uppercase;
                font-weight: 500;
            }
            .single-timeline-area .single-timeline-content {
                position: relative;
                z-index: 1;
                padding: 30px 30px 25px;
                border-radius: 6px;
                margin-bottom: 15px;
                margin-top: 15px;
                -webkit-box-shadow: 0 0.25rem 1rem 0 rgba(47, 91, 234, 0.125);
                box-shadow: 0 0.25rem 1rem 0 rgba(47, 91, 234, 0.125);
                border: 1px solid #ebebeb;
            }
            @media only screen and (max-width: 575px) {
                .single-timeline-area .single-timeline-content {
                    padding: 20px;
                }
            }
            .single-timeline-area .single-timeline-content .timeline-icon {
                -webkit-transition-duration: 500ms;
                transition-duration: 500ms;
                width: 30px;
                height: 30px;
                background-color: #f1c40f;
                -webkit-box-flex: 0;
                -ms-flex: 0 0 30px;
                flex: 0 0 30px;
                text-align: center;
                max-width: 30px;
                border-radius: 50%;
                margin-right: 15px;
            }
            .single-timeline-area .single-timeline-content .timeline-icon i {
                color: #ffffff;
                line-height: 30px;
            }
            .single-timeline-area .single-timeline-content .timeline-text h6 {
                -webkit-transition-duration: 500ms;
                transition-duration: 500ms;
            }
            .single-timeline-area .single-timeline-content .timeline-text p {
                font-size: 13px;
                margin-bottom: 0;
            }
            .single-timeline-area .single-timeline-content:hover .timeline-icon,
            .single-timeline-area .single-timeline-content:focus .timeline-icon {
                background-color: #020710;
            }
            .single-timeline-area .single-timeline-content:hover .timeline-text h6,
            .single-timeline-area .single-timeline-content:focus .timeline-text h6 {
                color: #3f43fd;
            }
            .img_noUpdate {
                border-radius: 50%;
                margin-right: 10px;
            }
            .go-to-pairing {
                margin: 30px 0 0 10px;
            }
            .myOrderPairing {
                border: none;
                color: red;
                text-decoration: none;
                font-size: 20px;
                font-weight: bold;
                background-color: transparent;

            }
            .myOrderPairing:hover {
                color: red;
                text-decoration: none;
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
                    .tab-link:nth-of-type(1).active {
                        border-color: #EE6534;
                    }
                    .tab-link:nth-of-type(1).active a {
                        color: #EE6534;
                    }
                    .tab-link:nth-of-type(2).active {
                        border-color: #1790D2;
                    }
                    .tab-link:nth-of-type(2).active a {
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
                    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

                </head>
                <body>
                    <div class="go-to-pairing">
                    <a class="myOrderPairing" href="myOrderPairing.jsp">
                        <i class="fa-solid fa-arrow-left" style="color: red; margin:0 10px"></i>   Quay lại trang lịch sử đơn ghép chim 
                        </a>
                    </div>
                    <div class="wrapper">
                        <div class="tab-wrapper">
                            <ul class="tabs">
                                <li class="tab-link active" data-tab="1">
                                    <a href="#">Xem trạng thái đơn hàng</a>
                                </li>
                                <li class="tab-link" data-tab="2">
                                    <a style="padding: 20px;" href="DispatchServlet?btAction=HistoryViewPairingDetail&idRequiredOrder=${sessionScope.RequiredOrderID}"/>
                                    Xem chi tiết đơn ghép chim</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                        <section class="timeline_area section_padding_130">
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-12 col-sm-8 col-lg-6">
                                        <div class="section_heading text-center">
                                            <h6>Theo dõi đơn hàng</h6>
                                            <h3>Thông tin cập nhật về tình trạng tổ chim theo ngày</h3>
                                            <div class="line"></div>
                                        </div>
                                    </div>
                                </div>
                                <c:set var="previousDate" value="" />
                                <% String checkStatus = ""; %>
                                <c:set var="birdNestName" value="" />
                                <c:set var="idRequireOrder" value="" />
                                <div class="row">
                                    <div class="col-12">
                                        <div class="apland-timeline-area">
                                            <c:if test="${requestScope.Order_Detail ne null}">
                                                <c:set var="myMap" value="${requestScope.Order_Detail}"></c:set>
                                                <c:forEach var="trackingItem" items="${myMap}">
                                                    <div class="single-timeline-area">
                                                        <div class="timeline-date wow fadeInLeft" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInLeft;">
                                                        <p>
                                                            <c:if test="${not empty trackingItem.key}">
                                                                ${trackingItem.key}
                                                            </c:if> 
                                                        </p>
                                                    </div>
                                                    <c:if test="${trackingItem.key ne null}">
                                                        <div class="row">
                                                            <c:if test="${item.status == 'Đã hoàn thành'}">
                                                                <div class="col-12 col-md-6 col-lg-4">
                                                                    <div class="single-timeline-content d-flex wow fadeInLeft" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInLeft;">
                                                                        <div>
                                                                            <i style="width:73px; height: 73px" class="fas fa-check-circle" style="color: #81e656;"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:if>
                                                            <c:forEach var="item" items="${trackingItem.value}">
                                                                <c:set var="birdNestName" value="${item.birdNestName}"/>
                                                                <c:set var="idRequireOrder" value="${item.idRequireOrder}" />
                                                                <div class="col-12 col-md-6 col-lg-4">
                                                                    <div class="single-timeline-content d-flex wow fadeInLeft" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInLeft;">
                                                                        <div>
                                                                            <c:if test="${empty item.imageURL}">
                                                                                <i class="fa-solid fa-dove" style="color: #39d03b;"></i>
                                                                            </c:if>
                                                                            <c:if test="${not empty item.imageURL}">
                                                                                <c:if test="${not empty item.birdNestName}">
                                                                                    <img style="width:73px; height: 73px" src="${item.imageURL}" alt="${item.birdNestName}"/> 
                                                                                    </c:if>
                                                                                    <c:if test="${empty item.birdNestName}">
                                                                                        <img style="width:73px;height: 73px" src="${item.imageURL}"/> 
                                                                                    </c:if>
                                                                                </c:if>
                                                                            </div>
                                                                            <div style="margin-left: 20px;" class="timeline-text">
                                                                            <h6>
                                                                                <c:if test="${item.status == 'Đã hoàn thành'}">
                                                                                    <% checkStatus = "Đã hoàn thành"; %>
                                                                                </c:if>
                                                                                ${item.status}
                                                                            </h6>
                                                                            <p>${item.reason}</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${empty trackingItem.key || trackingItem.key eq null}">
                                                        <div class="row">        
                                                            <div class="col-12 col-md-6 col-lg-4">
                                                                <div class="single-timeline-content d-flex wow fadeInLeft" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInLeft;">
                                                                    <div class="img_noUpdate"><i class="fa-solid fa-image" style="color: #36dd58;"></i></div>
                                                                    <div class="timeline-text">
                                                                        <h6>Chưa có cập nhật</h6>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:if> 
                                                </div>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${empty requestScope.Order_Detail || requestScope.Order_Detail eq null}">
                                            <div class="single-timeline-area">
                                                <div class="timeline-date wow fadeInLeft" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInLeft;">
                                                </div>
                                                <div class="col-12 col-md-6 col-lg-4">
                                                    <div class="single-timeline-content d-flex wow fadeInLeft" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInLeft;">
                                                        <div class="img_noUpdate"><i class="fa-solid fa-image" style="color: #36dd58;"></i></div>
                                                        <div class="timeline-text">
                                                            <h6>Chưa có cập nhật</h6>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            <% if (checkStatus == "Đã hoàn thành") { %>
                            <%@include file="components/FeedbackComponent.jsp" %>
                            <%}%>
                        </div>
                    </section>
                    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script type="text/javascript">
                            $('.tab-link').click( function() {
	
                                var tabID = $(this).attr('data-tab');

                                $(this).addClass('active').siblings().removeClass('active');

                                $('#tab-'+tabID).addClass('active').siblings().removeClass('active');
                        });
                    </script>
            </body>
        </html>