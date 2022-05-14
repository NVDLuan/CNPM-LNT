<%-- 
    Document   : chungthuc
    Created on : Mar 17, 2022, 7:11:09 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<c:url var="action" value="/register"/>

<form method="get" action="${action}">
    <table>
        <tr>
            <th>user name </th>
            <td><input name="code"/> </td>
        </tr>

        <tr><td> <input type="submit" value="đăng kí"/> </td> </tr>
    </table>
</form>