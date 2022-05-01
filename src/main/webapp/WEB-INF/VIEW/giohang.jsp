<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<div class="container">
    <div class="grid">
        <div class="grid__row ">
            <div class="grid__column-2-15 marginn">
                <div class="container__title">
                    <h1 class="container__giohang--title"><a href="<c:url value="/" />" class="home__home">TRANG CHỦ /</a> Giỏ hàng</h1>
                </div>
                <c:forEach var="cart" items="${carts}" >
                    <div class="giohang" id="giohang--${cart.idGioHang}">
                        <div class="container__giohang">
                            <div class="container__images">
                                <img src="${cart.idMatHang.hinhAnh}" alt="" class="container__img">
                            </div>
                            <div class="container__name-product">
                                <span class="container__product">${cart.idMatHang.tenMH}</span>
                                <p class="container__product--title">${cart.idMatHang.chiTiet}</p>
                                <p class="container__product--title">${cart.idMatHang.hang}</p>
                                <a href="javascript:;" class="container__product--button-delete" onclick="deleteCart(${cart.idGioHang})">Xóa</a>
                                <a href="" class="container__product--button-buy">Để giành mua sau</a>
                            </div>

                        </div>
                        <div class="container__price">
                            <div class="container__price--items">
                                <div class="container__price--new">${cart.idMatHang.giaKhuyenMai}</div>
                                <div class="container__price--old">${cart.idMatHang.gia}</div>
                            </div>
                            <div class="container__price--soluong">
                                <!-- <input type="number" value="1" class="natural__number"> -->
                                <div class="dm_up_down">
                                    <button class="down quantity-change" data-value="-1" onclick="bot(${cart.idGioHang})">-</button>
                                    <input class="text-center buy-quantity" id="count-cart-${cart.idGioHang}" value="${cart.soLuong}" min="1" size="5">
                                    <button class="up quantity-change" data-value="1" onclick="them(${cart.idGioHang})">+</button>
                                </div>
                            </div>
                        </div>
                        <div class="clear" style="clear: both;"></div>
                    </div>
                </c:forEach>
            </div>
            <div class="grid__column-2-16 marginn-top">
                <div class="into__monney">
                    <div class="price__shares">
                        <div class="shares__items">
                            <div class="price__provisional">Tạm tính</div>
                            <div class="price__must-return">732.000đ</div>
                        </div>
                        <div class="duongke"></div>
                        <div class="shares__items">
                            <div class="price__provisional--new">Thành tiền</div>
                            <div class="price__must-return-items">732.000đ</div>
                        </div>
                        <p class="vat">(Đã bao gồm thuế VAT nếu có)</p>
                    </div>
                    <a href="<c:url value="/Thanhtoan"/>"><button class="btn__price--items">Tiến hành đạt hàng</button></a>
                    <div class="discount__code">
                        <span class="discount__code--donate">Mã giảm giá / quà tặng</span>
                        <br>
                        <div class="timkiem">
                            <input type="text" class="text__discount__code" placeholder="Nhập ở đây...">
                            <input type="button" class="btn__discount__code" value="Đồng ý">
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
    </div>
</div>
