<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/5/2022
  Time: 8:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<!DOCTYPE html>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Tất cả sản phẩm</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">                   
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th style="width: 10%;">Tên mặt hàng</th>
                                                <th>Hình ảnh</th>
                                                <th>Giá</th>
                                                <th>Giá khuyến mãi</th>
                                                <th>Hãng</th>
                                                <th>Số lượng</th>
                                                <th class="max_witch" style="width: 358px">Chi tiết</th>
                                                <th colspan="2"><a href="create.html">Thêm</a></th>
                                            </tr>
                                            </tr>
                                        </thead>
                                        <tbody>  
                                            <c:forEach var="product" items="${list}">
                                                <tr class="odd gradeX">
                                                    <td class="center">${product.idMatHang}</td>
                                                    <td class="center">${product.tenMH}</td>
                                                    <td class="center"><img src="${product.hinhAnh}" style="width: 108px;
                                                             height: 80px;
                                                             background-position: center; /* Center the image */
                                                             background-repeat: no-repeat; /* Do not repeat the image */
                                                             background-size: cover;" class="img-fluid img-thumbnail" alt="Cinque Terre"></td>
                                                    <td class="center">${product.gia}</td>
                                                    <td class="center">${product.giaKhuyenMai}</td>
                                                    <td class="center">${product.hang}</td>
                                                    <td>${product.soLuong}</td>
                                                    <td>${product.chiTiet}</td>
                                                    <td><a href="<c:url value="/admin/product/updatesanpham/${product.idMatHang}"/>">update</a></td>
                                                    <td><a href="<c:url value="/admin/product/delete/${product.idMatHang}"/>" onclick="return confirm('bạn có chắc chắn không? ');">delete</a></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                    <li class="page-item"><a class="page-link" href="<c:url value="/admin/sanpham"/>?page=1">1</a></li>
                                    <li class="page-item"><a class="page-link" href="<c:url value="/admin/sanpham"/>?page=2">2</a></li>
                                    <li class="page-item"><a class="page-link" href="<c:url value="/admin/sanpham"/>?page=3">3</a></li>
                                    <li class="page-item"><a class="page-link" href="<c:url value="/admin/sanpham"/>?page=4">Next</a></li>
                                </ul>
                            </nav>
                            <!-- /.col-lg-4 (nested) -->
                            <div class="col-lg-8">
                                <div id="morris-bar-chart"></div>
                            </div>
                            <!-- /.col-lg-8 (nested) -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.panel-body -->
                </div>
            </div>
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
</div>
