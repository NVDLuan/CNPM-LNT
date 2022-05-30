<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 4/26/2022
  Time: 9:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Thanh toán</title>--%>
<%--    <!-- Latest compiled and minified CSS -->--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">--%>

<%--    <!-- jQuery library -->--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>--%>

<%--    <!-- Popper JS -->--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>--%>

<%--    <!-- Latest compiled JavaScript -->--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<main role="main">--%>
<%--    <div class="container mt-4">--%>
<%--        <c:if test="${productListA!=null}">--%>
<%--            <c:url var="action" value="/dathang/all"/>--%>
<%--        </c:if>--%>
<%--        <c:if test="${product!=null}">--%>
<%--            <c:url var="action" value="/dathang/${product.idMatHang}"/>--%>
<%--        </c:if>--%>
<%--        <form:form class="needs-validation" name="frmthanhtoan" method="post"--%>
<%--              action="${action}" modelAttribute="hoadon">--%>

<%--            <div class="py-5 text-center">--%>
<%--                <i class="fa fa-credit-card fa-4x" aria-hidden="true"></i>--%>
<%--                <h2>Thanh toán</h2>--%>
<%--                <p class="lead">Vui lòng kiểm tra thông tin Khách hàng, thông tin Giỏ hàng trước khi Đặt hàng.</p>--%>
<%--            </div>--%>
<%--            <c:if test="${diachi==null}">--%>
<%--                <c:url value="/address/add" var="address"/>--%>
<%--                <a href="${address}"><h3>Thêm địa chỉ mới</h3></a>--%>
<%--            </c:if>--%>
<%--            <c:if test="${diachi!=null}">--%>
<%--                <form:select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" path="idAddress">--%>
<%--                    <c:forEach var="ip" items="${diachi}">--%>
<%--                        <form:option value="${ip.id}"> ${ip.name} - ${ip.phone} - ${ip.tinh} - ${ip.quan} - ${ip.diachinha}</form:option>--%>
<%--                    </c:forEach>--%>
<%--                </form:select>--%>
<%--            </c:if>--%>

<%--            <div class="row">--%>
<%--                <div class="col-md-4 order-md-2 mb-4">--%>
<%--                    <h4 class="d-flex justify-content-between align-items-center mb-3">--%>
<%--                        <span class="text-muted">Giỏ hàng</span>--%>
<%--                    </h4>--%>
<%--                    <ul class="list-group mb-3">--%>
<%--                        <c:if test="${productListA!=null}" >--%>
<%--                        <c:forEach var="li" items="${productListA}">--%>
<%--                        <input type="hidden" name="sanphamgiohang[1][sp_ma]" value="2">--%>
<%--                        <input type="hidden" name="sanphamgiohang[1][gia]" value="11800000.00">--%>
<%--                        <input type="hidden" name="sanphamgiohang[1][soluong]" value="2">--%>
<%--                            <li class="list-group-item d-flex justify-content-between lh-condensed">--%>
<%--                                <div>--%>
<%--                                    <h6 class="my-0">${li.idMatHang.tenMH}</h6>--%>
<%--                                    <small class="text-muted">${li.idMatHang.giaKhuyenMai}</small>--%>
<%--                                </div>--%>
<%--                                <span class="text-muted">${li.idMatHang.gia}</span>--%>
<%--                            </li>--%>
<%--                        <input type="hidden" name="sanphamgiohang[2][sp_ma]" value="4">--%>
<%--                        <input type="hidden" name="sanphamgiohang[2][gia]" value="14990000.00">--%>
<%--                        <input type="hidden" name="sanphamgiohang[2][soluong]" value="8">--%>
<%--                        </c:forEach>--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${product!=null}">--%>
<%--                            <input type="hidden" name="sanphamgiohang[1][sp_ma]" value="2">--%>
<%--                            <input type="hidden" name="sanphamgiohang[1][gia]" value="11800000.00">--%>
<%--                            <input type="hidden" name="sanphamgiohang[1][soluong]" value="2">--%>
<%--                            <li class="list-group-item d-flex justify-content-between lh-condensed">--%>
<%--                                <div>--%>
<%--                                    <h6 class="my-0">${product.tenMH}</h6>--%>
<%--                                    <small class="text-muted">${product.giaKhuyenMai}</small>--%>
<%--                                </div>--%>
<%--                                <span class="text-muted">${product.gia}</span>--%>
<%--                            </li>--%>
<%--                            <input type="hidden" name="sanphamgiohang[2][sp_ma]" value="4">--%>
<%--                            <input type="hidden" name="sanphamgiohang[2][gia]" value="14990000.00">--%>
<%--                            <input type="hidden" name="sanphamgiohang[2][soluong]" value="8">--%>
<%--                        </c:if>--%>
<%--                        <li class="list-group-item d-flex justify-content-between">--%>
<%--                            <span>Tổng thành tiền</span>--%>
<%--                            <strong>143520000</strong>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--                <div class="col-md-8 order-md-1">--%>
<%--                    <h4 class="mb-3">Thông tin khách hàng</h4>--%>

