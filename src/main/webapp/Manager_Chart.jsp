<!doctype html>
<html lang="en">

    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <head>
        <meta charset="utf-8" />
        <link rel="icon" type="image/png" href="img/favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />

        <!-- Font & img CSS     -->
        <link href="css/font-img.css" rel="stylesheet" />
        <!-- Bootstrap core CSS     -->
        <link href="css/bootstrap1.min.css" rel="stylesheet" />

        <!-- Animation library for notifications   -->
        <link href="css/animate.min.css" rel="stylesheet" />

        <!--  Light Bootstrap Table core CSS    -->
        <link href="css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet" />


        <!--  CSS for Demo Purpose, don't include it in your project     -->
        <link href="css/demo.css" rel="stylesheet" />

        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="fonts/themify-icons/themify-icons.css">
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>


        <!--     Fonts and icons     -->
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
        <link href="css/pe-icon-7-stroke.css" rel="stylesheet" />
    </head>

    <body>

        <div class="wrapper">
            <div class="sidebar" data-color="green" data-image="assets/img/sidebar-5.jpg">

                <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->


                <div class="sidebar-wrapper">
                    <div class="logo" style="height: 91px">
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


            <div class="main-panel">
                <nav class="navbar navbar-default navbar-fixed">
                    <div class="container-fluid">
                        

                    </div>
                </nav>


                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="container-fluid px-4">
                                <h1 class="title text-center">Bảng số liệu thống kê</h1>
                                <br>
                                        
                                        <br>
                                        
                                        <br>
                                <div class="dateFromTo" style="font-size: 15px ">
                                    <form action="DispatchServlet">
                                        Từ: 
                                        <input class="" type="date" id="start" name="start" value="${start}">
                                        Đến: 
                                        <input type="date" id="end" name="end" value="${end}">
                                        <input class="ml-4 btn btn-danger" style="font-size: 15px " name="btAction" type="submit" value="Check"/>
                                    </form>
                                </div>
                                        <br>
                                        
                                        <br>
                                        
                                        <br>
                                <div class="row">
                                    <div class="col-xl-6">
                                        <div class="card mb-4">
                                            <div class="card-header">
                                                <i class="fas fa-chart-bar me-1"></i>
                                                Thống kê sản phẩm
                                            </div>
                                            <h4 class="text-center mt-4">Tổng số ${totalProduct} sản phẩm</h4>
                                            <div class="card-body"><canvas id="myPieChartAdminCustomers" width="100%" height="40"></canvas></div>
                                        </div>
                                    </div>
                                    <div class="col-xl-6">
                                        <div class="card mb-4">
                                            <div class="card-header">
                                                <i class="fas fa-chart-bar me-1"></i>
                                                Thống kê doanh thu
                                            </div>
                                            <div class="card-body"><canvas id="myAreaChart-1" width="100%" height="40"></canvas></div>
                                        </div>
                                    </div>
                                    <div class="col-xl-6">
                                        <div class="card mb-6">
                                            <div class="card-header">
                                                <i class="fas fa-chart-pie me-1"></i>
                                                Thống kê đơn hàng
                                            </div>
                                            <div class="card-body"><canvas id="myAreaChart-2" width="100%" height="40"></canvas></div>
                                        </div>
                                    </div>
                                    <div class="col-xl-6">
                                        <div class="card mb-4">
                                            <div class="card-header">
                                                <i class="fas fa-chart-bar me-4"></i>
                                                Thống kê đánh giá
                                            </div>
                                            <div class="card-body"><canvas id="myAreaChart-3" width="100%" height="40"></canvas></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </main>
                        </div>
                    </div>       
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
                    <script src="js/scripts.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
                    <script>
                        // Set new default font family and font color to mimic Bootstrap's default styling
                        Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
                        Chart.defaults.global.defaultFontColor = '#292b2c';
                        // Pie Chart Example
                        var ctx = document.getElementById("myPieChartAdminCustomers");
                        var myPieChart = new Chart(ctx, {
                        type: 'pie',
                                data: {
                                labels: ["Tố chim", "Chim", ],
                                        datasets: [{
                                        data: [${totalProduct1}, ${totalProduct2}, ],
                                                backgroundColor: ['#ffc107', '#28a745', '#7e3bad', '#d91a53'],
                                        }],
                                },
                        });
                        var ctx1 = document.getElementById("myAreaChart-1");
                        var myLineChart1 = new Chart(ctx1, {
                        type: 'line',
                                data: {
                                labels: [<c:forEach  items="${listChartRevenueArea}" var="revenue" > "${revenue.date}",</c:forEach>],
                                        datasets: [{
                                        label: "Daonh Thu",
                                                lineTension: 0.3,
                                                backgroundColor: "rgba(2,117,216,0.2)",
                                                borderColor: "rgba(2,117,216,1)",
                                                pointRadius: 5,
                                                pointBackgroundColor: "rgba(2,117,216,1)",
                                                pointBorderColor: "rgba(255,255,255,0.8)",
                                                pointHoverRadius: 5,
                                                pointHoverBackgroundColor: "rgba(2,117,216,1)",
                                                pointHitRadius: 50,
                                                pointBorderWidth: 2,
                                                data: [<c:forEach  items="${listChartRevenueArea}" var="revenue" > "${revenue.value}",</c:forEach>],
                                        }],
                                },
                                options: {
                                scales: {
                                xAxes: [{
                                time: {
                                unit: 'date'
                                },
                                        gridLines: {
                                        display: false
                                        },
                                        ticks: {
                                        maxTicksLimit: 7
                                        }
                                }],
                                        yAxes: [{
                                        ticks: {
                                        min: 0,
                                                max: ${maxListChartRevenueArea},
                                                maxTicksLimit: 5
                                        },
                                                gridLines: {
                                                color: "rgba(0, 0, 0, .125)",
                                                }
                                        }],
                                },
                                        legend: {
                                        display: false
                                        }
                                }
                        });
                        var ctx2 = document.getElementById("myAreaChart-2");
                        var myLineChart2 = new Chart(ctx2, {
                        type: 'line',
                                data: {
                                labels: [<c:forEach  items="${listOrder}" var="customer" > "${customer.date}",</c:forEach>],
                                        datasets: [{
                                        label: "Khách hàng",
                                                lineTension: 0.3,
                                                backgroundColor: "rgba(2,117,216,0.2)",
                                                borderColor: "rgba(2,117,216,1)",
                                                pointRadius: 5,
                                                pointBackgroundColor: "rgba(2,117,216,1)",
                                                pointBorderColor: "rgba(255,255,255,0.8)",
                                                pointHoverRadius: 5,
                                                pointHoverBackgroundColor: "rgba(2,117,216,1)",
                                                pointHitRadius: 50,
                                                pointBorderWidth: 2,
                                                data: [<c:forEach  items="${listOrder}" var="customer" > "${customer.value}",</c:forEach>],
                                        }],
                                },
                                options: {
                                scales: {
                                xAxes: [{
                                time: {
                                unit: 'date'
                                },
                                        gridLines: {
                                        display: false
                                        },
                                        ticks: {
                                        maxTicksLimit: 7
                                        }
                                }],
                                        yAxes: [{
                                        ticks: {
                                        min: 0,
                                                max: ${maxListOrderArea},
                                                maxTicksLimit: 5
                                        },
                                                gridLines: {
                                                color: "rgba(0, 0, 0, .125)",
                                                }
                                        }],
                                },
                                        legend: {
                                        display: false
                                        }
                                }
                        });
                    </script>  
                    <script>
                        // Set new default font family and font color to mimic Bootstrap's default styling
                        Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
                        Chart.defaults.global.defaultFontColor = '#292b2c';
                        // Area Chart Example
                        var ctx1 = document.getElementById("myAreaChart-1");
                        var myLineChart1 = new Chart(ctx1, {
                        type: 'line',
                                data: {
                                labels: [<c:forEach  items="${listChartRevenueArea}" var="revenue" > "${revenue.date}",</c:forEach>],
                                        datasets: [{
                                        label: "Daonh Thu",
                                                lineTension: 0.3,
                                                backgroundColor: "rgba(2,117,216,0.2)",
                                                borderColor: "rgba(2,117,216,1)",
                                                pointRadius: 5,
                                                pointBackgroundColor: "rgba(2,117,216,1)",
                                                pointBorderColor: "rgba(255,255,255,0.8)",
                                                pointHoverRadius: 5,
                                                pointHoverBackgroundColor: "rgba(2,117,216,1)",
                                                pointHitRadius: 50,
                                                pointBorderWidth: 2,
                                                data: [<c:forEach  items="${listChartRevenueArea}" var="revenue" > "${revenue.value}",</c:forEach>],
                                        }],
                                },
                                options: {
                                scales: {
                                xAxes: [{
                                time: {
                                unit: 'date'
                                },
                                        gridLines: {
                                        display: false
                                        },
                                        ticks: {
                                        maxTicksLimit: 7
                                        }
                                }],
                                        yAxes: [{
                                        ticks: {
                                        min: 0,
                                                max: ${maxListChartRevenueArea},
                                                maxTicksLimit: 5
                                        },
                                                gridLines: {
                                                color: "rgba(0, 0, 0, .125)",
                                                }
                                        }],
                                },
                                        legend: {
                                        display: false
                                        }
                                }
                        });
                        var ctx2 = document.getElementById("myAreaChart-2");
                        var myLineChart2 = new Chart(ctx2, {
                        type: 'line',
                                data: {
                                labels: [<c:forEach  items="${listOrder}" var="customer" > "${customer.date}",</c:forEach>],
                                        datasets: [{
                                        label: "Đơn hàng",
                                                lineTension: 0.3,
                                                backgroundColor: "rgba(2,117,216,0.2)",
                                                borderColor: "rgba(2,117,216,1)",
                                                pointRadius: 5,
                                                pointBackgroundColor: "rgba(2,117,216,1)",
                                                pointBorderColor: "rgba(255,255,255,0.8)",
                                                pointHoverRadius: 5,
                                                pointHoverBackgroundColor: "rgba(2,117,216,1)",
                                                pointHitRadius: 50,
                                                pointBorderWidth: 2,
                                                data: [<c:forEach  items="${listOrder}" var="customer" > "${customer.value}",</c:forEach>],
                                        }],
                                },
                                options: {
                                scales: {
                                xAxes: [{
                                time: {
                                unit: 'date'
                                },
                                        gridLines: {
                                        display: false
                                        },
                                        ticks: {
                                        maxTicksLimit: 7
                                        }
                                }],
                                        yAxes: [{
                                        ticks: {
                                        min: 0,
                                                max: ${maxListOrderArea},
                                                maxTicksLimit: 5
                                        },
                                                gridLines: {
                                                color: "rgba(0, 0, 0, .125)",
                                                }
                                        }],
                                },
                                        legend: {
                                        display: false
                                        }
                                }
                        });
                        var ctx3 = document.getElementById("myAreaChart-3");
                        var myLineChart3 = new Chart(ctx3, {
                        type: 'line',
                                data: {
                                labels: [<c:forEach  items="${listChartAvgStar}" var="star" > "${star.date}",</c:forEach>],
                                        datasets: [{
                                        label: "Sao Trung Bình",
                                                lineTension: 0.3,
                                                backgroundColor: "rgba(2,117,216,0.2)",
                                                borderColor: "rgba(2,117,216,1)",
                                                pointRadius: 5,
                                                pointBackgroundColor: "rgba(2,117,216,1)",
                                                pointBorderColor: "rgba(255,255,255,0.8)",
                                                pointHoverRadius: 5,
                                                pointHoverBackgroundColor: "rgba(2,117,216,1)",
                                                pointHitRadius: 50,
                                                pointBorderWidth: 2,
                                                data: [<c:forEach  items="${listChartAvgStar}" var="star" > "${star.value}",</c:forEach>],
                                        }],
                                },
                                options: {
                                scales: {
                                xAxes: [{
                                time: {
                                unit: 'date'
                                },
                                        gridLines: {
                                        display: false
                                        },
                                        ticks: {
                                        maxTicksLimit: 7
                                        }
                                }],
                                        yAxes: [{
                                        ticks: {
                                        min: 0,
                                                max: 5,
                                                maxTicksLimit: 5
                                        },
                                                gridLines: {
                                                color: "rgba(0, 0, 0, .125)",
                                                }
                                        }],
                                },
                                        legend: {
                                        display: false
                                        }
                                }
                        });
                    </script>
                    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
                    <script src="js/datatables-simple-demo.js"></script>
                    </body>

                    </html>