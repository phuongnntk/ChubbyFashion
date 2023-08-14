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
                        <span>Sản phẩm</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Product Shop Section Begin -->
    <section class="product-shop spad">
        <div class="container">
            <div class="order-1 order-lg-2">
                <div class="product-show-option">
                    <div class="row">
                        <div class="col-lg-7 col-md-7">
                        	<div class="d-inline-flex w-100">
	                        	<div class="select-option w-100" id="category" style="">
	                            	<select class="sorting w-50">
											<option value="">Tất cả sản phẩm</option>
											<c:forEach items="${categories}" var="category">
												<option value="${category.id}" onclick="alert(123)">${category.name}</option>
											</c:forEach>
	                                </select>
	                            </div>
                        	</div>
                            
                        </div>
                        <div class="col-lg-5 col-md-5 d-flex justify-content-end">
                            <div class="select-option w-100  d-flex justify-content-end" id="sort">
                            	<select class="sorting w-50">
                                    <option value="true">Giá tăng dần</option>
                                    <option value="false">Giá giảm dần</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="product-list" id="product-content">
                    <div class="row">
                        <c:forEach var="prod" items="${products.content}">
                            <div class="col-lg-3 col-sm-6">
                                <div class="product-item">
                                    <div class="pi-pic">
                                        <img src="/images/${prod.category.id}/${prod.thumbnail}"
                                            alt="">
                                        <div class="sale pp-sale">Giảm giá</div>
                                        <div class="icon">
                                            <i class="icon_heart_alt"></i>
                                        </div>
                                        <ul>
                                            <li class="w-icon active"><a onclick="addToCart('${prod.id}')"><i class="icon_bag_alt"></i></a></li>
                                            <li class="quick-view"><a href="/products/detail/${prod.slug}">Chi tiết sản phẩm</a></li>
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
                                            <%-- <span>${prod.price}</span> --%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <nav aria-label="Page navigation example" class="w-100 d-flex justify-content-center">
	                        <ul class="pagination" id="pageNumber">
	                            <li class="page-item">
	                                <button class="btn page-link" onclick="select(this,0)">First</button>
	                            </li>
	                            <li class="page-item"><button class="btn page-link" onclick="select(this,${products.number > 0? products.number - 1 : 0})">Prev</button></li>
	                            <li class="page-item"><button class="btn page-link">${products.number + 1}/${products.totalPages}</button></li>
	                            <li class="page-item"><button class="btn page-link" onclick="select(this,${products.number < products.totalPages-1? products.number + 1 : products.totalPages - 1})">Next</button></li>
	                            <li class="page-item">
	                                <button class="btn page-link" onclick="select(this,${products.totalPages - 1})">Last</button>
	                            </li>
	                        </ul>
	                    </nav>
                    </div>
                </div>
                <div>
			   		<div class="text-center">
			   			
					</div>
				</div>
            </div>
        </div>
    </section>
    <!-- Product Shop Section End -->

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
    
	<script>
		function submitForm(p,gender) {
			document.querySelector('#p').value = p;
			document.querySelector('#gender').value = gender;
		}
		

        function select(ele, page) {
           	$.ajax({
   				url: '/products',
   				method: 'GET',
   				data: {	
					price: $('#sort .selected').attr('data-value'),
					categoryId: $('#category .selected').attr('data-value'),
					page: page
   				},
   				success: function(data){
					$('#product-content').html($(data).find('#product-content').html());
   				},
   				error: function error() {
   					
   				}
   			})
		}
		
		$('#sort .option').on("click", function(){
			$.ajax({
				url: "/products",
				method: 'GET',
				data: {
					price: $(this).attr('data-value'),
					categoryId: $('#category .selected').attr('data-value')
				},
				success: function(data) {
					$('#product-content').html($(data).find('#product-content').html());
				}
			})
		});
		$('#category .option').on("click", function(){
			$.ajax({
				url: "/products",
				method: 'GET',
				data: {
					price: $('#sort .selected').attr('data-value'),
					categoryId: $(this).attr('data-value'),
				},
				success: function(data) {
					$('#product-content').html($(data).find('#product-content').html());
				}
			})
		});
	</script>
</body>

</html>