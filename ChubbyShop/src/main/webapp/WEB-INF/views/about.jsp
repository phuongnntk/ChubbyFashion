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
                        <span>Giới thiệu</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->
    
    <!-- begin content -->
    <section class="about">
        <div class="about-photo-6-mian py-5">
            <div class="container py-lg-5">
                <div class="align-photo-6-inf-cols row">
                    <div class="photo-6-inf-right col-lg-6">
                        <h3 class="hny-title text-left">Tất cả bộ quần áo nam có thương hiệu nổi tiếng <span>Giảm giá 30%</span></h3>
                        <p>Ghé thăm cửa hàng của chúng tôi để xem những sáng tạo tuyệt vời từ các nhà thiết kế của chúng tôi.</p>
                        <a href="#" class="about-button btn">Mua sắm ngay bây giờ </a>
                    </div>
                    <div class="photo-6-inf-left col-lg-6">
                        <img src="/img/1.jpg" class="img-fluid rounded-3" alt="">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end content-->

    <!-- begin story-->
    <section class="story">
        <div class="py-5">
            <div class="container py-lg-5">
                <div class="row story-6-grids text-left">
                    <div class="col-lg-5 story-gd pe-5">
                        <img src="/img/left2.jpg" class="img-fluid" alt="/">
                    </div>
                    <div class="col-lg-7 story-gd pl-lg-4 ps-5">
                        <h3 class="hny-title">Những gì chúng tôi <span> cung cấp</span></h3>
                        <p>Để khiến anh ta cởi mở, để theo anh ta đến sự lựa chọn của giới tinh hoa quyến rũ chính. Khi bạn trốn thoát, bạn phải dành toàn bộ tâm trí để đạt được nó thường bằng những lời tâng bốc.
                        </p>
                        <div class="row story-info-content mt-md-5 mt-4">
                            <div class="col-md-6 story-info">
                                <h5> <a href="#">01. Ghé thăm cửa hàng</a></h5>
                                <p>Điều cốt yếu là làm cho nó trở thành hệ thống tuân theo, lựa chọn chính là bắt đầu trò chơi, cần rất nhiều can đảm để đạt được nó.
                                </p>
                            </div>
                            <div class="col-md-6 story-info">
                                <h5> <a href="#">02. Thêm vào giỏ hàng</a></h5>
                                <p>Điều cốt yếu là làm cho nó trở thành hệ thống tuân theo, lựa chọn chính là bắt đầu trò chơi, cần rất nhiều can đảm để đạt được nó.
                                </p>
                            </div>
                            <div class="col-md-6 story-info">
                                <h5> <a href="#">03. Thẻ quà tặng</a></h5>
                                <p>Điều cốt yếu là làm cho nó trở thành hệ thống tuân theo, lựa chọn chính là bắt đầu trò chơi, cần rất nhiều can đảm để đạt được nó.
                                </p>
                            </div>
                            <div class="col-md-6 story-info">
                                <h5> <a href="#">04. Cửa hàng độc nhất</a></h5>
                                <p>Điều cốt yếu là làm cho nó trở thành hệ thống tuân theo, lựa chọn chính là bắt đầu trò chơi, cần rất nhiều can đảm để đạt được nó.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end story -->

    <!--begin team -->
    <section class="team">
        <div class="team py-5">
            <div class="container py-lg-5">
                <h3 class="hny-title text-center"> Gặp gỡ <span> chúng tôi</span></h3>
                <div class="row team-row mt-5">
                    <div class="col-lg-4 col-sm-6 mb-lg-0 mb-4 team-wrapper position-relative">
                        <a href="#"><img src="/img/pi.jpg" class="team_member img-fluid" alt="Team Member"></a>
                        <div class="team_info mt-3 position-absolute">
                            <h3><a href="#" class="team_name">Trần Mậu Phi</a></h3>
                            <span class="team_role">Sáng lập & Thiết kế</span>
                            <ul class="team-social mt-3">
                                <li><a href="#"><span class="fa fa-facebook icon_facebook"></span></a></li>
                                <li><a href="#"><span class="fa fa-twitter icon_twitter"></span></a></li>
                                <li><a href="#"><span class="fa fa-linkedin icon_linkedin"></span></a></li>
                                <li><a href="#"><span class="fa fa-google-plus icon_google-plus"></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- end team member -->

                    <div class="col-lg-4 col-sm-6 mb-lg-0 mb-4 team-wrapper position-relative">
                        <a href="#"><img src="/img/thang.jpg" class="team_member img-fluid" alt="Team Member"></a>
                        <div class="team_info mt-3 position-absolute">
                            <h3><a href="#" class="team_name">Nguyễn Nhập Cao Thăng</a></h3>
                            <span class="team_role">Sáng lập & CEO</span>
                            <ul class="team-social mt-3">
                                <li><a href="#"><span class="fa fa-facebook icon_facebook"></span></a></li>
                                <li><a href="#"><span class="fa fa-twitter icon_twitter"></span></a></li>
                                <li><a href="#"><span class="fa fa-linkedin icon_linkedin"></span></a></li>
                                <li><a href="#"><span class="fa fa-google-plus icon_google-plus"></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- end team member -->
                    <div class="col-lg-4 col-sm-6 team-wrapper position-relative">
                        <a href="#"><img src="/img/team.jpg" class="team_member img-fluid" alt="Team Member"></a>
                        <div class="team_info mt-3 position-absolute">
                            <h3><a href="#" class="team_name">Team PT</a></h3>
                            <span class="team_role">Sáng lập & Tiếp thị</span>
                            <ul class="team-social mt-3">
                                <li><a href="#"><span class="fa fa-facebook icon_facebook"></span></a></li>
                                <li><a href="#"><span class="fa fa-twitter icon_twitter"></span></a></li>
                                <li><a href="#"><span class="fa fa-linkedin icon_linkedin"></span></a></li>
                                <li><a href="#"><span class="fa fa-google-plus icon_google-plus"></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- end team member -->
                </div>
            </div>
         </div>
    </section>
    <!-- end team -->

    <!-- Footer Section Begin -->
	<%@include file="./components/footer.jsp" %>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
	<%@include file="../common/js.jsp" %>
    <script>
    	$('.item_nav').eq(1).addClass('active');
    </script>
</body>

</html>