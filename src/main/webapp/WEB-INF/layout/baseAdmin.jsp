<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/5/2022
  Time: 9:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
        <!-- Bootstrap Core CSS -->
        <link href="<c:url value="/css/bootstrap.min.css"/> " rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="<c:url value="/css/metisMenu.min.css"/> " rel="stylesheet">

        <!-- Timeline CSS -->
        <link href="<c:url value="/css/timeline.css"/> " rel="stylesheet">

        <!-- Custom CSS -->
        <link href="<c:url value="/css/startmin.css"/> " rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="<c:url value="/css/morris.css"/> " rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="<c:url value="/css/font-awesome.min.css"/> " rel="stylesheet" type="text/css">
        <title><tiles:insertAttribute name="title"/></title>
    </head>
    <body>
        <div id="wrapper">
            <tiles:insertAttribute name="header"/>

            <tiles:insertAttribute name="content"/>

            <tiles:insertAttribute name="footer"/>
        </div>
        <script src="//cdn.ckeditor.com/4.18.0/standard/ckeditor.js"></script>
        <script>

            CKEDITOR.replace( 'editor1' );
        </script>
    </body>
</html>
