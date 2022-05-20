<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/6/2022
  Time: 3:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%--<div class="container">--%>
<%--<div id = "page-wrapper">--%>
<%--    <table border="1">--%>
<%--        <tr>--%>
<%--            <td>Username</td>--%>
<%--            <td>${myprofile.user}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>email</td>--%>
<%--            <td>${myprofile.email}</td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--    <c:url value="/updateAvatar" var="acction"/>--%>
<%--    &lt;%&ndash;@elvariable id="myprofile" type="com"&ndash;%&gt;--%>
<%--    <form:form method="post" action="${acction}" modelAttribute="myprofile" enctype="multipart/form-data" role="form" >--%>
<%--        <form:input path="file" type="file" name=""/>--%>
<%--        <form:button type="submit" name="lưu" />--%>
<%--    </form:form>--%>
<%--    <c:url value="/user/donhang" var="donhang"/>--%>
<%--    <a href="${donhang}" >Hóa đơn </a>--%>
<%--    <h1> đây là trang web frofile</h1>--%>
<%--</div>--%>
<%--</div>--%>

<div class="container">
    <div class="grid">
        <div class="grid__row ">
            <div class="gird__column--2-12">
                <div class="container__title">
                    <h1 class="container__giohang--title"><a href="<c:url value="/"/>" class="home__home">TRANG CHỦ /</a>Liên hệ</h1>
                </div>
                <div class="container--chitiet">
                    <div class="content">
                        <div class="left-side">
                            <div class="address details">
                                <i class="fas fa-map-marker-alt"></i>
                                <div class="topic">Địa chỉ</div>
                                <div class="text-one">34 Dương Thưởng, Phường Thanh Bình</div>
                                <div class="text-two">Thành Phố Đà Nẵng</div>
                            </div>
                            <div class="phone details">
                                <i class="fas fa-phone"></i>
                                <div class="topic">Số điện thoại</div>
                                <div class="text-one">0975664139</div>
                                <div class="text-two">0975113461</div>
                            </div>
                            <div class="email details">
                                <i class="fas fa-envelope"></i>
                                <div class="topic">Email</div>
                                <div class="text-one">${myprofile.email}</div>
                                <div class="text-two">luannhantanshop24@gmail.com</div>
                            </div>
                        </div>
                        <div class="right-side">
                            <div class="topic-text">Tài khoản của tôi</div>
                            <p class="title__customer">Mọi ý kiến đóng góp, liên hệ, khiếu nại khác vui lòng điền đầy đủ thông tin và gửi đến chúng tôi.
                                Bộ phận hỗ trợ khách hàng sẽ phản hồi sớm nhất khi nhận được thông tin.</p>
                            <c:url value="/updateAvatar" var="acction"/>
                            <form:form method="post" action="${acction}" modelAttribute="myprofile" enctype="multipart/form-data" role="form" >
                                <c:if test="${myprofile == null}">
                                    <div class="input-img">
                                        <img src="data:image/png;base64,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" alt="" class="input-img-img">
                                    </div>
                                </c:if>
                                <c:if test="${myprofile != null}">
                                    <div class="input-img">
                                        <img src="${myprofile.avatar}" alt="" class="input-img-img">
                                    </div>
                                </c:if>
                                <div class="input-box">
                                    <form:input path="file" cssStyle="padding-top: 15px" type="file"  name=""/>
                                </div>
                                <div class="input-box">
                                    <input type="text" readonly placeholder="${myprofile.user}">
                                </div>
                                <div class="input-box">
                                    <input type="text" readonly placeholder="${myprofile.email}">
                                </div>
                                <div class="button">
                                    <form:button type="submit" class="product-detail-btn" value="Cập nhật" />
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
