<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 5/16/2022
  Time: 1:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Danh sách Comment</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Thông tin tài khoản comment
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nội dung</th>
                                    <th>Sản phẩm comment</th>
                                    <th>Account comment</th>
                                    <th>Ngày tạo</th>
                                    <th colspan="2">Tác vụ</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="comment" items="${viewcm}">
                                    <tr class="odd gradeX">
                                        <td>${comment.idComment}</td>
                                        <td>${comment.content}</td>
                                        <td>${comment.IDMatHang.tenMH}</td>
                                        <td>${comment.idAccount.user}</td>
                                        <td>${comment.createdDate}</td>
                                        <td><a href="<c:url value="/admin/deleteComment/${comment.idComment}"/>" onclick="return confirm('bạn có chắc chắn không? ');">delete</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.table-responsive -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
    <!-- /.container-fluid -->
</div>


