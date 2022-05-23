<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container">
    <div class="grid">
        <div class="grid__row app__content">
            <div class="grid__column--2">
                <nav class="category">
                    <h3 class="category__heading"><i class="category__heading--icon fa-solid fa-list"></i>Danh mục</h3>
                    <ul class="category__list">
                        <li class="category__item category__item--active">
                            <a href="" class="category__item--link">Sản phẩm</a>
                        </li>
                        <c:forEach var="listLSP" items="${danhmuc}">
                            <li class="category__item">
                                <a class="category__item--link category__item--link--border" >${listLSP.tenNhomSP}</a>
                                <ul class="category__list">
                                    <c:forEach var="c" items="${listLSP.loaiSanPham}">
                                        <li class="category__item">
                                            <c:url value="/" var="catPath">
                                                <c:param name="danhmuc" value="${c.idLoaiSP}"></c:param>
                                            </c:url>
                                            <a href="${catPath}" class="category__item--link">${c.tenLoaiSP}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </li>
                        </c:forEach>
                    </ul>
                </nav>
            </div>
            <div class="grid__column--10">
                <div class="home__fillter">
                    <span class="home__fillter--item">Sắp xếp theo</span>
                    <button class="home__fillter--btn btn">Phổ biến</button>
                    <button class="home__fillter--btn btn btn__primary">Mới nhất</button>
                    <button class="home__fillter--btn btn">Bán chạy</button>

                    <div class="select__input">
                        <span class="select__input--label">Giá</span>
                        <i class="select__input--icon fa-solid fa-chevron-down"></i>
                        <ul class="select__input--list">
                            <li class="select__input--item">
                                <a href="" class="select__input--link">Giá: Thấp đến cao</a>
                            </li>
                            <li class="select__input--item">
                                <a href="" class="select__input--link">Giá: Cao đến thấp</a>
                            </li>
                        </ul>
                    </div>
                    <div class="home__fillter--page">
                        <span class="home__fillter--page-num">
                            <span class="home__fillter--page-numberone">1</span>/14
                        </span>
                        <div class="home__fillter--page-control">
                            <a href="" class="home__fillter--page-button home__fillter--page-button-disable">
                                <i class="home__fillter--page-icon fa-solid fa-chevron-left"></i>
                            </a>
                            <a href="" class="home__fillter--page-button">
                                <i class="home__fillter--page-icon fa-solid fa-chevron-right"></i>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- Phần sản phẩm -->
                <div class="home__product">
                    <div class="container__title">
                        <h1 class="container__giohang--title"><a href="../index.html" class="home__home">TRANG
                                CHỦ /</a> Chi tiết</h1>
                    </div>
                    <div class="grid__row product-detail">
                        <img src="${product.hinhAnh}" alt="" class="product-detail-img">
                        <div class="product-detail-infor">
                            <h1 class="product-detail-name">${product.tenMH}</h1>
                            <div class="product-detail-price">
                                <div class="product-detail-price-price">
                                    <p class="product-detail-priceOld">
                                        ${product.gia}</p>
                                    <p class="product-detail-priceSale">
                                        ${product.giaKhuyenMai}</p>
                                    <p class="product-detail-percentSale">5% GIẢM
                                    </p>
                                </div>
                                <div class="product-detail-price-slogan">
                                    <img src="./asset/img/soganicon.png" alt=""
                                         class="product-detail-price-slogan-img">
                                    <div class="product-detail-price-slogan-text-text">
                                        <p class="product-detail-price-slogan-text">Gì cũng rẻ</p>
                                        <p class="product-detail-price-slogan-ad">${product.chiTiet}</p>
                                    </div>
                                </div>
                            </div>
                            <button onclick="addToCart(${product.idMatHang})"
                                    class="product-detail-btn" id="Thongbao">
                                <i class="fas fa-cart-plus product-detail-btn-icon"></i>
                                Thêm Vào Giỏ Hàng
                            </button>
                            <a href="<c:url value="/Thanhtoan/${product.idMatHang}" />">
                                <button class="product-detail-btn">
                                    <i class="fas fa-cart-plus product-detail-btn-icon"></i>
                                    Mua ngay
                                </button>
                            </a>
                        </div>
                    </div>
                    <div class="product__comment--detail">
                        <div class="product__comment">
                            <span class="comment__user--comment">Đánh giá sản phẩm</span>
                            <div class="product__comment--user">
                                <input type="text" placeholder="Gửi bình luận của bạn..."
                                       class="product__comment--input" id="commentId">
                                <br>
                                <button class="product-comment--button" onclick="addComment(${product.idMatHang})">
                                    <i class="fa-brands fa-buy-n-large product-detail-btn-icon"></i>
                                    Gửi bình luận
                                </button>
                            </div>
                        </div>
                        <div id="commentAral">
                            <c:if test="${listComment!=null}">
                            <c:forEach items="${listComment}" var="comment">
                                <div class="comment__user">
                                    <div class="comment__user--maggin">
                                        <c:if test="${comment.idAccount.avatar!= ''}">
                                            <img src="${comment.idAccount.avatar}" alt="" class="comment__user--img">
                                        </c:if>
                                        <c:if test="${comment.idAccount.avatar==''}">
                                        <img src="<c:url value="/images/1.jpg"/>" alt="" class="comment__user--img">
                                        </c:if>
                                        <br>
                                        <div class="comment__user--div my_comment">
                                            <span class="comment__user--name">${comment.idAccount.user}</span>
                                            <div class="home__product--items-rating">
                                                <i class="home__product--items-star-yelown fa-solid fa-star"></i>
                                                <i class="home__product--items-star-yelown fa-solid fa-star"></i>
                                                <i class="home__product--items-star-yelown fa-solid fa-star"></i>
                                                <i class="home__product--items-star-yelown fa-solid fa-star"></i>
                                                <i class="fa-solid fa-star"></i>
                                            </div>
                                            <span class="comment__user--phanloai">${comment.content}</span>
                                            <br>
                                            <p class="comment__user--time">${comment.createdDate}</p>
                                            <br>
                                            <span class="comment__user--huuich"><i class="fa-solid fa-thumbs-up mau"></i>
                                                Hữu
                                                ích</span>
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                    <div class="comment__user--duongke"></div>
                                </div>   
                            </c:forEach>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
