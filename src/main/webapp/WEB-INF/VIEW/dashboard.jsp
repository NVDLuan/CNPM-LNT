<%-- 
    Document   : dashboard
    Created on : Apr 22, 2022, 7:57:56 PM
    Author     : ACER
--%>

<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html>
<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Dashboard</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-comments fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">26</div>
                                <div>Bình luận mới!</div>
                            </div>
                        </div>
                    </div>
                    <a href="<c:url value="/admin/comment"/> ">
                        <div class="panel-footer">
                            <span class="pull-left">Xem chi tiết</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-green">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa-solid fa-store fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">12</div>
                                <div>Sản phẩm mới!</div>
                            </div>
                        </div>
                    </div>
                    <a href="<c:url value="/admin/sanpham"/>">
                        <div class="panel-footer">
                            <span class="pull-left">Xem chi tiết</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-yellow">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-shopping-cart fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">${countnew}</div>
                                <div>Đơn hàng mới!</div>
                            </div>
                        </div>
                    </div>
                    <a href="<c:url value="/admin/donDatHang/new"/>">
                        <div class="panel-footer">
                            <span class="pull-left">Xem chi tiết</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-red">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa-solid fa-user fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">13</div>
                                <div>Tài khoản!</div>
                            </div>
                        </div>
                    </div>
                    <a href="<c:url value="/admin/taikhoan"/>">
                        <div class="panel-footer">
                            <span class="pull-left">Xem chi tiết</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
        </div>

        <!-- /.row -->
        <div class="row">
            <div class="col-lg-8">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-clock-o fa-fw"></i> Responsive Timeline
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <ul class="timeline">
                            <li>
                                <div class="timeline-badge"><i class="fa fa-check"></i>
                                </div>
                                <div class="timeline-panel">
                                    <div class="timeline-heading">
                                        <h4 class="timeline-title">SHOPEE</h4>

                                        <p>
                                            <small class="text-muted"><i class="fa fa-clock-o"></i> 11 hours ago via
                                                Twitter
                                            </small>
                                        </p>
                                    </div>
                                    <div class="timeline-body">
                                        <p>Shopee là ứng dụng mua sắm trực tuyến và là sàn giao dịch thương mại điện tử có trụ sở đặt tại Singapore,
                                            thuộc sở hữu của Sea Ltd, được thành lập vào năm 2009 bởi Lý Tiểu Đông.</p>
                                    </div>
                                </div>
                            </li>
                            <li class="timeline-inverted">
                                <div class="timeline-badge warning"><i class="fa fa-credit-card"></i>
                                </div>
                                <div class="timeline-panel">
                                    <div class="timeline-heading">
                                        <h4 class="timeline-title">SHOPEE - GÌ CŨNG CÓ, MUA HẾT Ở SHOPEE</h4>
                                    </div>
                                    <div class="timeline-body">
                                        <p>LShopee - ứng dụng mua sắm trực tuyến thú vị, tin cậy, an toàn và miễn phí!
                                            Shopee là nền tảng giao dịch trực tuyến hàng đầu ở Đông Nam Á, Việt Nam,Singapore,Malaysia,Indonesia,Thái Lan, Philipin, Đài Loan và Brazil. Với sự đảm bảo của Shopee,
                                            bạn sẽ mua hàng trực tuyến an tâm và nhanh chóng hơn bao giờ hết!.</p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="timeline-badge danger"><i class="fa fa-bomb"></i>
                                </div>
                                <div class="timeline-panel">
                                    <div class="timeline-heading">
                                        <h4 class="timeline-title">MUA SẮM VÀ BÁN HÀNG ONLINE ĐƠN GIẢN, NHANH CHÓNG VÀ AN TOÀN</h4>
                                    </div>
                                    <div class="timeline-body">
                                        <p>Nếu bạn đang tìm kiếm một trang web để mua và bán hàng trực tuyến thì Shopee.vn là một sự lựa chọn tuyệt vời dành cho bạn. Bản chất của Shopee là một
                                            social E-commerce platform - nền tảng trang web thương mại điện tử tích hợp mạng xã hội. Điều này cho phép người mua và người bán hàng dễ dàng tương tác,
                                            trao đổi thông tin về sản phẩm và chương trình khuyến mãi của shop. Nhờ nền tảng đó, việc mua bán trên Shopee trở nên nhanh chóng và đơn giản hơn. Bạn có
                                            thể trò chuyện trực tiếp với nhà bán hàng để hỏi trực tiếp về mặt hàng cần mua. Còn nếu bạn muốn tìm mua những dòng sản phẩm chính hãng, uy tín, Shopee Mall
                                            chính là sự lựa chọn lí tưởng dành cho bạn. Để bạn có thể dễ dàng khi tìm hiểu và sử dụng sản phẩm, Shopee Blog- trang blog thông tin chính thức của Shopee -
                                            sẽ giúp bạn có thể tìm được cho mình các kiến thức về xu hướng thời trang, review công nghệ, mẹo làm đẹp, tin tức tiêu dùng và deal giá tốt bất ngờ.
                                            Đến với Shopee, cơ hội để trở thành một nhà bán hàng dễ dàng hơn bao giờ hết. Chỉ với vài thao tác trên ứng dụng, bạn đã có thể đăng bán ngay những sản phẩm của
                                            mình. Không những thế, các nhà bán hàng có thể tự tạo chương trình khuyến mãi trên Shopee để thu hút người mua với những sản phẩm có mức giá hấp dẫn. Khi đăng nhập tại
                                            Shopee Kênh người bán, bạn có thể dễ dàng phân loại sản phẩm, theo dõi đơn hàng, chăm sóc khách hàng và cập nhập ngay các hoạt động của shop.

                                        </p>
                                    </div>
                                </div>
                            </li>
                            <li class="timeline-inverted">
                                <div class="timeline-panel">
                                    <div class="timeline-heading">
                                        <h4 class="timeline-title">MUA HÀNG HIỆU CAO CẤP GIÁ TỐT TẠI SHOPEE</h4>
                                    </div>
                                    <div class="timeline-body">
                                        <p>Bên cạnh Shopee Premium, Shopee còn có rất nhiều khuyến mãi khủng cho hàng hiệu giảm đến 50%. Cộng với mã giao hàng miễn phí, Shopee cũng có các mã giảm giá được phân
                                            phối mỗi tháng từ rất nhiều gian hàng chính hãng tham gia chương trình khuyến mãi này. Bên cạnh đó, Shopee còn tập hợp rất nhiều thương hiệu đình đám được các nhà bán
                                            lẻ uy tín phân phối bán trên Shopee, top sản phẩm hot deal cho bạn săn sale luôn cập nhật mỗi giờ, mỗi ngày, đem đến cho bạn sự lựa chọn đa dạng, từ các hãng mỹ phẩm nổi
                                            tiếng hàng đầu như Kiehl's, MAC, Foreo, SK-II, Estee Lauder,... Đến những thương hiệu công nghệ nổi tiếng như camera hành trình Gopro, máy ảnh Fuifilm, webcam Hikvision,
                                            máy đọc sách Kindle,... Tại Shopee, bạn có thể dễ dàng tìm thấy các thương hiệu giày thể thao phổ biến hiện nay như: Converse, New Balance, Nike, Vans, Crocs,... </p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="timeline-badge info"><i class="fa fa-save"></i>
                                </div>
                                <div class="timeline-panel">
                                    <div class="timeline-heading">
                                        <h4 class="timeline-title">MUA HÀNG CHÍNH HÃNG TỪ CÁC THƯƠNG HIỆU LỚN VỚI SHOPEE</h4>
                                    </div>
                                    <div class="timeline-body">
                                        <p>Mua hàng trên Shopee luôn là một trải nghiệm ấn tượng. Dù bạn đang có nhu cầu mua bất kỳ mặt hàng thời trang nam,
                                            thời trang nữ, đồng hồ, điện thoại, nước rửa tay khô hay khẩu trang N95 thì Shopee cũng sẽ đảm bảo cung cấp cho
                                            bạn những sản phẩm ưng ý. Bên cạnh đó,
                                            Shopee cũng có sự tham gia của các thương hiệu hàng đầu thế giới ở đa dạng nhiều lĩnh vực khác nhau.</p>
                                        <hr>
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-primary btn-sm dropdown-toggle"
                                                    data-toggle="dropdown">
                                                <i class="fa fa-gear"></i> <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="#">Action</a>
                                                </li>
                                                <li><a href="#">Another action</a>
                                                </li>
                                                <li><a href="#">Something else here</a>
                                                </li>
                                                <li class="divider"></li>
                                                <li><a href="#">Separated link</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="timeline-panel">
                                    <div class="timeline-heading">
                                        <h4 class="timeline-title">TẢI ỨNG DỤNG SHOPEE NGAY ĐỂ MUA BÁN ONLINE MỌI LÚC, MỌI NƠI</h4>
                                    </div>
                                    <div class="timeline-body">
                                        <p>Tại Shopee, bạn có thể lấy các mã giảm giá Shopee vàmã miễn phí vận chuyển toàn quốc. Bên cạnh đó, Shopee cũng sẽ có
                                            những chiến dịch khuyến mãi lớn hằng năm như Siêu hội tiêu dùng 15.3, Shopee 4.4 sale, Shopee 5.5 sale, Shopee 9.9 sale,
                                            Shopee 10.10 sale, Shopee 11.11 sale, Shopee 12.12 sale, Shopee Tết Sale. Đây là thời điểm để người mua hàng có thể nhanh
                                            tay chọn ngay cho mình những mặt hàng ưa thích với mức giá giảm kỉ lục..</p>
                                    </div>
                                </div>
                            </li>
                            <li class="timeline-inverted">
                                <div class="timeline-badge success"><i class="fa fa-graduation-cap"></i>
                                </div>
                                <div class="timeline-panel">
                                    <div class="timeline-heading">
                                        <h4 class="timeline-title">Đăng Ký Bán Hàng Trên Shopee Với Chương Trình Nhà Bán Hàng Tiềm Năng - Hỗ Trợ Lên Đến 20 Triệu</h4>
                                    </div>
                                    <div class="timeline-body">
                                        <p>Bạn là một chủ shop muốn mở rộng bán hàng online trên sàn thương mại điện tử? Bạn đang là người bán trên Shopee muốn tăng đơn
                                            và hiệu quả kinh doanh? Vậy thì chương trình Nhà Bán Hàng Tiềm Năng Shopee sẽ đáp ứng tất cả mong muốn của bạn: từ hỗ trợ miễn
                                            phí đăng ký bán hàng trên Shopee, tư vấn các công cụ marketing và chương trình khuyến mãi cho đến tặng gói Freeship Xtra, Hoàn
                                            Xu Xtra và còn nhiều hỗ trợ đặc biệt khác nữa. Bằng cách tham gia chương trình, bạn có thể nhanh chóng gia tăng đơn hàng, phát
                                            triển kinh doanh và trở thành người bán hàng chuyên nghiệp.</p>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-8 -->
            <div class="col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-bell fa-fw"></i> Thông báo
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="list-group">
                            <a href="#" class="list-group-item">
                                <i class="fa fa-comment fa-fw"></i> Bình luận mới
                                <span class="pull-right text-muted small"><em>4 phút trước</em>
                                </span>
                            </a>
                            <a href="#" class="list-group-item">
                                <i class="fa fa-twitter fa-fw"></i> 34 người theo dõi mới
                                <span class="pull-right text-muted small"><em>12 phút trước</em>
                                </span>
                            </a>
                            <a href="#" class="list-group-item">
                                <i class="fa fa-envelope fa-fw"></i> Gửi tin nhắn
                                <span class="pull-right text-muted small"><em>27 phút trước</em>
                                </span>
                            </a>
                            <a href="#" class="list-group-item">
                                <i class="fa fa-tasks fa-fw"></i> Nhiệm vụ mới
                                <span class="pull-right text-muted small"><em>43 phút trước</em>
                                </span>
                            </a>
                            <a href="#" class="list-group-item">
                                <i class="fa fa-upload fa-fw"></i> Đơn hàng mới
                                <span class="pull-right text-muted small"><em>11:32 AM</em>
                                </span>
                            </a>
                            <a href="#" class="list-group-item">
                                <i class="fa fa-bolt fa-fw"></i> Mã giảm giá!
                                <span class="pull-right text-muted small"><em>11:13 AM</em>
                                </span>
                            </a>
                            <a href="#" class="list-group-item">
                                <i class="fa fa-warning fa-fw"></i> Báo cáo mới!
                                <span class="pull-right text-muted small"><em>10:57 AM</em>
                                </span>
                            </a>
                            <a href="#" class="list-group-item">
                                <i class="fa fa-shopping-cart fa-fw"></i> Đơn hàng mới!
                                <span class="pull-right text-muted small"><em>9:49 AM</em>
                                </span>
                            </a>
                            <a href="#" class="list-group-item">
                                <i class="fa fa-money fa-fw"></i> Thanh toán
                                <span class="pull-right text-muted small"><em>Hôm nay</em>
                                </span>
                            </a>
                        </div>
                        <!-- /.list-group -->
                        <a href="#" class="btn btn-default btn-block">Xem chi tiết tất cả</a>
                    </div>
                    <!-- /.panel-body -->
                </div>

            </div>
            <!-- /.col-lg-4 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
</div>
