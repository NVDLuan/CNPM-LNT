<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LUAN
  Date: 5/17/2022
  Time: 9:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <table>
        <tr>
            <th>tên sản phẩm</th>
            <th>hình ảnh</th>
            <th>số lượng</th>
            <th>giá</th>
            <th>thành tiền</th>
        </tr>
        <c:forEach var="item" items="${hoadon}">
            <tr>
                <td>${item.idMatHang.tenMH}</td>
                <td><img src="${item.idMatHang.hinhAnh}"></td>
                <td>${item.soLuong}</td>
                <td>${item.idMatHang.giaKhuyenMai}</td>
                <td>${item.soLuong * item.idMatHang.giaKhuyenMai}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
