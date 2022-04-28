<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 4/26/2022
  Time: 9:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Thanh toán</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<main role="main">
    <div class="container mt-4">
        <form class="needs-validation" name="frmthanhtoan" method="post"
              action="#">
            <input type="hidden" name="kh_tendangnhap" value="dnpcuong">

            <div class="py-5 text-center">
                <i class="fa fa-credit-card fa-4x" aria-hidden="true"></i>
                <h2>Thanh toán</h2>
                <p class="lead">Vui lòng kiểm tra thông tin Khách hàng, thông tin Giỏ hàng trước khi Đặt hàng.</p>
            </div>

            <div class="row">
                <div class="col-md-4 order-md-2 mb-4">
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-muted">Giỏ hàng</span>
                        <span class="badge badge-secondary badge-pill">2</span>
                    </h4>
                    <ul class="list-group mb-3">
                        <input type="hidden" name="sanphamgiohang[1][sp_ma]" value="2">
                        <input type="hidden" name="sanphamgiohang[1][gia]" value="11800000.00">
                        <input type="hidden" name="sanphamgiohang[1][soluong]" value="2">
                            <li class="list-group-item d-flex justify-content-between lh-condensed">
                                <div>
                                    <h6 class="my-0">${product.tenMH}</h6>
                                    <small class="text-muted">${product.giaKhuyenMai}</small>
                                </div>
                                <span class="text-muted">${product.gia}</span>
                            </li>
                        <input type="hidden" name="sanphamgiohang[2][sp_ma]" value="4">
                        <input type="hidden" name="sanphamgiohang[2][gia]" value="14990000.00">
                        <input type="hidden" name="sanphamgiohang[2][soluong]" value="8">

                        <li class="list-group-item d-flex justify-content-between">
                            <span>Tổng thành tiền</span>
                            <strong>143520000</strong>
                        </li>
                    </ul>
                </div>
                <div class="col-md-8 order-md-1">
                    <h4 class="mb-3">Thông tin khách hàng</h4>

                    <div class="row">
                        <div class="col-md-12">
                            <label for="kh_ten">Họ tên</label>
                            <input type="text" class="form-control" name="kh_ten" id="kh_ten"
                                   value="" readonly="">
                        </div>
                        <div class="col-md-12">
                            <label for="kh_gioitinh">Giới tính</label>
                            <input type="text" class="form-control" name="kh_gioitinh" id="kh_gioitinh" value="Nam"
                                   readonly="">
                        </div>
                        <div class="col-md-12">
                            <label for="kh_diachi">Địa chỉ</label>
                            <input type="text" class="form-control" name="kh_diachi" id="kh_diachi"
                                   value="144 Tố Hữu" readonly="">
                        </div>
                        <div class="col-md-12">
                            <label for="kh_dienthoai">Điện thoại</label>
                            <input type="text" class="form-control" name="kh_dienthoai" id="kh_dienthoai"
                                   value="0383714696" readonly="">
                        </div>
                        <div class="col-md-12">
                            <label for="kh_email">Email</label>
                            <input type="text" class="form-control" name="kh_email" id="kh_email"
                                   value="TNhan.ITTechnology@gamil.com" readonly="">
                        </div>
                        <div class="col-md-12">
                            <label for="kh_ngaysinh">Ngày sinh</label>
                            <input type="text" class="form-control" name="kh_ngaysinh" id="kh_ngaysinh"
                                   value="07/01/2001" readonly="">
                        </div>
                        <div class="col-md-12">
                            <label for="kh_cmnd">CMND</label>
                            <input type="text" class="form-control" name="kh_cmnd" id="kh_cmnd" value="362209685"
                                   readonly="">
                        </div>
                    </div>

                    <h4 class="mb-3">Hình thức thanh toán</h4>

                    <div class="d-block my-3">
                        <div class="custom-control custom-radio">
                            <input id="httt-1" name="httt_ma" type="radio" class="custom-control-input" required=""
                                   value="1">
                            <label class="custom-control-label" for="httt-1">Tiền mặt</label>
                        </div>
                        <div class="custom-control custom-radio">
                            <input id="httt-2" name="httt_ma" type="radio" class="custom-control-input" required=""
                                   value="2">
                            <label class="custom-control-label" for="httt-2">Chuyển khoản</label>
                        </div>
                        <div class="custom-control custom-radio">
                            <input id="httt-3" name="httt_ma" type="radio" class="custom-control-input" required=""
                                   value="3">
                            <label class="custom-control-label" for="httt-3">Ship COD</label>
                        </div>
                    </div>
                    <hr class="mb-4">
                    <button class="btn btn-primary btn-lg btn-block" type="submit" name="btnDatHang">Đặt
                        hàng</button>
                </div>
            </div>
        </form>

    </div>
    <!-- End block content -->
</main>
</body>
</html>
