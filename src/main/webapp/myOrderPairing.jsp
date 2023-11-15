<%-- 
    Document   : myorder
    Created on : Jun 13, 2022, 3:35:42 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History Page</title>
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
        <link rel="icon" type="image/x-icon" href="img/bird_logo.png" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <script src="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"></script>
        <style>
            .title-order {
                display: flex;
                justify-content: center;
                color: red;
            }
            .back-to-homePage {
                position: relative;
                top: 55px;

            }
            .paginate_button {
                margin-left: 12px;
            }
           .Sort-button {
                text-align: center;
                background-color: #fff;
                padding:19px;
                margin-top: 50px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                margin-bottom: 20px;
            }
            .sort{
                height: 40px;
                width: 200px;
                background-color: greenyellow;
                margin-right: 25px;
                border-radius: 5px;
                border:none;
            }

            .sort.active {
                background-color: blue;
                color: #fff;
            }
            .paginate_button {
                margin-left: 12px;
            }
            .dataTables_info {
                color: #fff;
            }
            #sortTable_previous, #sortTable_next {
                background-color: blue;
                color: white;
                border-top-left-radius: 5px;
                border-bottom-left-radius: 5px;
                padding: 10px;
            }
            #sortTable_next {
                margin-left: 0;
            }
            #sortTable_paginate span {
                background-color: #fff;
                padding: 10px 0;
            }
            #sortTablePairing_previous, #sortTablePairing_next {
                background-color: blue;
                color: white;
                border-top-left-radius: 5px;
                border-bottom-left-radius: 5px;
                padding: 10px;
            }
            #sortTablePairing_next {
                margin-left: 0;
            }
            #sortTablePairing_paginate span {
                background-color: #fff;
                padding: 10px 0;
            }
            .processed {
                background-color: green;
                color: white;
                display: block;
                text-align: center;
                width: 80%;
                border-radius: 5px;
                padding: 7px;
                font-size: 17px;
                font-weight: 500;
            }
            .processing {
                background-color: #f2f208;
                display: block;
                text-align: center;
                width: 80%;
                border-radius: 5px;
                padding: 7px;
                font-size: 17px;
                font-weight: 500;
            }
            .cancel {
                background-color: red;
                display: block;
                text-align: center;
                width: 80%;
                border-radius: 5px;
                padding: 7px;
                font-size: 17px;
                font-weight: 500;
                color: #fff;
            }
            .delivery {
                background-color: blue;
                display: block;
                text-align: center;
                width: 80%;
                border-radius: 5px;
                padding: 7px;
                font-size: 17px;
                font-weight: 500;
                color: #fff;
            }
            .myOrderPairing {
                position: absolute;
                border: none;
                color: red;
                text-decoration: none;
                font-size: 20px;
                font-weight: bold;
                background-color: transparent;
                right: 22px;
                top: 6%;
               
            }
            .reproductive {
                background-color: #940B92;
                display: block;
                text-align: center;
                width: 80%;
                border-radius: 5px;
                padding: 7px;
                font-size: 17px;
                font-weight: 500;
                color: #fff;
            }
            .borned {
                background-color: #4D4C7D;
                display: block;
                text-align: center;
                width: 80%;
                border-radius: 5px;
                padding: 7px;
                font-size: 17px;
                font-weight: 500;
                color: #fff;
            }
            .myOrderPairing:hover {
                color: red;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
    <div class="go-to-homePage mt-5">
        <a  href="DispatchServlet?btAction=History" role="button" aria-expanded="false" style="border: none;color: red;text-decoration: none;font-size: 20px;font-weight: bold;background-color: transparent;">
               <i class="fa-solid fa-arrow-left" style="color: red; margin:0 10px"></i>Trở về trang đơn hàng
        </a>
    </div>
        <h2 class=" title-order" >Danh sách các đơn hàng ghép chim</h2>
        <div class="Sort-button">
            <button class="sort active" id="allFilterButton" onclick="">
                Tất cả
            </button>
            <button class="sort" id="processingFilterButton" onclick="">
                Đang xử lý
            </button>
            <button class="sort" id="ReproductiveFilterButton" onclick="">
                Chim đã đẻ
            </button>
            <button class="sort" id="BornedBirdFilterButton" onclick="">
                Chim đã nở
            </button>
            <button class="sort" id="deliveryFilterButton" onclick="">
                Đang giao hàng
            </button>
             <button class="sort" id="processedFilterButton" onclick="">
                Đã hoàn thành
            </button>
            <button class="sort" id="cancelledFilterButton" onclick="">
                Đã hủy
            </button>
        </div>
                
        <div class="container" style="max-width:98%">
            <table style="font-size: 18px;" class="table table-striped table-bordered" id="sortTable">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Ngày&nbspmua&nbsphàng</th>
                        <th>Chim Bố và Chim Mẹ</th>
                        <th>Tổng&nbspchi&nbspphí</th>
                        <th>Tình&nbsptrạng</th>
                        <th>Chi tiết</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items ="${LIST_ROD}" var="c">
                        <tr>
                            <td><a href="#">
                                    ${c.idRequireOrder}</a></td>
                            <td>
                                <fmt:formatDate value="${c.createdDate}" pattern="dd/MM/yyyy" var="formattedDateString" />
                                ${formattedDateString}
                            </td>
                            <td>${c.birdFatherName} và ${c.birdMotherName}</td>
                            <td>
                                <c:set var="bonusFee" value="${(c.feeBirdNestMale * c.birdNestMale) + (c.feeBirdNestFemale *c.birdNestFemale)}"/>
                                <fmt:formatNumber var="formatTotalPrice" value="${c.fee + bonusFee}"  />
                                ${formatTotalPrice}  VNĐ
                            </td>
                            <td> <c:choose>
                                    <c:when test="${c.status eq 'Đang xử lý'}">
                                        <span class="processing" style="background-color: yellow;">${c.status}</span>
                                    </c:when>
                                    <c:when test="${c.status eq 'Đã hoàn thành'}">
                                        <span class="processed">${c.status}</span>
                                    </c:when>
                                    <c:when test="${c.status eq 'Đang giao hàng'}">
                                        <span class="delivery">${c.status}</span>
                                    </c:when>
                                     <c:when test="${c.status eq 'Đã hủy'}">
                                        <span class="cancel" style="background-color:  red;">${c.status}</span>
                                    </c:when>
                                    <c:when test="${c.status eq 'Chim đã đẻ'}">
                                        <span class="reproductive">${c.status}</span>
                                    </c:when>
                                    <c:when test="${c.status eq 'Chim đã nở'}">
                                        <span class="borned">${c.status}</span>
                                    </c:when>
                                    <c:otherwise>
                                        ${c.status}
                                    </c:otherwise>
                                </c:choose></td>
                            <td class="text-center" >
                                <a href="DispatchServlet?btAction=HistoryPairingDetail&idOrder=${c.idRequireOrder}">
                                    <i style="font-size: 27px;" class=" fa-solid fa-eye"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            
            <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
            <script>
                $(document).ready(function () {
                    $('#sortTable').DataTable({
                        "language": {
                            "decimal": "",
                            "emptyTable": "No data available in table",
                            "info": " _START_ đến _END_ của _TOTAL_ bản ghi",
                            "infoEmpty": "HIển thị 0 to 0 of 0 bản ghi",
                            "infoFiltered": "(kết quả từ _MAX_ tổng số bản ghi)",
                            "infoPostFix": "",
                            "thousands": ",",
                            "lengthMenu": "Hiển thị _MENU_ bản ghi",
                            "loadingRecords": "Loading...",
                            "processing": "",
                            "search": "Tìm kiếm:",
                            "zeroRecords": "Không tìm thấy kết quả nào",
                            "paginate": {
                                "first": "F",
                                "last": "L",
                                "next": "Sau",
                                "previous": "Trước"
                            },
                            "aria": {
                                "sortAscending": ": activate to sort column ascending",
                                "sortDescending": ": activate to sort column descending"
                            }
                        },
                    });
                   
                    $('#processingFilterButton').click(function () {
                        // Show only rows with the "Đang xử lý" status
                        $('#sortTable tbody tr').hide();
                        $('#sortTable tbody tr td:nth-child(5):contains("Đang xử lý")').closest('tr').show();
                    });


                    $('#cancelledFilterButton').click(function () {
                        // Show only rows with the "Đã hủy" status
                        $('#sortTable tbody tr').hide();
                        $('#sortTable tbody tr td:nth-child(5):contains("Đã hủy")').closest('tr').show();
                    });

                    $('#processedFilterButton').click(function () {
                        // Show only rows with the "Đã hoàn thành" status
                        $('#sortTable tbody tr').hide();
                        $('#sortTable tbody tr td:nth-child(5):contains("Đã hoàn thành")').closest('tr').show();
                    });
                    
                    $('#ReproductiveFilterButton').click(function () {
                        // Show only rows with the "Chim đã đẻ" status
                        $('#sortTable tbody tr').hide();
                        $('#sortTable tbody tr td:nth-child(5):contains("Chim đã đẻ")').closest('tr').show();
                    });
                    
                    $('#BornedBirdFilterButton').click(function () {
                        // Show only rows with the "Chim đã đẻ" status
                        $('#sortTable tbody tr').hide();
                        $('#sortTable tbody tr td:nth-child(5):contains("Chim đã nở")').closest('tr').show();
                    });
                    
                    $('#deliveryFilterButton').click(function () {
                        // Show only rows with the "Đang giao hàng" status
                        $('#sortTable tbody tr').hide();
                        $('#sortTable tbody tr td:nth-child(5):contains("Đang giao hàng")').closest('tr').show();
                    });
                    
                    $('#allFilterButton').click(function () {
                        // Show all rows
                        $('#sortTable tbody tr').show();
                    });
                });
            </script>

            <script>
                // Get all the filter buttons
                const filterButtons = document.querySelectorAll('.sort');

                // Add click event listener to each filter button
                filterButtons.forEach(button => {
                    button.addEventListener('click', () => {
                        // Remove the 'active' class from all buttons
                        filterButtons.forEach(btn => {
                            btn.classList.remove('active');
                        });

                        // Add the 'active' class to the clicked button
                        button.classList.add('active');

                        // Apply the faded style to the rest of the buttons
                        filterButtons.forEach(btn => {
                            if (btn !== button) {
                                btn.classList.add('faded');
                            }
                        });
                    });
                });
            </script>
    </body>
</html>
