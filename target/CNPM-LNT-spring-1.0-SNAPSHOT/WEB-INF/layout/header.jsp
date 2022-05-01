<%-- 
    Document   : header
    Created on : Feb 28, 2022, 1:24:56 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<header class="header">
    <div class="grid">
        <nav class="header__navbar">
            <ul class="header__navbar-list">
                <li class="header__navbar-item header__navbar-item--has-qr header__navbar-item--lnt">
                    Công nghệ phần mềm - Thiết kế website Shopee - (LNT)
                    <div class="header__qr">
                        <img class="header__qr-img" src="<c:url value="/images/qr_code.png"/> " alt="QR code">
                        <div class="header__qr-app">
                            <a href="" class="header__qr-link">
                                <img src="./assets/images/google_play.png" alt="" class="header__qr-download-img">
                            </a>
                            <a href="" class="header__qr-link">
                                <img src="./assets/images/app_store.png" alt="" class="header__qr-download-img">
                            </a>
                        </div>
                    </div>
                </li>
                <li class="header__navbar-item header__navbar-item--lnt">
                    <span class="header__navbar-title--no-pointer">Kết nối</span>
                </li>
                <li class="header__navbar-item">
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <c:url var="link" value="/admin"/>
                        <a class="header__navbar-title--no-pointer" href="${link}">Admin</a>
                    </sec:authorize>
                </li>
                <a href="https://www.facebook.com/ShopeeVN" class="header__navbar-icon-link"><i class="header__navbar-icon fa fa-facebook-f" style="font-size:20px"></i></a>
                <a href="https://www.instagram.com/shopee_vn/" class="header__navbar-icon-link"><i class="header__navbar-icon fa-brands fa-instagram"></i></a>

            </ul>

            <ul class="header__navbar-list">
                <li class="header__navbar-item header__navbar-item--has-infor">
                    <a href="" class="header__navbar-item-link">
                        <i class="header__navbar-icon fa-solid fa-solar-panel"></i>
                        Thông báo</a>

                    <div class="header__notification">
                        <header class="header__notification--header">
                            <h3>Thông báo mới nhận</h3>
                        </header>
                        <ul class="header__notification--list">
                            <c:forEach begin="1" end="4">
                                <li class="header__notification--item header__notification--item--reading">
                                    <a href="" class="header__notification--link">
                                        <img src="<c:url value="/images/trung.jpg"/> " alt="" class="header__notification--img">
                                        <div class="header__notification--info">
                                            <span class="header__notification--name">
                                                Mềm, dẻo, ngọt, thơm
                                            </span>
                                            <span class="header__notification--descriotion">
                                                Gạo ngon nhất khi sử dụng trong vòng 6 tháng kể từ ngày sản xuất và nấu đúng định lượng ghi trên bao bì
                                            </span>
                                        </div>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                        <footer class="header__notification--footer">
                            <a href="" class="header__notification--footer--btn">
                                Xem tất cả
                            </a>
                        </footer>
                    </div>
                </li>
                <li class="header__navbar-item">
                    <a href="<c:url value="/lienhe"/>" class="header__navbar-item-link">
                        <i class="header__navbar-icon fa-brands fa-slideshare"></i>
                        Trợ giúp
                    </a>
                </li>
                <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <a href="<c:url value="/login"/>"><li class="header__navbar-item header__navbar-item--strong header__navbar-item--lnt">Đăng nhập</li></a>
                    <a href="<c:url value="/signup"/>"><li class="header__navbar-item header__navbar-item--strong">Đăng kí</li></a>
                        </c:if>
                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <a href="<c:url value="/logout"/>" class="header__navbar-item header__navbar-item--strong " > Đăng xuất</a>
                </c:if>

            </ul>
        </nav>
        <div class="header__with--search">
            <div class="header__logo">
                <a href="<c:url value="/"/>">
                    <svg xmlns="http://www.w3.org/2000/svg" version="1.0" width="53.000000pt" height="53.000000pt" viewBox="0 0 175.000000 152.000000" preserveAspectRatio="xMidYMid meet">
                    <g transform="translate(0.000000,152.000000) scale(0.100000,-0.100000)" fill="#000000" stroke="none">
                    <path fill="#fff"
                          d="M95 1428 c-25 -13 -45 -38 -45 -55 0 -7 10 -21 22 -33 25 -23 75 -26 143 -9 92 23 154 -13 180 -105 8 -28 21 -106 30 -174 25 -191 58 -259 147 -296 31 -13 90 -16 353 -16 338 0 345 1 392 52 25 27 113 295 113 344 0 51 -22 94 -70 138 -41 37 -45 38 -100 34 -48 -3 -66 -10 -102 -39 -74 -61 -122 -89 -149 -89 -15 0 -49 16 -75 35 -81 58 -116 72 -207 88 -50 9 -106 26 -132 40 l-45 26 0 -74 c0 -148 38 -246 119 -308 88 -67 213 -71 304 -10 20 14 37 27 37 28 0 2 -33 2 -72 2 -101 -1 -162 21 -221 81 -42 43 -88 132 -68 132 5 0 25 -20 45 -44 56 -68 126 -98 236 -98 49 0 105 5 127 12 43 14 130 69 158 100 10 11 29 20 42 20 28 0 63 -33 63 -59 0 -40 -80 -246 -103 -267 -23 -20 -39 -21 -293 -27 -292 -6 -312 -3 -352 48 -30 38 -58 119 -77 222 -30 157 -81 226 -185 248 -19 4 -60 20 -90 36 -58 31 -92 35 -125 17z"
                          />
                    <path fill="#fff" d="M653 650 c-41 -24 -53 -48 -53 -102 0 -50 19 -82 60 -103 84 -44 183 14 182 106 -1 93 -107 149 -189 99z m102 -70 c27 -29 10 -74 -28 -78 -36 -4 -57 13 -57 49 0 47 53 65 85 29z" />
                    <path fill="#fff" d="M1096 649 c-31 -24 -56 -69 -56 -99 0 -34 37 -95 65 -108 96 -44 205 42 176 140 -24 78 -124 115 -185 67z m95 -59 c23 -13 26 -62 5 -79 -46 -38 -111 25 -71 69 20 22 37 25 66 10z" />
                    <path fill="#fff"
                          d="M292 287 c-33 -35 -28 -70 16 -106 74 -61 73 -60 62 -81 -14 -26 -46 -26 -62 0 -15 24 -38 26 -38 5 0 -23 46 -65 70 -65 29 0 70 44 70 74 0 23 -49 76 -71 76 -4 0 -16 11 -24 24 -13 20 -14 29 -5 46 17 32 53 23 65 -17 5 -18 15 -33 22 -33 20 0 15 44 -8 74 -26 33 -68 34 -97 3z"
                          />
                    <path fill="#fff"
                          d="M460 180 c0 -109 2 -130 15 -130 12 0 15 13 15 55 0 61 10 72 55 61 23 -6 25 -11 25 -61 0 -42 3 -55 15 -55 13 0 15 21 15 130 0 109 -2 130 -15 130 -12 0 -15 -13 -15 -55 l0 -55 -40 0 -40 0 0 55 c0 42 -3 55 -15 55 -13 0 -15 -21 -15 -130z"
                          />
                    <path fill="#fff"
                          d="M661 284 c-18 -22 -21 -41 -21 -111 0 -76 2 -86 25 -108 30 -30 54 -31 89 -4 25 19 26 25 26 113 0 84 -2 95 -23 114 -32 30 -71 28 -96 -4z m77 -16 c12 -12 17 -143 6 -172 -9 -22 -51 -20 -64 3 -5 11 -10 47 -10 81 0 34 5 70 10 81 12 21 40 25 58 7z"
                          />
                    <path fill="#fff"
                          d="M830 180 c0 -107 3 -130 14 -130 11 0 16 14 18 48 3 44 5 47 33 50 44 5 75 38 75 81 0 20 -4 41 -8 47 -13 20 -50 34 -91 34 l-41 0 0 -130z m91 90 c22 -12 26 -59 7 -78 -7 -7 -25 -12 -40 -12 -26 0 -28 3 -28 43 0 59 16 71 61 47z"
                          />
                    <path fill="#fff" d="M1070 180 l0 -130 60 0 c47 0 60 3 60 15 0 11 -12 15 -45 15 l-45 0 0 115 c0 96 -3 115 -15 115 -13 0 -15 -21 -15 -130z" />
                    <path fill="#fff"
                          d="M1230 180 c0 -109 2 -130 15 -130 12 0 15 14 15 70 0 39 4 70 9 70 8 0 41 -69 56 -117 3 -13 13 -23 21 -23 11 0 14 24 14 130 0 109 -2 130 -15 130 -12 0 -15 -16 -15 -82 l0 -83 -38 82 c-20 45 -43 83 -49 83 -10 0 -13 -33 -13 -130z"
                          />
                    <path fill="#fff" d="M1400 296 c0 -8 10 -16 23 -18 21 -3 22 -7 25 -115 3 -107 4 -113 24 -113 20 0 20 4 16 105 -5 107 0 125 34 125 10 0 18 7 18 15 0 12 -14 15 -70 15 -54 0 -70 -3 -70 -14z" />
                    </g>
                    </svg>
                </a>

            </div>
            <c:url var="action" value="/" />
            <form method="get" action="${action}" class="header__search">
                <input type="text" name="kw" class="header__search--input" placeholder="Tìm kiếm sản phẩm tại đây">
                <div class="header__search--select">
                    <span class="header__search--select-label">Trong shop</span>
                    <i class="header__search--select-icon fa-solid fa-chevron-down"></i>
                </div>
                <button class="search__icon--btn">
                    <i class="search__icon--btn-icon fa-solid fa-magnifying-glass"></i>
                </button>
            </form>
            <div class="header__cart">
                <a href="<c:url value="/cart"/>"><i class="header__cart--icon fa-solid fa-cart-shopping"></i><span class="badge badge-danger" id="cart-count">${cartCounter}</span></a>
            </div>
        </div>
    </div>
</header>