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
                        <li class="category__item">
                            <a href="" class="category__item--link">Giày - dép</a>
                        </li>
                        <li class="category__item">
                            <a href="" class="category__item--link">Son môi</a>
                        </li>

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
                                    class="product-detail-btn">
                                <i class="fas fa-cart-plus product-detail-btn-icon"></i>
                                Thêm Vào Giỏ Hàng
                            </button>
                            <a href="<c:url value="/Thanhtoan" />">
                                <button class="product-detail-btn">
                                    <i class="fas fa-cart-plus product-detail-btn-icon"></i>
                                    Mua ngay
                                </button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>