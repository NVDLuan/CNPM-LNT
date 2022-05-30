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
                                <h3 class="container__product--name-name">${cart.idMatHang.tenMH}</h3>
                                <h4 class="container__product">${cart.idMatHang.chiTiet}</h4>
                                <p class="container__product--title">Số lượng hàng còn ${cart.idMatHang.soLuong}</p>
                                <p class="container__product--title--hang">${cart.idMatHang.hang}</p>
                                <a href="javascript:;" class="container__product--button-delete" onclick="deleteCart(${cart.idGioHang})">Xóa</a>
                                <a href="" class="container__product--button-buy">Để giành mua sau</a>
                            </div>

                        </div>
                        <div class="container__price">
                            <div class="container__price--items">
                                <div class="container__price--new price ">${cart.idMatHang.giaKhuyenMai}<span>đ</span></div>
                                <div class="container__price--old">${cart.idMatHang.gia}đ</div>
                            </div>
                            <div class="container__price--soluong">
                                <div class="dm_up_down">
                                    <button class="down quantity-change" data-value="-1" onclick="bot(${cart.idGioHang})">-</button>
                                    <input class="text-center buy-quantity counter-cart" id="count-cart-${cart.idGioHang}" value="${cart.soLuong}" min="1" size="5">
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
                            <div class="price__must-return " id="sumMoneytmp">732.000<span>đ</span></div>
                        </div>
                        <div class="duongke"></div>
                        <div class="shares__items">
                            <div class="price__provisional--new">Thành tiền</div>
                            <div class="price__must-return-items" id="sumMoney"><span>đ</span></div>
                        </div>
                        <p class="vat">(Đã bao gồm thuế VAT nếu có)</p>
                    </div>
                    <a href="<c:url value="/Thanhtoan/all"/>"><button class="btn__price--items">Tiến hành đạt hàng</button></a>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
    </div>
</div>
