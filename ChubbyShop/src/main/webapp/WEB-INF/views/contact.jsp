<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>PhiThang - Assignment Java 5</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
	<%@include file="../common/css.jsp" %>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
	<%@include file="./components/header.jsp" %>
    <!-- Header End -->

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="/home"><i class="fa fa-home"></i> Trang chủ</a>
                        <span>Liên hệ</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Map Section Begin -->
    <div class="map spad">
        <div class="container">
            <div class="map-inner">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.304446915596!2d106.61291731471928!3d10.864432792261871!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752a172d8c987f%3A0x0!2zMTDCsDUxJzUyLjAiTiAxMDbCsDM2JzU0LjQiRQ!5e0!3m2!1svi!2s!4v1647188028669!5m2!1svi!2s"
                    height="610" style="border:0" allowfullscreen=""></iframe>
                <div class="icon">
                    <i class="fa fa-map-marker"></i>
                </div>
            </div>
        </div>
    </div>
    <!-- Map Section Begin -->

    <!-- Contact Section Begin -->
    <section class="contact-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-5">
                    <div class="contact-title">
                        <h4>Liên hệ chúng tôi</h4>
                        <p>Trái với suy nghĩ của nhiều người, PT SHOP chỉ đơn giản là của hàng ngẫu nhiên. Nó có nguồn gốc từ một của hàng cổ điển từ năm 45 trước Công nguyên..</p>
                    </div>
                    <div class="contact-widget">
                        <div class="cw-item p-2">
                            <div class="ci-icon">
                                <i class="ti-location-pin"></i>
                            </div>
                            <div class="ci-text">
                                <span>Địa chỉ:</span>
                                <p>Phường Trung Mỹ Tây, Quận 12, Thành phố Hồ Chí Minh</p>
                            </div>
                        </div>
                        <div class="cw-item p-2">
                            <div class="ci-icon">
                                <i class="ti-mobile"></i>
                            </div>
                            <div class="ci-text">
                                <span>Điện thoại:</span>
                                <p>+84377166208</p>
                            </div>
                        </div>
                        <div class="cw-item p-2">
                            <div class="ci-icon">
                                <i class="ti-email"></i>
                            </div>
                            <div class="ci-text">
                                <span>Email:</span>
                                <p>phithang0403@gmail.com</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 offset-lg-1">
                    <div class="contact-form">
                        <div class="leave-comment">
                            <h4>Để lại bình luận</h4>
                            <p>Nhân viên của chúng tôi sẽ gọi lại sau và giải đáp các thắc mắc của bạn.</p>
                            <form action="#" class="comment-form">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <input type="text" placeholder="Hãy nhập tên của bạn">
                                    </div>
                                    <div class="col-lg-6">
                                        <input type="text" placeholder="Hãy nhập email của bạn">
                                    </div>
                                    <div class="col-lg-12">
                                        <textarea placeholder="Hãy nhập bình luận của bạn"></textarea>
                                        <button type="submit" class="site-btn">Bình luận</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->

    <!-- Footer Section Begin -->
	<%@include file="./components/footer.jsp" %>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
	<%@include file="../common/js.jsp" %>
    <script>
    	$('.item_nav').eq(3).addClass('active');
    </script>
</body>

</html>