<%-- 
    Document   : subscribeNewsLetterComponent
    Created on : Mar 14, 2022, 5:40:07 PM
    Author     : KhoaHD7621
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${empty sessionScope.LOGIN_USER}">
    <div class="subcribe-receive-email text-black">
        <div class="layer">
            <div class="container">
                <form id="form-subscribe" class="text-center pt-5 pb-5" onsubmit="return false">
                    <div class="text-danger text-uppercase title default-cursor">Theo dõi thông tin của chúng tôi</div>
                    <div class="mt-4 mb-4 label default-cursor">Nhận thông tin cập nhật qua email về ưu đãi đặc biệt của chúng tôi</div>
                    <div class="mb-3">
                        <input id="emailSubscribe" name="email" type="email" placeholder="Enter your email..." value="" required/>
                    </div>
                    <button onclick="subscribeNewsLetter()" id="subscribeEmail" class="btn-subs" type="submit" value="subscribeEmail" >Đăng kí</button>
                </form>
            </div>
        </div>
    </div>
</c:if>