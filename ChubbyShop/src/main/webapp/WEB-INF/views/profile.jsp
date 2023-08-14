<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>
<!DOCTYPE html>
<html lang="vi">

<head>
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
                        <span>Thông tin</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Profile Section Begin -->
    <section class="profile p-3">
        <div class="container rounded bg-white mt-3 mb-3">
            <form>
                <div class="py-5">
                    <h2 class="font-weight text-center"><strong>Thông tin cá nhân</strong> </h2>
                </div>
                <div class="row">
                    <div class="col-md-4 border-right">
                        <div class="d-flex flex-column align-items-center text-center px-3 ">
                            <div class="avatar-upload">
                                <div class="avatar-edit">
                                    <input type='file' id="imageUpload" accept=".png, .jpg, .jpeg" />
                                    <label for="imageUpload"></label>
                                </div>
                                <div class="avatar-preview">
                                    <div id="imagePreview" style="background-image: url('avatar/${sessionScope.account.avatar}');">
                                    </div>
                                </div>
                                <div class="mt-3">
                                    <label class="h3"> <strong>${sessionScope.account.fullname}</strong> </label>
                                </div>
                            </div>
                            <div class="mb-5 text-left">
                                <nav class="nav flex-column">
                                    <a class="nav-link active" aria-current="page" href="/profile"><i class="fa fa-drivers-license-o"></i>&nbsp; Thông tin</a>
                                    <a class="nav-link" href="/order_status"><i class="fa fa-shopping-bag"></i>&nbsp; Đơn hàng</a>
                                    <a class="nav-link" href="/change_password"><i class="fa fa-key"></i>&nbsp; Đổi mật khẩu</a>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8 border-right">
                        <div class="p-3 pb-5">
                            <div class="row mb-3">
                                <label class="col-sm-3 form-label font-weight-bold">Tên tài khoản</label>
                                <label class="col-sm-9 border-0">${sessionScope.account.username}</label>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-3 form-label font-weight-bold">Họ và tên</label>
                                <label class="col-sm-9 border-0">${sessionScope.account.fullname}</label>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-3 form-label font-weight-bold">Giới tính</label>
                                <label class="col-sm-9 border-0">${sessionScope.account.gender ? 'Nam' : 'Nữ'}</label>
                            </div>
                            <div class=" row mb-3">
                                <label class="col-sm-3 form-label font-weight-bold">Điện thoại</label>
                                <label class="col-sm-9 border-0">${sessionScope.account.phone}</label>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-3 form-label font-weight-bold">Email</label>
                                <label class="col-sm-9 border-0">${sessionScope.account.email}</label>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-3 form-label font-weight-bold">Địa chỉ</label>
                                <label class="col-sm-9 border-0">${sessionScope.account.address}</label>
                            </div>
                            <div class="mt-5">
                                <a class="btn btn-primary profile-button" href="/edit_profile">Chỉnh sửa thông tin</a>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <!-- Profile Form Section End -->

    <!-- Footer Section Begin -->
    <%@include file="./components/footer.jsp" %>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <%@include file="../common/js.jsp" %>
    <script>
    	$('.item_nav').eq(2).addClass('active');
    	function addToCart(productId) {
    		var apiUrl = '/api/cart/update?productId=' + productId + '&quantity=1&isReplace=false';
    		$.ajax({
    			url: apiUrl,
    			type: 'POST',
    			dataType: 'json',
    			success: function(data){
    				$('#totalQuantity').html(data.totalQuantity);
    				$('#totalPrice1').html(data.totalPrice.toLocaleString('en-US') + ' VND');
    				$('#totalPrice2').html(data.totalPrice.toLocaleString('en-US') + ' VND');
    				$.ajax({
    					url: '/products',
    	    			type: 'GET',
    	    			success: function(data){
    	    				$('#cartShow').html($(data).find('#cartShow').children());
    	    			},
    	    			error: function(error){
    	    				alert('Error: ' + error);
    	    			}
    				})
    				alert('Add product to cart success.');
    			},
    			error: function(error){
    				alert('Add product to cart fail. Error: ' + error);
    			}
    		
    		});
    		return false;
		}
    </script>
</body>

</html>