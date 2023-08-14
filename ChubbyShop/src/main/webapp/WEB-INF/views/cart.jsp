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
                        <span>Giỏ hàng</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="cart-table">
                        <table>
                            <thead>
                                <tr>
                                    <th style="width: 10%">Hình ảnh</th>
                                    <th style="width: 25%" class="p-name">Tên sản phẩm</th>
                                    <th style="width: 20%">Giá</th>
                                    <th style="width: 20%">Số lượng</th>
                                    <th style="width: 20%">Tổng giá</th>
                                    <th style="width: 5%"><i class="ti-close"></i></th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="detail" items="${cart.listDetail}" varStatus="loop">
	                                <tr class="row_cart">
	                                    <td class="cart-pic first-row"><img src="/images/${detail.value.cateId}/${detail.value.image}"  alt=""></td>
	                                    <td class="cart-title first-row">
	                                        <h5>${detail.value.name}</h5>
	                                    </td>
	                                    <td class="p-price first-row"><fmt:formatNumber type="number" value="${detail.value.price / detail.value.quantity}" /> VND</td>
	                                    <td class="qua-col first-row">
	                                        <div class="quantity">
	                                            <div class="pro-qty">
	                                            	<span class="dec qtybtn" onclick="qty(${loop.index},'${detail.value.productId}',0)">-</span>
	                                                <input type="text" class="qty_product" value="${detail.value.quantity}" onchange="updateCart(${loop.index},'${detail.value.productId}')">
	                                            	<span class="inc qtybtn" onclick="qty(${loop.index},'${detail.value.productId}',1)">+</span>
	                                            </div>
	                                        </div>
	                                    </td>
	                                    <td class="total-price first-row price_total"><fmt:formatNumber type="number" value="${detail.value.price}" /> VND</td>
	                                    <td class="close-td first-row"><i class="ti-close" onclick="removeProduct(${loop.index},'${detail.value.productId}')"></i></td>
	                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="">
                        <h3 class="fw-bold">Hóa đơn</h3>
                        <hr class="my-4">
						<c:forEach var="detail" items="${cart.listDetail}">
	                        <div class="d-flex justify-content-between mb-4 row_summary">
	                            <h5 class="h6 qty_summary">${detail.value.quantity}x ${detail.value.name}</h5>
	                            <h5 class="h6 price_summary"><fmt:formatNumber type="number" value="${detail.value.price}" /> VND</h5>
	                        </div>
						</c:forEach>
                        <hr class="my-4 ">
                    </div>
                    <div class="">
                        <div class="discount-coupon">
                            <h6>Mã giảm giá</h6>
                            <form action="#" class="coupon-form">
                                <input type="text" placeholder="Hãy nhập mã giảm giá">
                                <button type="submit" class="site-btn coupon-btn">Áp dụng</button>
                            </form>
                        </div>
                    </div>
                    <div class="">
                        <div class="proceed-checkout">
                            <ul>
                            	<li class="subQuantity mb-3">Số lượng <span id="subQuantity">${cart.totalQuantity}</span></li>
                                <li class="subTotal">Tổng giá<span id="subTotal"><fmt:formatNumber type="number" value="${cart.totalPrice}" /> VND</span></li>
                                <hr>
                                <li class="cart-total">Tổng tiền <span id="cartTotal"><fmt:formatNumber type="number" value="${cart.totalPrice}" /> VND</span></li>
                            </ul>
                            <a href="/checkout" class="proceed-btn">Thanh toán</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->

    <!-- Footer Section Begin -->
	<%@include file="./components/footer.jsp" %>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
	<%@include file="../common/js.jsp" %>
	
	<script type="text/javascript">
		function updateCart(index,productId) {
    		var quantity = $('.qty_product').eq(index).val();
    		if(quantity == 0){
    			removeProduct(index,productId);
    		}else{
	    		var apiUrl = '/api/cart/update?productId=' + productId + '&quantity=' + quantity + '&isReplace=true';
	    		$.ajax({
	    			url: apiUrl,
	    			type: 'POST',
	    			dataType: 'json',
	    			success: function(data){
	    				console.log(data.listDetail[index]);
	    				$('.price_total').eq(index).html(data.listDetail[productId].price.toLocaleString('en-US') + ' VND');
	    				$('.price_summary').eq(index).html(data.listDetail[productId].price.toLocaleString('en-US') + ' VND');
	    				$('.qty_summary').eq(index).html(data.listDetail[productId].quantity + 'x ' + data.listDetail[productId].name);
	
	    				$('#subQuantity').html(data.totalQuantity);
	    				$('#subTotal').html(data.totalPrice.toLocaleString('en-US') + ' VND');
	    				$('#cartTotal').html(data.totalPrice.toLocaleString('en-US') + ' VND');
	
	    				$('#totalQuantity').html(data.totalQuantity);
	    				$('#totalPrice1').html(data.totalPrice.toLocaleString('en-US') + ' VND');
	    				$('#totalPrice2').html(data.totalPrice.toLocaleString('en-US') + ' VND');
	    				$.ajax({
	    					url: '/cart',
	    	    			type: 'GET',
	    	    			success: function(data){
	    	    				$('#cartShow').html($(data).find('#cartShow').children());
	    	    			},
	    	    			error: function(error){
	    	    				alert('Error: ' + error);
	    	    			}
	    				})
	    			},
	    			error: function(error){
	    				alert('Add product to cart fail. Error: ' + error);
	    			}
	    		
	    		});
    		}
		}
		
		function removeProduct(index,productId) {
    		$('.row_cart').eq(index).remove();
    		$('.row_summary').eq(index).remove();
    		var apiUrl = '/api/cart/update?productId=' + productId + '&quantity=0&isReplace=true';
    		$.ajax({
    			url: apiUrl,
    			type: 'POST',
    			dataType: 'json',
    			success: function(data){

    				$('#subQuantity').html(data.totalQuantity);
    				$('#subTotal').html(data.totalPrice.toLocaleString('en-US') + ' VND');
    				$('#cartTotal').html(data.totalPrice.toLocaleString('en-US') + ' VND');

    				$('#totalQuantity').html(data.totalQuantity);
    				$('#totalPrice1').html(data.totalPrice.toLocaleString('en-US') + ' VND');
    				$('#totalPrice2').html(data.totalPrice.toLocaleString('en-US') + ' VND');
    				$.ajax({
    					url: '/cart',
    	    			type: 'GET',
    	    			success: function(data){
    	    				$('#cartShow').html($(data).find('#cartShow').children());
    	    			},
    	    			error: function(error){
    	    				alert('Error: ' + error);
    	    			}
    				})
    			},
    			error: function(error){
    				alert('Add product to cart fail. Error: ' + error);
    			}
    		
    		});
		}
		
		
		
		function qty(index,productId, check) {
				var value = $('.qty_product').eq(index).val();
			if(check == 1){
				$('.qty_product').eq(index).val(parseInt(value)+1);
			}else $('.qty_product').eq(index).val(parseInt(value)-1);
			updateCart(index,productId);
		}
	</script>
</body>

</html>