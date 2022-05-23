<%-- 
    Document   : index
    Created on : Feb 23, 2022, 7:10:38 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<div class="container">
    <div class="grid">
        <div class="grid__row">
            <!--        Phan slider-->
            <div class="grid__column-2-15-slider">
                <div class="container__body">
                    <div class="slideshow-container">
                        <div class="mySlides fade align">
                            <img src="<c:url value="/images/1.jpg"/>" class="mySlider__slider">

                        </div>

                        <div class="mySlides fade align">
                            <img src="<c:url value="/images/2.png"/>" class="mySlider__slider">

                        </div>

                        <div class="mySlides fade align">
                            <img src="<c:url value="/images/3.png"/>" class="mySlider__slider">

                        </div>
                        <div class="mySlides fade align">
                            <img src="<c:url value="/images/4.png"/>" class="mySlider__slider">

                        </div>
                        <div class="mySlides fade align">
                            <img src="<c:url value="/images/5.png"/>" class="mySlider__slider">

                        </div>
                        <div class="mySlides fade align">
                            <img src="<c:url value="/images/6.png"/>" class="mySlider__slider">

                        </div>
                        <div class="mySlides fade align">
                            <img src="<c:url value="/images/7.png"/>" class="mySlider__slider">

                        </div>
                        <div class="mySlides fade align">
                            <img src="<c:url value="/images/8.png"/>" class="mySlider__slider">

                        </div>
                        <div class="mySlides fade align">
                            <img src="<c:url value="/images/9.png"/>" class="mySlider__slider">

                        </div>
                    </div>
                    <br>
                </div>
                <div style="text-align:center">
                    <span class="dot" onclick="currentSlide(0)"></span>
                    <span class="dot" onclick="currentSlide(1)"></span>
                    <span class="dot" onclick="currentSlide(2)"></span>
                    <span class="dot" onclick="currentSlide(3)"></span>
                    <span class="dot" onclick="currentSlide(4)"></span>
                    <span class="dot" onclick="currentSlide(5)"></span>
                    <span class="dot" onclick="currentSlide(6)"></span>
                    <span class="dot" onclick="currentSlide(7)"></span>
                    <span class="dot" onclick="currentSlide(8)"></span>
                </div>
            </div>
            <div class="grid__column-2-16-slider">
                <div class="mySlides__2--phu">
                    <img src="<c:url value="/images/8.png"/>" class="images__slider">
                </div>
                <div class="mySlides__2--phu">
                    <img src="<c:url value="/images/2.png"/>" class="images__slider">
                </div>
            </div>  
        </div>   
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
                    <div class="gird__row"> 
                        <c:forEach var="product" items="${listHang}">
                            <div class="grid__column--2-4">
                                <a href="<c:url value="chitiet/${product.idMatHang}" />" class="home__product--items">
                                    <div class="home__product--items-img">
                                        <img src="${product.hinhAnh}" alt="" class="home__product--items-images">
                                        <h4 class="home__product--items-name">${product.tenMH}</h4>
                                        <div class="home__product--items-price">
                                            <span class="home__product--items-price-old">${product.gia}</span>
                                            <span class="home__product--items-price-new">${product.giaKhuyenMai}</span>
                                        </div>
                                        <div class="home__product--items-action">
                                            <div class="home__product--items-like">   <!--Xử lí lại-->
                                                <i class="home__product--items-like-icon-like fa-solid fa-heart"></i>
                                                <i class="home__product--items-like-icon-nolike fa-solid fa-heart"></i>
                                            </div>
                                            <div class="home__product--items-rating">
                                                <i class="home__product--items-star-yelown fa-solid fa-star"></i>
                                                <i class="home__product--items-star-yelown fa-solid fa-star"></i>
                                                <i class="home__product--items-star-yelown fa-solid fa-star"></i>
                                                <i class="home__product--items-star-yelown fa-solid fa-star"></i>
                                                <i class="fa-solid fa-star"></i>
                                            </div>
                                        </div>
                                        <div class="home__product--items-origin">
                                            <span class="home__product--items-brand">${product.soLuong}</span>
                                            <span class="home__product--items-origin-name">${product.hang}</span>
                                        </div>
                                        <div class="home__product--items-favourite">
                                            <i class="fa-solid fa-check"></i>
                                            Yêu thích
                                        </div>
                                        <div class="home__product--items-sale-off">
                                            <span class="home__product--items-sale-off-percent">10%</span>
                                            <span class="home__product--items-sale-off-label">Giảm</span>
                                        </div>
                                    </div>
                                </a>                  
                            </div>  
                        </c:forEach>
                    </div>
                </div>
                <ul class="pagination home-product-pagination">
                    <li class="pagination-item">
                        <a href="" class="pagination-item__link">
                            <i class="pagination-item__icon fas fa-angle-left"></i>
                        </a>
                    </li>
                    <li class="pagination-item pagination-item--active">
                        <a href="<c:url value="/"/>?page=1" class="pagination-item__link">1</a>
                    </li>
                    <li class="pagination-item">
                        <a href="<c:url value="/"/>?page=2" class="pagination-item__link">2</a>
                    </li>
                    <li class="pagination-item">
                        <a href="<c:url value="/"/>?page=3" class="pagination-item__link">3</a>
                    </li>               
                    <li class="pagination-item">
                        <a href="" class="pagination-item__link">
                            <i class="pagination-item__icon fas fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>