<%-- 
    Document   : cartBarComponent
    Created on : Mar 21, 2022, 9:24:15 AM
    Author     : KhoaHD7621
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        #feedback-button {
             position: fixed;
            top: 60%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            z-index: 999;
        }

        #feedback-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.3);
            z-index: 1000;
        }

        #feedback-form {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 500px;
            height: 400px;
            padding: 20px;
            background-color: #f2f2f2;
            border: 1px solid #ccc;
            border-radius: 4px;
            z-index: 9999;
        }

        #feedback-form h2 {
            margin-top: 0;
        }

        #feedback-form textarea {
            width: 100%;
            height: 200px;
            resize: vertical;
        }

        #feedback-form button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            margin-top: 10px;
            cursor: pointer;
        }
        .group-btn {
            display: block;
            text-align: center;
        }
        #submit-button {
            margin-right: 20px;
        }
    </style>

    <body style="z-index: 100">
        <button id="feedback-button">Gửi phản hồi</button>

        <div id="feedback-overlay"></div>

        <form action="DispatchServlet">
            <div id="feedback-form">
                <h2 style="text-align: center">Phản hồi</h2>
                <textarea name="txtFeedback" id="feedback-textarea" placeholder="Nhập feedback của bạn"></textarea>
                <label for="rateStar">Đánh giá: </label>
                <input id="rateStar" type="number" name="rateStar" min="1" max="5" /> (từ 1 - 5 sao)
                <div class="group-btn">
                    <input type="hidden" name="idUser" value="${sessionScope.user.idUser}">
                    <input type="hidden" name="birdNestName" value="${birdNestName}"/>
                    <input type="hidden" name="idRequireOrder" value="${idRequireOrder}"/>
                    <button type="submit" name="btAction" value="SendFeedback" id="submit-button">Gửi</button>
                    <button type="button"  id="cancel-button">Hủy</button>
                </div>
            </div>
        </form>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            var feedbackButton = document.getElementById("feedback-button");
            var feedbackOverlay = document.getElementById("feedback-overlay");
            var feedbackForm = document.getElementById("feedback-form");
            var cancelButton = document.getElementById("cancel-button");
            feedbackButton.addEventListener("click", function () {
            feedbackOverlay.style.display = "block";
            feedbackForm.style.display = "block";
            });
            cancelButton.addEventListener("click", function () {
            feedbackOverlay.style.display = "none";
            feedbackForm.style.display = "none";
            });

    </script>
</body>
</html>