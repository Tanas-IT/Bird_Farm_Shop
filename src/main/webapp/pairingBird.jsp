<%-- 
    Document   : pairingBird
    Created on : Oct 10, 2023, 10:15:20 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <title>Bird Pairing</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                margin: 0;
                padding: 0;
                background-image: url("https://th.bing.com/th/id/R.d5d23d0101f8aaf38eaab7cb80e8b58b?rik=pjpz1hBcGHiQWw&riu=http%3a%2f%2fwww.hdwallpapers.in%2fdownload%2fparrot_pair_4k-1920x1080.jpg&ehk=PHZ0t%2fa71wGJ6XYR2DI2xi%2f5gIC7ILuxORjHUiCYqsM%3d&risl=&pid=ImgRaw&r=0");
                background-repeat: no-repeat;
                background-size: cover;
            }

            .form-container {
                display: flex;
                justify-content: space-around;
                margin: 20px;
            }

            .bird-form {
                background-color: #fff;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                width: 45%;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .bird-info {
                margin-top: 10px;
                font-weight: bold;
            }

            .button-container {
                text-align: center;
                margin: 20px;
            }

            .action-button {
                padding: 10px 20px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            #ownBirdFormMale,
            #storeBirdFormMale {
                display: none;
            }

            #ownBirdFormFeMale,
            #storeBirdFormFeMale {
                display: none;
            }

            #storeBirdMaleDropdown {
                margin-right: 10px;
            }

            #fileInputMale,
            #fileInputFemale {
                display: none;
            }

            #uploadButtonMale,
            #uploadButtonFemale {
                margin-top: 10px;
            }

            #previewImageMale,
            #previewImageFemale {
                display: none;
                max-width: 100%;
                max-height: 300px;
                margin-top: 20px;
            }

            #finishButtonMale,
            #finishButtonFemale {
                display: block;
                justify-content: center;
                align-items: center;
                margin: 0 auto;
                width: 134px;
                font-size: 20px;
                margin-top: 20px;
            }

            .eggImage {
                width: 200px;
                border-radius: 50%;
                display: block;
                margin: 17px auto;
                height: 180px;
            }

            #pairButton {
                display: block;
                margin: 0 auto;
            }

            #eggContainer {
                display: none;
            }

            .btn-return {
                color: #fff;
                background-color: #7DB32B;
                display: block;
                padding: 10px 20px;
                border-radius: 10px;
                width: 183px;
                margin: 0 auto;
                text-decoration: none;
            }

            .btn-return:hover {
                color: #fff;
                text-decoration: none;
            }

            .close {
                transform: translate(11px, -61px);
            }

            /* Add more CSS styling as needed */
        </style>
    </head>
    <body>
        <div class="row">
            <div class="col-md-5">
                <form style="width: 100%; height: 100%;" id="maleBirdForm" class="bird-form">
                    <h2 style="text-align: center;">Male Bird</h2>
                    <div id="maleBirdInfo" class="bird-info"></div>
                </form>
            </div>
            <div class="col-md-2">
                <button id="pairButton" type="button" class="btn btn-primary mt-3" data-toggle="modal"
                        data-target="#exampleModalCenter">
                    Ghép cặp
                </button>
            </div>
            <div class="col-md-5">
                <form style="width: 100%; height:100%" id="femaleBirdForm" class="bird-form">
                    <h2 style="text-align: center;">Female Bird</h2>
                    <div id="femaleBirdInfo" class="bird-info"></div>
                </form>
            </div>
        </div>
        <div class="row mt-4">
            <div style="text-align: center;" class="col-md-5">
                <button id="ownBirdButtonMale" class="btn btn-primary">Own Birds</button>
                <button id="storeBirdButtonMale" class="btn btn-primary">From Store</button>
            </div>
            <div style="text-align: center; transform: translateX(14%);" class="col-md-7">
                <button id="ownBirdButtonFemale" class="btn btn-primary">Own Birds</button>
                <button id="storeBirdButtonFemale" class="btn btn-primary">From Store</button>
            </div>
        </div>
        <div class="row">
            <div class="col-md-5 closeFormMale">
                <div id="ownBirdFormMale" class="bird-form mt-4" style="width:100%">
                    <h2>Enter Your Bird Information</h2>
                    <button type="button" class="close" aria-label="Close">
                        <span aria-hidden="true" onclick="birdMaleCloseForm()">&times;</span>
                    </button>
                    <div class="form-group">
                        <input type="text" id="birdMaleName" class="form-control" placeholder="Bird Name">
                    </div>
                    <div class="form-group">
                        <input type="text" id="birdMaleDescription" class="form-control" placeholder="Description">
                    </div>
                    <div class="form-group">
                        <input min="0" type="number" id="birdMaleAge" class="form-control" placeholder="Age">
                    </div>
                    <input type="file" id="fileInputMale" accept="image/*">
                    Image: <button style="display: block;" class="mb-3" id="uploadButtonMale">Tải lên</button>
                    <img style="margin: 0 auto" id="previewImageMale" src="" alt="Hình Ảnh">
                    <button style="text-align: center;" id="finishButtonMale" class="btn btn-primary">Finish</button>
                </div>

            </div>
            <div style="text-align: center; transform: translateX(40%);" class="col-md-5">
                <div id="ownBirdFormFeMale" class="bird-form mt-4" style="width:100%">
                    <h2>Enter Your Bird Information</h2>
                    <button type="button" class="close" aria-label="Close">
                        <span aria-hidden="true" onclick="BirdFemaleCloseForm()">&times;</span>
                    </button>
                    <div class="form-group">
                        <input type="text" id="birdFemaleName" class="form-control" placeholder="Bird Name">
                    </div>
                    <div class="form-group">
                        <input type="text" id="birdFemaleDescription" class="form-control" placeholder="Description">
                    </div>
                    <div class="form-group">
                        <input type="number" min="0" id="birdFemaleAge" class="form-control" placeholder="Age">
                    </div>
                    <input type="file" id="fileInputFemale" accept="image/*">
                    <button style="display:block" id="uploadButtonFemale">Tải lên</button>
                    <img style="margin: 0 auto" id="previewImageFemale" src="" alt="Hình Ảnh">
                    <button style="text-align: center;" id="finishButtonFemale" class="btn btn-primary">Finish</button>
                </div>

            </div>
        </div>

        <div class="containter mt-5">
            <div id="storeBirdFormMale" class="bird-form mt-4" style="width:40%">
                <h2>Select a Bird from the Store</h2>
                <div class="form-group">
                    <c:set var="result" value="${requestScope.MALE_BIRD_LIST}"/>
                    <c:if test="${not empty result}">
                        <table id="storeBirdMaleDropdown" class="form-control" border="1">
                            <thead>
                                <tr>
                                    <th>Tên</th>
                                    <th>Overview</th>
                                    <th>ID Bird Type</th>
                                    <th>Giá bán</th>
                                    <th>Tuổi</th>
                                    <th>Đột biến</th>
                                    <th>Loại</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${result}" var="dto">
                                    <tr> 
                                        <td>${dto.name}</td>
                                        <td>${dto.overview}</td>
                                        <td>${dto.idBirdType}</td>
                                        <td>${dto.salePrice}</td>
                                        <td>${dto.age}</td>
                                        <td>${dto.mutation}</td>
                                        <td><button>Chọn</button></td>
                                    </tr>
                                </c:forEach>
                                <!-- Thêm các hàng (rows) khác tương tự -->
                            </tbody>
                        </table>
                    </c:if>
                </div>
                <button id="storeBirdMaleDone" class="btn btn-primary">Done</button>
            </div>
            <div id="storeBirdFormFeMale" class="bird-form mt-4" style="width:40%;margin-left: auto">
                <h2>Select a Bird from the Store</h2>
                <div class="form-group">
                    <div class="table-container">
                        <c:set var="result1" value="${requestScope.FEMALE_BIRD_LIST}"/>
                        <c:if test="${not empty result1}">
                            <table id="storeBirdDropdown" class="form-control" border="1">
                                <thead>
                                    <tr>
                                        <th>Tên</th>
                                        <th>Overview</th>
                                        <th>ID Bird Type</th>
                                        <th>Giá bán</th>
                                        <th>Tuổi</th>
                                        <th>Đột biến</th>
                                        <th>Loại</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${result1}" var="dto">
                                        <tr>
                                            <td>${dto.name}</td>
                                            <td>${dto.overview}</td>
                                            <td>${dto.idBirdType}</td>
                                            <td>${dto.salePrice}</td>
                                            <td>${dto.age}</td>
                                            <td>${dto.mutation}</td>
                                            <td><button>Chọn</button></td>
                                        </tr>
                                    </c:forEach>
                                    <!-- Thêm các hàng (rows) khác tương tự -->
                                </tbody>
                            </table>
                        </c:if>
                    </div>
                    <button id="storeBirdFemaleDone" class="btn btn-primary">Done</button>
                </div>

            </div>
        </div>
        <div id="eggContainer">
            <img class="eggImage"
                 src="https://admin.nongsandungha.com/wp-content/uploads/2021/06/trung-chim-cut-giau-vitamin-va-khoang-chat11512788002.jpg"
                 alt="Quả trứng">
            <a href="home.html" class="btn-return">Back to Home Page</a>
        </div>
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Bird Pairing</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Ghép cặp thành công
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
                            document.addEventListener("DOMContentLoaded", function () {
                                const maleBirdForm = document.getElementById("maleBirdForm");
                                const femaleBirdForm = document.getElementById("femaleBirdForm");
                                const ownBirdButtonMale = document.getElementById("ownBirdButtonMale");
                                const storeBirdButtonMale = document.getElementById("storeBirdButtonMale");
                                const ownBirdButtonFemale = document.getElementById("ownBirdButtonFemale");
                                const storeBirdButtonFemale = document.getElementById("storeBirdButtonFemale");
                                const ownBirdFormMale = document.getElementById("ownBirdFormMale");
                                const storeBirdFormMale = document.getElementById("storeBirdFormMale");
                                const ownBirdFormFeMale = document.getElementById("ownBirdFormFeMale");
                                const storeBirdFormFeMale = document.getElementById("storeBirdFormFeMale");

                                const birdMaleNameInput = document.getElementById("birdMaleName");
                                const birdMaleDescriptionInput = document.getElementById("birdMaleDescription");
                                const birdMaleAgeInput = document.getElementById("birdMaleAge");

                                const birdFemaleNameInput = document.getElementById("birdFemaleName");
                                const birdFemaleDescriptionInput = document.getElementById("birdFemaleDescription");
                                const birdFemaleAgeInput = document.getElementById("birdFemaleAge");
                                const finishButtonMale = document.getElementById("finishButtonMale");
                                const finishButtonFemale = document.getElementById("finishButtonFemale");
                                const storeBirdDropdown = document.getElementById("storeBirdDropdown");
                                const storeBirdMaleDoneButton = document.getElementById("storeBirdMaleDone");
                                const storeBirdFemaleDoneButton = document.getElementById("storeBirdFemaleDone");
                                // Show own bird form when "Own Birds" button is clicked
                                ownBirdButtonMale.addEventListener("click", function () {
                                    ownBirdFormMale.style.display = "block";
                                    storeBirdFormMale.style.display = "none";
                                });

                                // Show store bird form when "From Store" button is clicked
                                storeBirdButtonMale.addEventListener("click", function () {
                                    ownBirdFormMale.style.display = "none";
                                    storeBirdFormMale.style.display = "block";
                                });

                                ownBirdButtonFemale.addEventListener("click", function () {
                                    ownBirdFormFeMale.style.display = "block";
                                    storeBirdFormFeMale.style.display = "none";
                                });

                                // Show store bird form when "From Store" button is clicked
                                storeBirdButtonFemale.addEventListener("click", function () {
                                    ownBirdFormFeMale.style.display = "none";
                                    storeBirdFormFeMale.style.display = "block";
                                });
                                // Lấy tham chiếu đến các phần tử DOM
                                const fileInputMale = document.getElementById('fileInputMale');
                                const fileInputFemale = document.getElementById('fileInputFemale');

                                const uploadButtonMale = document.getElementById('uploadButtonMale');
                                const uploadButtonFemale = document.getElementById('uploadButtonFemale');
                                const previewImageMale = document.getElementById('previewImageMale');
                                const previewImageFemale = document.getElementById('previewImageFemale');


                                // Thêm sự kiện cho nút tải lên
                                uploadButtonMale.addEventListener('click', function () {
                                    fileInputMale.click(); // Khi nút tải lên được bấm, kích hoạt sự kiện click cho input file
                                });
                                uploadButtonFemale.addEventListener('click', function () {
                                    fileInputFemale.click(); // Khi nút tải lên được bấm, kích hoạt sự kiện click cho input file
                                });
                                // Thêm sự kiện cho việc chọn tệp hình ảnh
                                fileInputMale.addEventListener('change', function () {
                                    const fileMale = fileInputMale.files[0];

                                    if (fileMale) {
                                        // Tạo một đối tượng FileReader để đọc tệp hình ảnh
                                        const readerMale = new FileReader();

                                        readerMale.onload = function (e) {
                                            // Đặt đường dẫn hình ảnh đã chọn vào thuộc tính src của thẻ <img>
                                            previewImageMale.src = e.target.result;
                                            previewImageMale.style.display = 'block';
                                        };

                                        readerMale.readAsDataURL(fileMale);
                                    }
                                });

                                fileInputFemale.addEventListener('change', function () {
                                    const fileFemale = fileInputFemale.files[0];

                                    if (fileFemale) {
                                        // Tạo một đối tượng FileReader để đọc tệp hình ảnh
                                        const readerFemale = new FileReader();

                                        readerFemale.onload = function (e) {
                                            // Đặt đường dẫn hình ảnh đã chọn vào thuộc tính src của thẻ <img>
                                            previewImageFemale.src = e.target.result;
                                            previewImageFemale.style.display = 'block';

                                        };

                                        readerFemale.readAsDataURL(fileFemale);
                                    }
                                });
                                // Display user-entered bird information on male and female forms when "Finish" is clicked
                                finishButtonMale.addEventListener("click", function () {
                                    const birdMaleName = birdMaleNameInput.value;
                                    const birdMaleDescription = birdMaleDescriptionInput.value;
                                    const birdMaleAge = birdMaleAgeInput.value;
                                    const birdMaleImage = previewImageMale;
                                    // Display information on  male forms
                                    document.getElementById("maleBirdInfo").innerHTML = `<pre>Name: ${birdMaleName}\nDescription: ${birdMaleDescription}\nAge: ${birdMaleAge}\nGender: Male\nImage: <img style="display: block !important; margin: 0 auto;width: 200px" id= "previewImageFemale" src=${birdMaleImage.src}></pre> `;
                                    ownBirdFormMale.style.display = "none";
                                });
                                finishButtonFemale.addEventListener("click", function () {
                                    const birdFemaleName = birdFemaleNameInput.value;
                                    const birdFemaleDescription = birdFemaleDescriptionInput.value;
                                    const birdFemaleAge = birdFemaleAgeInput.value;
                                    const birdFeMaleImage = previewImageFemale;
                                    // Display information on female forms
                                    document.getElementById("femaleBirdInfo").innerHTML = `<pre>Name: ${birdFemaleName}\nDescription: ${birdFemaleDescription}\nAge: ${birdFemaleAge}\nGender: Female\nImage: <img style="display: block !important; margin: 0 auto;width: 200px" id= "previewImageFemale" src=${birdFeMaleImage.src}></pre> `;
                                    ownBirdFormFeMale.style.display = "none";
                                });

                                // Display selected store bird information on male or female forms when "Done" is clicked

                                storeBirdMaleDoneButton.addEventListener("click", function () {
                                    const selectedMaleBird = storeBirdDropdown.value;

                                    // You can fetch data about the selected bird from your server/database here
                                    const birdMaleInfo = {
                                        name: selectedMaleBird,
                                        description: "Description of " + selectedMaleBird,
                                        age: Math.floor(Math.random() * 10) + 1, // Simulated age
                                    };
                                    // Display information on male forms
                                    document.getElementById("maleBirdInfo").innerHTML = `<pre>Name: ${birdMaleInfo.name}\nDescription: ${birdMaleInfo.description}\nAge: ${birdMaleInfo.age}\nGender: Male</pre>`;
                                    storeBirdFormMale.style.display = "none";
                                });
                                storeBirdFemaleDoneButton.addEventListener("click", function () {
                                    const selectedFemaleBird = storeBirdDropdown.value;

                                    // You can fetch data about the selected bird from your server/database here
                                    const birdFemaleInfo = {
                                        name: selectedFemaleBird,
                                        description: "Description of " + selectedFemaleBird,
                                        age: Math.floor(Math.random() * 10) + 1, // Simulated age
                                    };

                                    // Display information on  female forms
                                    document.getElementById("femaleBirdInfo").textContent = `<pre>Name: ${birdFemaleInfo.name} Description: ${birdFemaleInfo.description} Age: ${birdFemaleInfo.age} Gender: Female</pre>`;
                                    storeBirdFormFeMale.style.display = "none";
                                });
                            });

                            const eggContainer = document.getElementById("eggContainer");
                            const pairButton = document.getElementById("pairButton");

                            pairButton.addEventListener("click", function () {
                                setTimeout(() => {
                                    eggContainer.style.display = "block";
                                }, 500);
                            });

                            function BirdFemaleCloseForm() {
                                // You can add your logic here to submit the form data or perform other actions
                                // For now, let's just close the form
                                ownBirdFormFeMale.style.display = 'none';
                            }
                            function birdMaleCloseForm() {
                                ownBirdFormMale.style.display = 'none';
                            }
        </script>
    </body>
</html>
