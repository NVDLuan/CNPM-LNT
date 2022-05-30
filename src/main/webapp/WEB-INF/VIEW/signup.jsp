<%-- 
    Document   : signup
    Created on : Mar 1, 2022, 5:52:21 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>LOGIN</title>
        <link rel="stylesheet" href="<c:url value="/css/login.css"/>"/>
    </head>

    <body>
        <div id="page">
            <div class="logo">
                <ion-icon name="logo-react"></ion-icon>
            </div>
            <div class="content">
                <div class="left">
                    <div class="title">
                        <h1></h1>
                    </div>
                    <p>Công nghệ phần mềm - Thiết kế website giống shopee
                    </p>
                    <button><a class="left__button" href="<c:url value="/"/>">TRỞ LẠI</a></button>
                </div>
                <div class="right">
                    <c:url var="action" value="/verification"/>
                    <form:form modelAttribute="acc" method="post" action="${action}">
                        <h1>ĐĂNG KÍ SHOP_LNT</h1>                   
                        <form:input type="text" id="username" name="username" placeholder="User" path="user"/>
                        <form:input type="text" id="username" name="username" placeholder="Email của bạn" path="email"/>
                        <form:input type="password" id="username" name="username" placeholder="Mật khẩu của bạn" path="pass"/>
                        <form:input type="password" id="username" name="username" placeholder="Nhập lại mật khẩu của bạn" path="repass"/>
                        <input type="submit" value="ĐĂNG KÍ">
                    </form:form>
                </div>
            </div>
        </div>
        <script src="<c:url value="/js/dangnhap.js"/>"></script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>

</html>


<%--<c:url var="action" value="/verification"/>

<form:form modelAttribute="acc" method="post" action="${action}">
    <table>
        <tr>
            <th>user name </th>  
            <td> <form:input path="user"/> </td>
        </tr>
        <tr>
            <th>password </th>
            <td> <form:password path="pass"/> </td>
        </tr>
        <tr>
            <th>password </th>
            <td> <form:password path="repass"/> </td>
        </tr>
        <tr>
            <th>email </th>
            <td> <form:input path="email"/> </td>
        </tr>
        <tr><td> <input type="submit" value="đăng kí"/> </td> </tr>
    </table>
</form:form>--%>