
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <title>Hóa đơn</title>
    <Style>
        body {
            margin: 0;
            padding: 0;
            background-color: #FAFAFA;
            font: 12pt "Tohoma";
        }

        * {
            box-sizing: border-box;
            -moz-box-sizing: border-box;
        }

        .page {
            width: 21cm;
            overflow: hidden;
            min-height: 297mm;
            padding: 2.5cm;
            margin-left: auto;
            margin-right: auto;
            background: white;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }

        .subpage {
            padding: 1cm;
            border: 5px red solid;
            height: 237mm;
            outline: 2cm #FFEAEA solid;
        }

        @page {
            size: A4;
            margin: 0;
        }

        button {
            width: 100px;
            height: 24px;
        }

        .header {
            overflow: hidden;
        }

        .logo {
            background-color: #FFFFFF;
            text-align: left;
            float: left;
        }

        .company {
            padding-top: 24px;
            text-transform: uppercase;
            background-color: #FFFFFF;
            text-align: right;
            float: right;
            font-size: 16px;
        }

        .title {
            text-align: center;
            position: relative;
            color: #0000FF;
            font-size: 24px;
            top: 1px;
        }

        .footer-left {
            text-align: center;
            text-transform: uppercase;
            padding-top: 24px;
            position: relative;
            height: 150px;
            width: 50%;
            color: #000;
            float: left;
            font-size: 12px;
            bottom: 1px;
        }

        .footer-right {
            text-align: center;
            text-transform: uppercase;
            padding-top: 24px;
            position: relative;
            height: 150px;
            width: 50%;
            color: #000;
            font-size: 12px;
            float: right;
            bottom: 1px;
        }

        .TableData {
            background: #ffffff;
            font: 11px;
            width: 100%;
            border-collapse: collapse;
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-size: 12px;
            border: thin solid #d3d3d3;
        }

        .TableData TH {
            background: rgba(0, 0, 255, 0.1);
            text-align: center;
            font-weight: bold;
            color: #000;
            border: solid 1px #ccc;
            height: 24px;
        }

        .TableData TR {
            height: 24px;
            border: thin solid #d3d3d3;
        }

        .TableData TR TD {
            padding-right: 2px;
            padding-left: 2px;
            border: thin solid #d3d3d3;
        }

        .TableData TR:hover {
            background: rgba(0, 0, 0, 0.05);
        }

        .TableData .cotSTT {
            text-align: center;
            width: 10%;
        }

        .TableData .cotTenSanPham {
            text-align: left;
            width: 40%;
        }

        .TableData .cotHangSanXuat {
            text-align: left;
            width: 20%;
        }

        .TableData .cotGia {
            text-align: right;
            width: 120px;
        }

        .TableData .cotSoLuong {
            text-align: center;
            width: 50px;
        }

        .TableData .cotSo {
            text-align: right;
            width: 120px;
        }

        .TableData .tong {
            text-align: right;
            font-weight: bold;
            text-transform: uppercase;
            padding-right: 4px;
        }

        .TableData .cotSoLuong input {
            text-align: center;
        }

        @media print {
            @page {
                margin: 0;
                border: initial;
                border-radius: initial;
                width: initial;
                min-height: initial;
                box-shadow: initial;
                background: initial;
                page-break-after: always;
            }
        }
        .logo__logo{
            width: 105px;
            height: 105px;
        }
        .Hinhanhthanhtoan{
            width: 70px;
            height: 70px;
            margin-left: 35px;
            object-fit: contain;

        }
        .title__muasam{
            color: #000;
            font-size: 1.4rem;
            font-family: Arial, Helvetica, sans-serif;
        }
    </Style>
</head>

<body>
<h3>
    <a class="title__muasam" href="<c:url value="/"/>"><i class="fa-solid fa-arrow-right-from-line"></i>Back</a>
</h3>
<div id="page" class="page">
    <div class="header">
        <div class="logo">
            <img class="logo__logo" src="<c:url value="/images/remote.png" />" />
        </div>
        <div class="company">Shop linh kiện điện tử</div>
    </div>
    <br />
    <div class="title">
        HÓA ĐƠN THANH TOÁN
        <br />
        -------oOo-------
    </div>
    <br />
    <br />
    <table class="TableData">
        <tr>
            <th>Tên</th>
            <th>Hình ảnh</th>
            <th>Số lượng</th>
            <th>Giá khuyến mãi</th>
            <th>Thành tiền</th>
        </tr><c:if test="${mathang!= null}">
            <tr id="mathang">
                <td>${mathang.tenMH}</td>
                <td>
                    <img src="${mathang.hinhAnh}" class="Hinhanhthanhtoan" alt="">
                </td>
                <td>1</td>
                <td>${mathang.giaKhuyenMai}</td>
                <td>${mathang.giaKhuyenMai}</td>
            </tr>
        </c:if>
        <c:forEach var="item" items="${hoadon}">
            <tr class="hoadonlist">
                <td>${item.idMatHang.tenMH}</td>
                <td>
                    <img src="${item.idMatHang.hinhAnh}" class="Hinhanhthanhtoan" alt="">
                </td>
                <td>${item.soLuong}</td>
                <td>${item.idMatHang.giaKhuyenMai}</td>
                <td>${item.soLuong * item.idMatHang.giaKhuyenMai}</td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="5" class="tong">Lưu ý: Sản phẩm có thể đến chậm 3 đến 4 ngày!!!</td>
        </tr>
    </table>
    <div class="footer-left"> Đà Nẵng, ngày 23 tháng 6 năm 2022<br />
        Khách hàng </div>
    <div class="footer-right"> Đà Nẵng, ngày 16 tháng 12 năm 2022<br />
        Nhân viên </div>
</div>
</body>


</html>