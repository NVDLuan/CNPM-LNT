<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/6/2022
  Time: 3:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id = "page-wrapper">
    <table border="1">
        <tr>
            <td>Username</td>
            <td>${myprofile.user}</td>
        </tr>
        <tr>
            <td>email</td>
            <td>${myprofile.email}</td>
        </tr>
    </table>
    <c:url value="/user/donhang" var="donhang"/>
    <a href="${donhang}" >Hóa đơn </a>
    <h1> đây là trang web frofile</h1>
</div>