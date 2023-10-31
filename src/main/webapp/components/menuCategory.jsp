<%-- 
    Document   : menuCategory
    Created on : Sep 27, 2023, 3:10:04 PM
    Author     : ASUS
--%>

<%@page import="birdfarm.dto.UserDTO"%>
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
                        <a href="#birdPremiumId" style="height: 0px; transform: translateY(6px); background-color: transparent; border: none;color: #000; text-decoration: none; font-size: 20px; font-weight: bold;">Chim Cao Cấp</a>
                      </li>
                      <li class="nav-item nav-item-format">
                        <img style="width: 30px; height: 30px; margin-top: 7px;" src="https://www.pngarts.com/files/10/Flock-of-Birds-PNG-Pic.png" alt="Bird Lots">
                        <a href="#birdCommonId" style="height: 0px; transform: translate(3px,8px); background-color: transparent; border: none;color: #000; text-decoration: none; font-size: 17px; font-weight: bold;">Chim Phổ Thông</a>
                      </li>
                      <li class="nav-item nav-item-format">
                        <img style="width: 30px; height: 30px; margin-top: 9px;" src="https://pngimg.com/d/nest_PNG12.png" alt="Bird Nest">
                        <a href="#birdNestId" style="height: 0px; transform: translate(10px,6px); background-color: transparent; border: none;color: #000; text-decoration: none; font-size: 20px; font-weight: bold;">Tổ Chim</a>
                      </li>
                      <li class="nav-item nav-item-format">
                        <img style="width: 30px; height: 30px; margin-top: 7px;" src="https://www.pngarts.com/files/3/Single-Bird-Transparent-Image.png" alt="Breading Bird">
                        <button onclick="viewAll(this)" value="4" style="height: 0px; transform: translateY(6px); background-color: transparent; border: none;color: #000; text-decoration: none; font-size: 20px; font-weight: bold;">Chim Giống</button>
                      </li>
                      <li class="nav-item  nav-item-format">
                          <a class="nav-link" href="#" onclick="openFilter()">
                            <i class="fa-solid fa-filter" style="color: #bb8181; display: inline;"></i><span style="margin-left: 12px">Sắp xếp</span></a>
                      </li>
                    </ul>
                  </div>
                </div>
              </nav>
</div>
        <script>
             function viewAll(typeParam) {
                    var typeOfBird = typeParam.value;
                    var userIDValue = document.getElementById('UserID').value;
                     $.ajax({
                       url: "/HomePage/ViewAllBirdServlet",
                       type: "get",  // send it through get method
                       data: {
                           userID: userIDValue,
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
</header>