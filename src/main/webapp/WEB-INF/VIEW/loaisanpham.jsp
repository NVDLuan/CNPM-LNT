<%-- 
    Document   : adminloaisanpham
    Created on : Apr 22, 2022, 10:09:00 PM
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
                <h1 class="page-header">Thêm nhom sản phẩm</h1>
            </div>
        </div>
        <div class="container mt-5">
            <div class="card">
                <div class="card-body">
                    <c:url var="action" value="/admin/loaiSanPham/add"/>
                    <form:form action="${action}" modelAttribute="lsp" method="post" enctype="multipart/form-data" role="form" data-toggle="validator">
                        <div class="form-group">
                            <label>Loại sản phẩm</label>
                            <form:input path="tenLoaiSP" id = "name"  class="form-control" data-error="Bạn cần nhập đầy đủ thông tin." type="text"/>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group">
                            <form:select path="idNhomsp" class="form-control" id="sel1">
                                <c:forEach var="nsp" items="${listNSP}">
                                    <form:option value="${nsp.idNhomSP}">${nsp.tenNhomSP}</form:option>
                                </c:forEach>
                            </form:select>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-primary btn-block" type="submit" onclick="check()">Thêm</button>
                        </div>
                    </form:form>
                </div>
            </div>
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
                                                <th>Tên loại sản phẩm</th>
                                                <th>Tác vụ</th>
                                            </tr>
                                            </tr>
                                        </thead>
                                        <tbody>  
                                            <c:forEach items="${loai}" var="l">
                                                <tr class="odd gradeX">
                                                    <td class="center">${l.idLoaiSP}</td>
                                                    <td class="center">${l.tenLoaiSP}</td>
                                                    <td><a href="<c:url value="/admin/product/deleteloai/${l.idLoaiSP}"/>" onclick="return confirm('bạn có chắc chắn không? ');">Xóa</a></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <div id="morris-bar-chart"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>