<%--                    <div class="row">--%>
<%--                        <div class="col-md-12">--%>
<%--                            <label for="kh_ten">Họ tên</label>--%>
<%--                            <input type="text" class="form-control" name="kh_ten" id="kh_ten"--%>
<%--                                   value="" readonly="">--%>
<%--                        </div>--%>
<%--                        <div class="col-md-12">--%>
<%--                            <label for="kh_gioitinh">Số điện thoại</label>--%>
<%--                            <input type="text" class="form-control" name="kh_gioitinh" id="kh_gioitinh" value="Nam"--%>
<%--                                   readonly="">--%>
<%--                        </div>--%>
<%--                        <div class="col-md-12">--%>
<%--                            <label for="kh_diachi">Tỉnh</label>--%>
<%--                            <input type="text" class="form-control" name="kh_diachi" id="kh_diachi"--%>
<%--                                   value="144 Tố Hữu" readonly="">--%>
<%--                        </div>--%>
<%--                        <div class="col-md-12">--%>
<%--                            <label for="kh_dienthoai">Quận/Huyện</label>--%>
<%--                            <input type="text" class="form-control" name="kh_dienthoai" id="kh_dienthoai"--%>
<%--                                   value="0383714696" readonly="">--%>
<%--                        </div>--%>
<%--                        <div class="col-md-12">--%>
<%--                            <label for="kh_email">Địa chỉ</label>--%>
<%--                            <input type="text" class="form-control" name="kh_email" id="kh_email"--%>
<%--                                   value="TNhan.ITTechnology@gamil.com" readonly="">--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <h4 class="mb-3">Hình thức thanh toán</h4>--%>

<%--                    <div class="d-block my-3">--%>
<%--                        <div class="custom-control custom-radio">--%>
<%--                            <input id="httt-1" name="httt_ma" type="radio" class="custom-control-input" required=""--%>
<%--                                   value="1">--%>
<%--                            <label class="custom-control-label" for="httt-1">Tiền mặt</label>--%>
<%--                        </div>--%>
<%--                        <div class="custom-control custom-radio">--%>
<%--                            <input id="httt-2" name="httt_ma" type="radio" class="custom-control-input" required=""--%>
<%--                                   value="2">--%>
<%--                            <label class="custom-control-label" for="httt-2">Chuyển khoản</label>--%>
<%--                        </div>--%>
<%--                        <div class="custom-control custom-radio">--%>
<%--                            <input id="httt-3" name="httt_ma" type="radio" class="custom-control-input" required=""--%>
<%--                                   value="3">--%>
<%--                            <label class="custom-control-label" for="httt-3">Ship COD</label>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <hr class="mb-4">--%>
<%--                    <button class="btn btn-primary btn-lg btn-block" type="submit" name="btnDatHang">Đặt--%>
<%--                        hàng</button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </form:form>--%>

