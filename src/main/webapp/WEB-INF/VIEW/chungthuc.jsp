<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<<html>
<head>
    <title>Xac thuc</title>
    <link rel="stylesheet" href="<c:url value="/css/form.css"/>"/>
</head>
<body>
<div class="container">
    <c:url var="action" value="/register"/>
    <form method="get" action="${action}">
        <div class="row">
            <div class="col">
                <h3 class="title">Thêm mới loại sản phẩm</h3>
                <div class="inputBox">
                    <span>Nhập mã xác thực :</span>
                    <input name="code" placeholder="Nhập mã xác thực"/>
                </div>
                <input type="submit" value="Đăng kí" class="submit-btn">
            <div>
        </div>
    </form>
</div>
</body>
</html>