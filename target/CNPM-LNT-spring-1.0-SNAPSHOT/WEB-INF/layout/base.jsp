<%-- 
    Document   : base
    Created on : Feb 28, 2022, 1:22:26 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" href="<c:url value="/css/base.css"/>" type="text/css"/>
        <link rel="stylesheet" href="<c:url value="/css/main.css"/>"/>
        <link rel="stylesheet" href="<c:url value="/css/all.min.css"/>"/>
        <link rel="stylesheet" href="<c:url value="/css/slider.css"/>"/>
        <link rel="stylesheet" href="<c:url value="/resources/css/addcass.css"/>"/>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.3/moment.min.js"></script>
        <title><tiles:insertAttribute name="title"/></title>
        <link rel="shortcut icon" href="<c:url value="/images/shop.png"/>">
    </head>
    <body>
        <div class="app">

            <tiles:insertAttribute name="header"/>

            <tiles:insertAttribute name="content"/>


            <tiles:insertAttribute name="footer"/>
        </div>
        <script src="<c:url value="/js/login.js"/>"></script>
        <script src="<c:url value="/js/signup.js"/>"></script>
        <script src="<c:url value="/js/slider.js"/>"></script>
        <script src="<c:url value="/js/addCart.js"/> "></script>
        <script src="<c:url value="/js/Comment.js"/> "></script>
        <script src="<c:url value="/js/addComment.js"/> "></script>

    </body>
</html>