<%--    </div>--%>
<%--    <!-- End block content -->--%>
<%--</main>--%>
<%--</body>--%>
<%--</html>--%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Trang thanh toán</title>
    <!-- MDB icon -->
    <link rel="icon" href="img/mdb-favicon.ico" type="image/x-icon" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" />
    <!-- Google Fonts Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" />
    <!-- MDB -->
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-address-form.min.css"/>" />
</head>

<body>
<!-- Start your project here-->
<style>
    .text-font{
        font-family: futura-pt,Tahoma,Geneva,Verdana,Arial,sans-serif;
        font-weight: 700;
        letter-spacing: .156rem;
        font-size: 1.125rem;
    }
    .text-price{
        padding: 0 .625rem;
        font-family: futura-pt,Tahoma,Geneva,Verdana,Arial,sans-serif;
        font-style: normal;
        font-size: .75rem;
        font-weight: 700;
        line-height: .813rem;
        letter-spacing: 1.6px;
    }
    .text-descriptions{
        font-family: futura-pt,Tahoma,Geneva,Verdana,Arial,sans-serif;
        font-style: normal;
        font-size: .75rem;
        font-weight: 400;
        line-height: 1.125rem;
        margin: .313rem 0 .938rem;
        padding: 0 .625rem;
    }
    .button-color{
        color: #4e4e4e ;
        border-color: #4e4e4e ;
    }
    .button-order{
        font-family: futura-pt,Tahoma,Geneva,Verdana,Arial,sans-serif;
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
        <c:if test="${productListA!=null}">
            <c:url var="action" value="/dathang/all"/>
        </c:if>
        <c:if test="${product!=null}">
            <c:url var="action" value="/dathang/${product.idMatHang}"/>
        </c:if>
        <form:form class="needs-validation" name="frmthanhtoan" method="post" action="${action}" modelAttribute="hoadon">
        <div class="row">
            <div class="text-center">THANH TOÁN</div>
            <div class="col-md-8">
                <div class="card mb-4 accordion" id="accordionExample">
                    <div class="card body accordion-item">
                        <h2 class="accordion-header" id="headingOne">
                            <div class="accordion-button collapsed text-uppercase text-font h4" type="button"
                                 data-mdb-toggle="collapse" data-mdb-target="#collapseOne" aria-expanded="false"
                                 aria-controls="collapseOne">
                                Địa chỉ đã có của bạn
                            </div>
                        </h2>
                        <c:if test="${diachi==null}">
                            <c:url value="/address/add" var="address"/>
                            <a href="${address}"><h3>Thêm địa chỉ mới</h3></a>
                        </c:if>

                        <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne"
                             data-mdb-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="form-outline d-flex">
                                    <c:if test="${diachi!=null}">
                                        <form:select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" path="idAddress">
                                            <c:forEach var="ip" items="${diachi}">
                                                <form:option value="${ip.id}"> ${ip.name} - ${ip.phone} - ${ip.tinh} - ${ip.quan} - ${ip.diachinha}</form:option>
                                            </c:forEach>
                                        </form:select>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card mb-4">
                    <div class="card-body">
                        <p class="text-uppercase fw-bold mb-3 text-font">Email address</p>
                        <div class="row">
                            <div class="col-md-4">
                                <p>Shop linh kiện điện tử</p>
                            </div>
                            <div class="col-md-7">
                                <c:url value="/address/add" var="address"/>
                                <a href="${address}" class="btn btn-outline-dark float-end button-color "
                                        data-mdb-ripple-color="dark">
                                    Thêm địa chỉ
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4 position-static">
                <div class="card mb-4">
                    <div class="card-header py-3">
                        <h5 class="mb-0 text-font">Sản phẩm<span class="float-end mt-1"
                                                                style="font-size: 13px ;">Được mua</span></h5>
                    </div>
                    <div class="card-body">
                        <c:if test="${productListA!=null}" >
                            <? int sum =0;?>
                            <c:forEach var="li" items="${productListA}">
                                <?
                                    sum +=${li.idMatHang.giaKhuyenMai}* ${li.soLuong};
                                ?>
                                <br>
                            <div class="row">
                                <div class="col-md-4">
                                    <img src="${li.idMatHang.hinhAnh}"
                                         class="rounded-3" style="width: 100px;" alt="Blue Jeans Jacket" />
                                </div>
                                <div class="col-md-6 ms-3">
                                    <span class="mb-0 text-price price">${li.idMatHang.giaKhuyenMai}</span>
                                    <p class="mb-0 text-descriptions">${li.idMatHang.tenMH}</p>
                                    <p class="text-descriptions mt-0">Số lượng:<span class="text-descriptions fw-bold counter-cart">${li.soLuong}</span>
                                    </p>
                                </div>
                            </div>

                            </c:forEach>
                            <div class="card-footer mt-4">
                                <ul class="list-group list-group-flush">
                                    <li
                                            class="list-group-item d-flex justify-content-between align-items-center px-0 fw-bold text-uppercase">
                                        Tổng tiền
                                        <span id="sumMoney"><?=sum?></span>
                                    </li>
                                </ul>
                            </div>
                        </c:if>
                        <c:if test="${product!=null}">
                        <div class="row">
                            <div class="col-md-4">
                                <img src="${product.hinhAnh}"
                                     class="rounded-3" style="width: 100px;" alt="Blue Jeans Jacket" />
                            </div>
                            <div class="col-md-6 ms-3">
                                <span class="mb-0 text-price ">${product.giaKhuyenMai}</span>
                                <p class="mb-0 text-descriptions">${product.tenMH}</p>
                                <p class="text-descriptions mt-0">Số lượng:<span
                                        class="text-descriptions fw-bold">1</span>
                                </p>
                            </div>
                        </div>
                        <div class="card-footer mt-4">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0 text-muted">
                                    Subtotal
                                    <span>${li.idMatHang.giaKhuyenMai}</span>
                                </li>
<%--                                <li class="list-group-item d-flex justify-content-between align-items-center px-0 fw-bold text-uppercase">--%>
<%--                                    <span>${li.idMatHang.giaKhuyenMai}</span>--%>
<%--                                </li>--%>
                            </ul>
                        </div>
                        </c:if>
                    </div>
                </div>
            </div>

            <div class="col-md-8 mb-4">
                <div class="text-center">
                    <button type="submit" class="btn button-order col-md-10">Mua ngay</button>
                </div>
            </div>
        </div>
    </section>
    </form:form>
    <!--Section: Design Block-->

</div>
<!-- End your project here-->

<!-- MDB -->
<script type="text/javascript" src="<c:url value="/js/mdb.min.js" />"></script>
<!-- Custom scripts -->
<script type="text/javascript"></script>
<script>
    function capnhatSum (){
        var gia = document.getElementsByClassName("price");
        var counts = document.getElementsByClassName("counter-cart");
        var sum =0;
        for(i=0; i<gia.length; i++){
            console.log(gia[i].innerText);
            sum += parseInt(gia[i].innerText)* parseInt(counts[i].innerText);
            console.log(sum);
        }
        document.getElementById("sumMoney").innerText=viewMoney(sum.toString());
        document.getElementById("sumMoneytmp").innerText=viewMoney(sum.toString());
    }
    window.addEventListener("load", capnhatSum());
    function viewMoney(money){
        result ="0đ";
        len = money.length/3;
        console.log(len)

        for(i=0; i<len; i++){
            console.log(i);
            if(i==0){
                tmp =money.slice(-3);
                if(tmp!=null){
                    result= tmp+"VND";
                }
            }
            else{
                tmp= money.slice((i+1)*-3, i*(-3));
                console.log(tmp)
                if(tmp!=null || tmp!=""){
                    result= tmp + "."+result;
                }
            }


        }
        return result;

    }
</script>
</body>

</html>