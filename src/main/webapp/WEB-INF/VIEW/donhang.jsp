<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 5/28/2022
  Time: 7:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <div class="container">
        <table>
            <tr>
                <th>Tên khách hàng</th>
                <th>Mặt hàng</th>
                <th>Địa chỉ</th>
                <th>Số điện thoại</th>
                <th>Số lượng</th>
                <th>Tổng tiền</th>
                <th>Tình trạng</th>
                <th>Ngày đặt</th>
            </tr>
            <c:forEach var="hoadon" items="${myhoadon}">
                <tr>
                    <td>${hoadon.idKhachHang.user}</td>
                    <td>${hoadon.idMatHang.tenMH}</td>
                    <td>${hoadon.diaChi.diachinha}- ${hoadon.diaChi.diachinha} - ${hoadon.diaChi.quan}- ${hoadon.diaChi.tinh}</td>
                    <td>${hoadon.diaChi.phone}</td>
                    <td>${hoadon.soLuong}</td>
                    <td>${hoadon.tongTien}</td>
                    <td>${hoadon.tinhTrang}</td>
                    <td>${hoadon.dateDatHang}</td>
                </tr>
            </c:forEach>

        </table>
    </div>
</html>
