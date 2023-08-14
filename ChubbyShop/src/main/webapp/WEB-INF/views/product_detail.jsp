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
                        <a href="/products">Sản phẩm</a>
                        <a>${product.category.name}</a>
                        <span>${product.name}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Product Shop Section Begin -->
    <section class="product-shop spad page-details pt-3">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 px-5">
                    <div class="product-pic text-center mb-3">
                        <img class="product-big-img w-100" id="product_thumbnail"
                            src="/images/${product.category.id}/${color.images[0].image}" alt="">
                    </div>
                    <div class="product-thumbs">
                        <div class="product-thumbs-track ps-slider owl-carousel owl-loaded owl-drag">
                            <div class="owl-stage-outer">
                                <div class="owl-stage"
                                    style="transform: translate3d(-233px, 0px, 0px); transition: all 0s ease 0s; width: 934px;">
                                    <c:forEach var="image"  items="${color.images}" varStatus="loop">
                                        <div class="owl-item" style="width: 223.333px; margin-right: 10px;">
                                            <div class="pt"
                                                data-imgbigurl="/images/${product.category.id}/${image.image}">
                                                <img src="/images/${product.category.id}/${image.image}" id="product_image${loop.index}"
                                                    alt="">
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="owl-nav">
                                <button type="button" role="presentation" class="owl-prev">
                                    <i class="fa fa-angle-left"></i>
                                </button>
                                <button type="button" role="presentation" class="owl-next disabled">
                                    <i class="fa fa-angle-right"></i>
                                </button></div>
                            <div class="owl-dots disabled">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 pt-4">
                    <div class="product-details">
                        <div class="pd-title mb-3">
                            <h2 class= "font-weight-bold">${product.name}</h2>
                            <a href="#" class="heart-icon"><i class="icon_heart_alt"></i></a>
                        </div>
                        <div class="pd-share mb-3">
                            <div class="p-code">Mã sản phẩm : ${product.slug}</div>
                            <div class="pd-social">
                                <a href="#"><i class="ti-facebook"></i></a>
                                <a href="#"><i class="ti-twitter-alt"></i></a>
                                <a href="#"><i class="ti-linkedin"></i></a>
                            </div>
                        </div>
                        <div class="pd-rating" >
                            <p class="fa fa-star text-warning"></p>
                            <p class="fa fa-star text-warning"></p>
                            <p class="fa fa-star text-warning"></p>
                            <p class="fa fa-star text-warning"></p>
                            <p class="fa fa-star-o text-warning"></p>
                        </div>
                        <div class="pd-desc">
                            <h1 class="font-weight-bold text-danger" style="font-size: 36px">
                                <fmt:formatNumber type="number" value="${product.price}" /> VND
                            </h1>
                        </div>
                        <div class="pd-desc">
                            <h4 class="mb-4 font-weight-bold text-dark">Mô tả</h4>
                            <p>${product.description}</p>
                        </div>
                        <div class="pd-color row align-items-center">
                            <h4 class="font-weight-bold col-md-2">Màu sắc</h4>
                            <div class="pd-color-choose col-md-10">
                                <c:forEach var="color" items="${product.colors}" varStatus="loop">
                                    <div class="cc-item">
                                        <input type="radio" name="color" id="cc-black${loop.index}" onchange="changeColor('${color.id}')">
                                        <label for="cc-black${loop.index}" style="background: ${color.colorHex};"></label>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        
                        <div class="quantity">
                            <div class="pro-qty">
                            	<span class="dec qtybtn" onclick="qty(0)">-</span>
                                <input type="text" name="quantity" id="quantity" value="1">
                                <span class="inc qtybtn" onclick="qty(1)">+</span>
                            </div>
                            <a href="#" onclick="addToCart('${product.id}')" class="primary-btn pd-cart">Mua sản phẩm</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Shop Section End -->

    <!-- Related Products Section End -->
    <div class="related-products spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Sản phẩm liên quan</h2>
                    </div>
                </div>
            </div>
            <div class="row">
            	<c:forEach var="prod" items="${products}" begin="0" end="3">
	                <div class="col-lg-3 col-sm-6">
	                    <div class="product-item">
	                        <div class="pi-pic">
	                            <img src="/images/${prod.category.id}/${prod.thumbnail}" alt="">
	                            <div class="sale">Sale</div>
	                            <div class="icon">
	                                <i class="icon_heart_alt"></i>
	                            </div>
	                            <ul>
                                    <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                    <li class="quick-view"><a href="/products/detail/${prod.slug}">Product Detail</a></li>
                                    <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
	                            </ul>
	                        </div>
	                        <div class="pi-text">
                                <div class="catagory-name">${prod.category.name}</div>
                                <a href="#">
                                    <h5>${prod.name}</h5>
	                            </a>
	                            <div class="product-price">
	                                <fmt:formatNumber type="number" value="${prod.price}" /> VND
	                            </div>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <!-- Related Products Section End -->

    <!-- Footer Section Begin -->
    <%@include file="./components/footer.jsp" %>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <%@include file="../common/js.jsp" %>
    <script>
    
    	/* function call ajax change color */
        function changeColor(id) {
            var url = '/api/product-color/'+id;
			$.ajax({
				type: 'POST',
				url: url,
			    contentType: 'application/json; charset=UTF-8',
			    dataType: 'json',
				success: function(data){
					$('#product_thumbnail').attr('src','/images/${product.category.id}/'+data[0].image);
					$('#product_image0').attr('src','/images/${product.category.id}/'+data[0].image);
					$('#product_image0').parent().attr('data-imgbigurl','/images/${product.category.id}/'+data[0].image);
					$('#product_image1').attr('src','/images/${product.category.id}/'+data[1].image);
					$('#product_image1').parent().attr('data-imgbigurl','/images/${product.category.id}/'+data[1].image);
					$('#product_image2').attr('src','/images/${product.category.id}/'+data[2].image);
					$('#product_image2').parent().attr('data-imgbigurl','/images/${product.category.id}/'+data[2].image);
					$('#product_image3').attr('src','/images/${product.category.id}/'+data[3].image);
					$('#product_image3').parent().attr('data-imgbigurl','/images/${product.category.id}/'+data[3].image);
				}
			})
        }

    	/* function call ajax add product to cart and change price, quantity*/
        function addToCart(productId) {
    		var quantity = $('#quantity').val();
    		var apiUrl = '/api/cart/update?productId=' + productId + '&quantity=' + quantity + '&isReplace=false';
    		$.ajax({
    			url: apiUrl,
    			type: 'POST',
    			dataType: 'json',
    			success: function(data){
    				$('#totalQuantity').html(data.totalQuantity);
    				$('#totalPrice1').html(data.totalPrice.toLocaleString('en-US') + ' VND');
    				$('#totalPrice2').html(data.totalPrice.toLocaleString('en-US') + ' VND');
    				$.ajax({
    					url: '/products/detail/${product.slug}',
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
        
        $('.pt').click(function() {
			var image = $(this).attr('data-imgbigurl');
			$('#product_thumbnail').attr('src',image);
        });
        

		function qty(check) {
				var value = $('#quantity').val();
			if(check == 1){
				$('#quantity').val(parseInt(value)+1);
			}else $('#quantity').val(parseInt(value)-1);
		}
    </script>
</body>

</html>