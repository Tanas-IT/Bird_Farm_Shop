<%-- 
    Document   : menuCategory
    Created on : Sep 27, 2023, 3:10:04 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header style="padding-bottom: 0 !important;" class="py-5">
        <h3 class="title-selectory navbar-brand">Chọn danh mục</h3>
        <div style="margin-top: 74px; position: fixed; z-index: 99; width: 100%;">
            <nav style="background-color: #ffe5e5 !important;" class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                  <button class="navbar-toggler d-none" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav mx-auto navbar-sub">
                      <li class="nav-item nav-item-format d-flex">
                        <img style="width: 30px; height: 30px; margin-top: 7px;" src="https://www.metalearth.com/content/images/thumbs/0002808_premium-series-parrot_1200.png" alt="Bird Premium">
                        <button onclick="viewAll(this)" value="2" style="height: 0px; transform: translateY(6px); background-color: transparent; border: none;color: #000; text-decoration: none; font-size: 20px; font-weight: bold;">Chim Cao Cấp</button>
                      </li>
                      <li class="nav-item nav-item-format">
                        <img style="width: 30px; height: 30px; margin-top: 7px;" src="https://www.pngarts.com/files/10/Flock-of-Birds-PNG-Pic.png" alt="Bird Lots">
                        <button onclick="viewAll(this)" value="0" style="height: 0px; transform: translate(3px,8px); background-color: transparent; border: none;color: #000; text-decoration: none; font-size: 17px; font-weight: bold;">Chim Phổ Thông</button>
                      </li>
                      <li class="nav-item nav-item-format">
                        <img style="width: 30px; height: 30px; margin-top: 9px;" src="https://pngimg.com/d/nest_PNG12.png" alt="Bird Nest">
                        <button onclick="viewAll(this)" value="1" style="height: 0px; transform: translate(10px,6px); background-color: transparent; border: none;color: #000; text-decoration: none; font-size: 20px; font-weight: bold;">Tổ Chim</button>
                      </li>
                      <li class="nav-item nav-item-format">
                        <img style="width: 30px; height: 30px; margin-top: 7px;" src="https://www.pngarts.com/files/3/Single-Bird-Transparent-Image.png" alt="Breading Bird">
                        <button onclick="viewAll(this)" value="4" style="height: 0px; transform: translateY(6px); background-color: transparent; border: none;color: #000; text-decoration: none; font-size: 20px; font-weight: bold;">Chim Giống</button>
                      </li>
                      <li class="nav-item  nav-item-format">
                        <a class="nav-link" href="#">
                            <i class="fa-solid fa-filter" style="color: #bb8181; display: inline;"></i><span style="margin-left: 12px">Sắp xếp</span></a>
                      </li>
                    </ul>
                  </div>
                </div>
              </nav>
</div>
</header>
<script>
    var initialContent = document.getElementById("content").innerHTML;
                function resetInterface() {
                    var parentElement = document.getElementById("content");

                    // Xóa tất cả các phần tử con trong phần tử cha
                    while (parentElement.firstChild) {
                        parentElement.removeChild(parentElement.firstChild);
                    }

                    // Khôi phục giao diện ban đầu
                    parentElement.innerHTML = initialContent;
                    $('.row-item').slick({
                    infinite: true,
                    slidesToShow: 5,
                    slidesToScroll: 1,
                    arrows: true,
                    prevArrow:"<button type='button' class='slick-prev pull-left slick-arrow'><i class='fa fa-angle-left' aria-hidden='true'></i></button>",
                    nextArrow:"<button type='button' class='slick-next pull-right slick-arrow'><i class='fa fa-angle-right' aria-hidden='true'></i></button>",
                    responsive: [
                        {
                            breakpoint: 1024,
                            settings: {
                              slidesToShow: 3,
                              slidesToScroll: 1,
                              infinite: true,
                            }
                        },
                        {
                            breakpoint: 768,
                            settings: {
                              slidesToScroll: 1,
                              slidesToShow: 3
                            }
                          },
                        {
                            breakpoint: 480,
                            settings: {
                              slidesToShow: 1,
                              slidesToScroll: 1,
                              infinite: false,
                            }
                        },

                    ]
                });
        }
         function viewAll(typeParam) {
                    var typeOfBird = typeParam.value;
                     $.ajax({
                       url: "/HomePage/ViewAllBirdServlet",
                       type: "get",  // send it through get method
                       data: {
                           idType: typeOfBird,
                       },
                       success: function (data) {
                           if (typeOfBird < 0) {
                                resetInterface();
                           } else {
                                var row = document.getElementById("content");
                                row.innerHTML = data;
                           }
                       },
                       error: function(data) {
                           console.log(data);
                        }
                    });
            }
</script>