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
    <%--@elvariable id="myprofile" type="com"--%>
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
        <div class="grid__row app__content">
            <div class="grid__column--2">
                <nav class="category">
                    <h3 class="category__heading"><i class="category__heading--icon fa-solid fa-list"></i>Danh mục</h3>
                    <ul class="category__list ">
                        <li class="category__item category__item--active">
                            <a class="category__item--link" href="<c:url value="/" />" title="Trang chủ">Trang chủ</a>
                        </li>
                        <li class="category__item ">
                            <a class="category__item--link" href="#" title="Trang chủ">Đổi mật khẩu</a>
                        </li>
                        <li class="category__item ">
                            <a class="category__item--link" href="<c:url value="/addavatar" />" title="Trang chủ">Đổi Avata</a>
                        </li>
                        <li class="category__item ">
                            <c:url value="/user/donhang" var="donhang"/>
                            <a class="category__item--link" href="${donhang}" title="Trang chủ">Xem đơn hàng</a>
                        </li>
                    </ul>
                </nav>
            </div>

            <div class="grid__column--10">
                <div class="home__product">
                    <div class="container__title">
                        <h1 class="container__giohang--title"><a href="" class="home__home">TRANG CHỦ /</a> Tài khoản của tôi</h1>
                    </div>
                    <div class="grid">
                        <div class="gird__row">
                            <div class="grid__column-2-16-account">
                                <h3 class="footer__heading">Hình ảnh của tài khoản</h3>
                                <img src="${Changeassword.avatar}" alt="" class="images__account">
                                <h3 class="footer__heading">Thông tin</h3>
                                <ul class="footer-list">
                                    <li class="footer-item">
                                        <a href="#" class="footer-item__link">
                                            <i class="footer-item__icon fab fa-facebook"></i> ${Changeassword.email}
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="footer-item__link">
                                            <i class="footer-item__icon fab fa-instagram"></i> Username: ${Changeassword.user}
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="footer-item__link">
                                            <i class="footer-item__icon fab fa-linkedin"></i> LinkedIn
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="grid__column-2-15-account">
                                <div class="model">
                                </div>
                                <div class="model__body">
                                    <div class="model__inner">
                                        <div class="auform__body">
                                            <c:url value="/changeassword" var="acction"/>
                                            <%--@elvariable id="changeassword" type=""--%>
                                            <form method="post" action="${acction}">
                                                <div class="auform__container">
                                                    <div class="auform__header">
                                                        <h3 class="auform__heading">Đổi mật khẩu</h3>
                                                        <span class="auform__swith_btn">Tài khoản của tôi</span>
                                                    </div>
                                                    <div class="auform__form">
                                                        <div class="auform__group">
                                                                <input name="passnow" type="password" class="auform__input" placeholder="Mật khẩu củ của bạn" />
                                                        </div>
                                                        <div class="auform__group">
                                                            <input name="passnew" type="password" class="auform__input" placeholder="Mật khẩu mới của bạn" />
                                                        </div>
                                                        <div class="auform__group">
                                                            <input name="repassnew" type="password" class="auform__input" placeholder="Nhập lại khẩu mới của bạn" />
                                                        </div>
                                                    </div>
                                                    <div class="auform__arsilde">
                                                        <div class="auform__policy--text">
                                                            Bằng việc đổi mật khẩu, bạn đồng ý với chúng tôi về
                                                            <a href="" class="auform__policy--text-link">Điều khoản dich vụ</a> &
                                                            <a href="" class="auform__policy--text-link">Chính sách bảo mật</a>
                                                        </div>
                                                    </div>
                                                    <div class="auform__controls" >
                                                        <button class="btn auform__controls--back btn__normal js-model-close">TRỞ LẠI</button>
                                                        <input type="submit" class="btn btn__primary" value="ĐỔI MẬT KHẨU"/>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
