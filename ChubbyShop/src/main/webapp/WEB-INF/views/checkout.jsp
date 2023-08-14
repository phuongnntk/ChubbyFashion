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
                    <div class="breadcrumb-text product-more">
                        <a href="/home"><i class="fa fa-home"></i> Trang chủ</a>
                        <a href="/products">Giỏ hàng</a>
                        <span>Thanh toán</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Shopping Cart Section Begin -->
    <section class="checkout-section spad pt-4">
        <div class="container">
            <form action="/checkout" method="post" id="checkout" class="checkout-form" onsubmit="return checkout()">
                <div class="row">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-lg-6">
                                <label for="address">Địa chỉ<span>*</span></label>
                                <input type="text" name="address" id="address" value="${sessionScope.account.address}" placeholder="Hãy nhập địa chỉ">
                            </div>
                            <div class="col-lg-6">
                                <label for="phone">Điện thoại<span>*</span></label>
                                <input type="text" name="phone" id="phone" value="${sessionScope.account.phone}" placeholder="Hãy nhập số điện thoại">
                            </div>
                        </div>
                        <div class="place-order">
                            <h4>Đơn hàng của bạn</h4>
                            <div class="order-total">
                                <ul class="order-table">
                                    <li>Sản phẩm <span>Tổng tiền</span></li>
                                    <c:forEach var="detail" items="${cart.listDetail}">
                                    	<li class="fw-normal d-flex align-items-center justify-content-between">
                                    		<div>
	                                    		<img src="/images/${detail.value.cateId}/${detail.value.image}" style="width: 50px" alt=""> 
	                                    		 
	                                    		<b>${detail.value.name}</b>  x ${detail.value.quantity}
                                    		</div>
                                    		<span><fmt:formatNumber type="number" value="${detail.value.price}" /> VND</span>
                                    	</li>
                                    </c:forEach>
                                </ul>
                                <div class="order-btn">
                                    <button type="submit" class="site-btn place-btn">Đặt hàng</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <!-- Shopping Cart Section End -->

    <!-- Footer Section Begin -->
    <%@include file="./components/footer.jsp" %>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <%@include file="../common/js.jsp" %>
    
    <script type="text/javascript">
		function checkout() {
			if("${sessionScope.account}" != ""){
				var apiUrl = '/api/cart/checkout?username=${sessionScope.account.username}';
				$.ajax({
					url: apiUrl,
					type: 'POST',
					data: {
						address: $('#address').val(),
						phone: 	$('#phone').val()
					},
					dataType: 'json',
					success: function(data){
						if(data){
							document.location = "/home?success=Check out success. Please wait some minute!";
						}else{
							alertResult('alert-danger', 'Error!', 'Check out fail!');
						}
					},
					error: function(error){
						alertResult('alert-danger', 'Error!', 'Check out fail! Error: '+error);
					}
				
				});
			}else{
				alertResult('alert-danger', 'Error!', 'Please login to check out your cart!');
			}
			
			return false;
		}
    </script>
</body>

</html>