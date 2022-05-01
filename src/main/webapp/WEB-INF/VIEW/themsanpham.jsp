
<%-- 
    Document   : themsanpham
    Created on : Apr 22, 2022, 8:41:27 PM
    Author     : ACER
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Thêm sản phẩm</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="container mt-5">
            <div class="card">
                <div class="card-body">
                    <c:url var="action" value="/admin/matHang/add"/>
                    <form:form action="${action}" method="post" modelAttribute="mathang" enctype="multipart/form-data" role="form" data-toggle="validator">
                        <div class="form-group">
                            <label>Tên sản phẩm</label>
                            <form:input path="tenMH" class="form-control" data-error="Bạn cần nhập đầy đủ thông tin." type="text" />
                            <!-- Error -->
                            <div class="help-block with-errors"></div>
                        </div>

                        <div class="form-group">
                            <label>Hãng</label>
                            <form:input path="hang" class="form-control" data-error="Bạn cần nhập đầy đủ thông tin." type="text" />
                            <div class="help-block with-errors"></div>
                        </div>

                        <div class="form-group">
                            <label>Giá</label>
                            <form:input path="giaKhuyenMai" class="form-control" data-error="Bạn cần nhập đầy đủ thông tin." type="number" />
                            <div class="help-block with-errors"></div>
                        </div>

                        <div class="form-group">
                            <label>Giá khuyến mãi</label>
                            <form:input path="gia" class="form-control" data-error="Bạn cần nhập đầy đủ thông tin." type="number" />
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group">
                            <label>Số lượng</label>
                            <form:input path="soLuong" class="form-control" data-error="Bạn cần nhập đầy đủ thông tin." type="number" />
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group">
                            <label>Loại sản phẩm</label>
                            <form:select path="idLoaiSanPham" class="form-control" id="sel1">
                                <c:forEach var="lsp" items="${list}">
                                    <form:option value="${lsp.idLoaiSP}" >${lsp.tenLoaiSP}</form:option>
                                </c:forEach>
                            </form:select>
                        </div>
                        <div class="form-group">
                            <label>Thông tin chi tiết</label>
                            <form:textarea path="chiTiet" class="form-control" id="editor1" data-error="Please enter message."/>
                            <div class="help-block with-errors"></div>
                        </div>

                        <div class="form-group">
                            <label>Hình ảnh</label> <br>
                            <form:input path="file" type ="file" value="Browse..."/>
                            <div class="help-block with-errors"></div>
                        </div>

                        <div class="form-group">
                            <button class="btn btn-primary btn-block" type="submit">Thêm</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
