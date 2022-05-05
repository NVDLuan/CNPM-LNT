<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/1/2022
  Time: 7:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <c:url var="reAdd" value="/address/add"/>
    <form:form modelAttribute="address" method="post" action="${reAdd}">
        name: <form:input path="name" /><br>
        phone: <form:input path="phone"/>
        address: <form:input path="address"/>
        <input type="submit" name="thêm địa chỉ">
    </form:form>
</body>
</html>
