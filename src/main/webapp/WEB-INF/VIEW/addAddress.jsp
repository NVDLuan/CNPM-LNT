<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/1/2022
  Time: 7:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--    <c:url var="reAdd" value="/address/add"/>--%>
<%--    <form:form modelAttribute="address" method="post" action="${reAdd}">--%>
<%--        name: <form:input path="name" /><br>--%>
<%--        phone: <form:input path="phone"/>--%>
<%--        address: <form:input path="address"/>--%>
<%--        <input type="submit" name="thêm địa chỉ">--%>
<%--    </form:form>--%>
<%--</body>--%>
<%--</html>--%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Thêm địa chỉ</title>
    <!-- MDB icon -->
    <link rel="icon" href="img/mdb-favicon.ico" type="image/x-icon" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" />
    <!-- Google Fonts Roboto -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" />
    <!-- MDB -->
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-address-form.min.css"/>"/>
</head>

<body>
<!-- Start your project here-->
<style>
    .text-font {
        font-family: futura-pt, Tahoma, Geneva, Verdana, Arial, sans-serif;
        font-weight: 700;
        letter-spacing: .156rem;
        font-size: 1.125rem;
    }

    .text-price {
        padding: 0 .625rem;
        font-family: futura-pt, Tahoma, Geneva, Verdana, Arial, sans-serif;
        font-style: normal;
        font-size: .75rem;
        font-weight: 700;
        line-height: .813rem;
        letter-spacing: 1.6px;
    }

    .text-descriptions {
        font-family: futura-pt, Tahoma, Geneva, Verdana, Arial, sans-serif;
        font-style: normal;
        font-size: .75rem;
        font-weight: 400;
        line-height: 1.125rem;
        margin: .313rem 0 .938rem;
        padding: 0 .625rem;
    }

    .button-color {
        color: #4e4e4e;
        border-color: #4e4e4e;
    }

    .button-order {
        font-family: futura-pt, Tahoma, Geneva, Verdana, Arial, sans-serif;
        font-style: normal;
        font-size: .75rem;
        font-weight: 700;
        background-color: hsl(90, 40%, 50%);
        color: white;
    }
</style>
<div class="container my-5 py-5">

    <!--Section: Design Block-->
    <section>

        <div class="row">

            <div class="col-md-12">
                <div class="card mb-4">
                    <div class="card-body">
                        <p class="text-uppercase fw-bold mb-3 text-font">Email address</p>
                        <div class="row">
                            <div class="col-md-4">
                                <p>your-email@gmail.com</p>
                            </div>
                            <div class="col-md-7">
                                <button type="button" class="btn btn-outline-dark float-end button-color "
                                        data-mdb-ripple-color="dark">
                                    Change
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12 mb-4">
                <div class="card mb-4">
                    <div class="card-header py-3">
                        <h5 class="mb-0 text-font text-uppercase">Delivery address</h5>
                    </div>
                    <div class="card-body">
                        <c:url var="reAdd" value="/address/add"/>
                        <form:form modelAttribute="address" method="post" action="${reAdd}">
                        <form>
                            <div class="row mb-4">
                                <div class="col">
                                    <div class="form-outline">
                                        <form:input path="name" type="text" id="form11Example1" class="form-control" />
                                        <label class="form-label" for="form11Example1">Tên của bạn</label>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-outline">
                                        <form:input path="phone" type="text" id="form11Example2" class="form-control" />
                                        <label class="form-label" for="form11Example2">Số điện thoại</label>
                                    </div>
                                </div>
                            </div>

                            <!-- Text input -->
                            <div class="form-outline mb-4">
                                <form:input path="tinh" type="text" id="form11Example3" class="form-control" />
                                <label class="form-label" for="form11Example3">Tỉnh</label>
                            </div>

                            <!-- Text input -->
                            <div class="form-outline mb-4">
                                <form:input path="quan" type="text" id="form11Example4" class="form-control" />
                                <label class="form-label" for="form11Example4">Quận/Huyện</label>
                            </div>
                            <div class="form-outline mb-4">
                                <form:input path="diachinha" type="text" id="form11Example1" class="form-control" />
                                <label class="form-label" for="form11Example4">Địa chỉ</label>
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn button-order col-md-10">Thêm</button>
                            </div>
                        </form:form>
                    </div>

                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-white btn-rounded back-button">Go back</button>
                </div>

            </div>

        </div>

    </section>
</div>
<script type="text/javascript" src="<c:url value="/resources/js/mdb.min.js"/>"></script>
<script type="text/javascript"></script>
</body>
</html>
