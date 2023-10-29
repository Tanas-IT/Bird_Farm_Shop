<%-- 
    Document   : HistoryShopping
    Created on : 24-Oct-2023, 23:01:32
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <title>timeline events area - Bootdey.com</title>
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

        </style>
    </head>
    <body>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
        <section class="timeline_area section_padding_130">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12 col-sm-8 col-lg-6">

                        <div class="section_heading text-center">
                            <h6>Our History</h6>
                            <h3>A brief stories of our 2 years company journey</h3>
                            <div class="line"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">

                        <div class="apland-timeline-area">
                            <c:set var="result" value="${requestScope.HISTORY_LIST}"/>
                            <c:if test="${not empty result}">
                                <c:forEach var="dto" items="${result}" varStatus="counter">
                                    <div class="single-timeline-area">
                                        <div class="timeline-date wow fadeInLeft" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInLeft;">
                                            <p>${dto.trackingDate}</p>
                                        </div>
                                        <div class="row">
                                            <div class="col-12 col-md-6 col-lg-4">
                                                <div class="single-timeline-content d-flex wow fadeInLeft" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInLeft;">
                                                    <div class="timeline-text">
                                                       
                                                       <img src="${dto.imageURL}" 
                                                                style="width: 200px ;height: 200px; border-radius: 50%; margin-left: 15px ">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6 col-lg-4">
                                                <div class="single-timeline-content d-flex wow fadeInLeft" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInLeft;">
                                                    <div class="timeline-icon"><i class="fa fa-archive" aria-hidden="true"></i></div>
                                                    <div class="timeline-text">
                                                        <h6>Trạng thái</h6>
                                                        <p>${dto.status}</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6 col-lg-4">
                                                <div class="single-timeline-content d-flex wow fadeInLeft" data-wow-delay="0.7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeInLeft;">
                                                    <div class="timeline-icon"><i class="fa fa-address-book" aria-hidden="true"></i></div>
                                                    <div class="timeline-text">
                                                        <h6>Nội dung cập nhật</h6>
                                                        <p>${dto.reason}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </c:if>

                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript">

        </script>
    </body>
</html>
