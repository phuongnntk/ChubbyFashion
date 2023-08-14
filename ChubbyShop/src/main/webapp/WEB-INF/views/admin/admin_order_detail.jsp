<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/common.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>PhiThang - Assignment Java 5</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <meta name="keywords"
        content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
    <meta name="author" content="Codedthemes" />
	<%@ include file="../../common/css_admin.jsp"%>
</head>

<body id="body-content">
    <!-- Pre-loader start -->
	<%@ include file="./components/loader.jsp"%>
    <!-- Pre-loader end -->
    <div id="pcoded" class="pcoded">
        <div class="pcoded-overlay-box"></div>
        <div class="pcoded-container navbar-wrapper">
		    <!-- Header begin -->
			<%@ include file="./components/header.jsp"%>
		    <!-- Header end -->
            <div class="pcoded-main-container">
                <div class="pcoded-wrapper">
				    <!-- Sidebar begin -->
					<%@ include file="./components/sidebar.jsp"%>
				    <!-- Sidebar end -->
                    <div class="pcoded-content">
                        <div class="pcoded-inner-content">
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">
                                    <!-- Page-body start -->
                                    <div class="page-body" id="main_content">
                                        <!-- Basic table card start -->
                                        <div class="card">
                                            <div class="card-header ">
                                                <h5>Order Detail Of ${order.account.fullname} 
	                                                <c:choose>
														<c:when test="${order.status == 1}">
															<label class="badge badge-warning p-2 ml-3" style="font-size: 12px;">Waiting confirm</label>
														</c:when>
														<c:when test="${order.status == 2}">
															<label class="badge badge-info p-2 ml-3" style="font-size: 12px;">Delivering</label>
														</c:when>
														<c:when test="${order.status == 3}">
															<label class="badge badge-success p-2 ml-3" style="font-size: 12px;">Success</label>
														</c:when>
														<c:otherwise>
															<label class="badge badge-danger p-2 ml-3" style="font-size: 12px;">Cancel</label>
														</c:otherwise>
													</c:choose>	
												</h5>
                                                <span>${order.createDate}</span>
                                                <div class="card-header-right d-inline-flex">
                                                    <span class="font-weight-bold ml-5 mr-2" style="font-size: 16px">Address: </span> 
                                                    <span style="font-size: 16px">${order.address}</span>
                                                    <span class="font-weight-bold ml-5 mr-2" style="font-size: 16px">Phone: </span>
                                                    <span class="mr-2" style="font-size: 16px">${order.phone}</span>
                                                </div>
                                            </div>
                                            <div class="card-body bg-transparent table-border-style">
                                                <div class="table-responsive">
                                                    <table class="table" id="table-edit">
                                                        <thead>
                                                            <tr>
                                                                <tr>
                                                                <th width="5%">STT</th>
                                                                <th width="30%">Product Name</th>
                                                                <th width="15%">Type</th>
                                                                <th width="15%">Slug</th>
                                                                <th width="15%">Quantity</th>
                                                                <th width="20">Price</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
	                                                        <c:forEach items="${order.orderDetails}" var="detail" varStatus="loop">
	                                                            <tr>
	                                                                <th scope="row">${loop.index + 1}</th>
	                                                                <td>
	                                                                    <img src="/images/${detail.product.category.id}/${detail.product.thumbnail}" alt="" class="rounded-circle" style="width: 40px; height: 40px;">
	                                                                    ${detail.product.name}
	                                                                </td>
	                                                                <td>${detail.product.category.name}</td>
	                                                                <td class="text-info">${detail.product.slug}</td>
	                                                                <td>${detail.quantity}</td>
	                                                                <td class="text-success"><fmt:formatNumber type = "number" value = "${detail.totalPrice}" /> VND</td>
	                                                            </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="card-footer" style="border-top: 2px solid #d7dce0;">
                                                <nav aria-label="Page navigation example"
                                                    class=" d-flex justify-content-between">
                                                    <div>
                                                    	<button class="btn btn-secondary font-weight-bold" onclick="history.back()">
	                                                        <i class="fa fa-arrow-left"></i>
	                                                        Back to order list
                                                        </button>
                                                    </div>
                                                    <div class="d-inline-flex align-items-center">
	                                                    <span class="font-weight-bold ml-5 mr-2" style="font-size: 16px">Total Price: </span>
	                                                    <span class=" mr-2" style="font-size: 16px"><fmt:formatNumber type = "number" value = "${order.totalPrice}" /> VND</span>
                                                    </div>
                                                </nav>
                                            </div>
                                        </div>
                                        <!-- Basic table card end -->
                                    </div>

                                    <!-- Page-body end -->
                                </div>
                                <div id="styleSelector"> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<%@ include file="../../common/js_admin.jsp"%>
    <script>
	    function deleteProduct(productId, ele) {
	    	if(window.confirm("Do you want delete this product?")){
				$.ajax({
					url: '/admin/delete-product',
					method: 'DELETE',
					data: {productId: productId},
					statusCode:{
						200: function(){
						    alertResult('alert-success', 'Success!', 'Delete product successed!');
						    $(ele).parent().parent().remove();
						}
					}
				})
	    	}
		}
	
	    function confirmOrder(orderId, ele) {
	    	if(window.confirm("Do you want confirm this order?")){
				$.ajax({
					url: '/admin/confirm-order',
					method: 'POST',
					data: {orderId: orderId},
					statusCode:{
						200: function(){
						    alertResult('alert-success', 'Success!', 'Confirm order '+ orderId +' successed!');
						    $.ajax({
				   				url: '/admin/checkout',
				   				method: 'GET',
				   				data: {	
				   					page: ${orders.number}	
				   				},
				   				success: function(data){
				   					$('#table-edit').html($(data).find('#table-edit').html());
									$('#pageNumber').html($(data).find('#pageNumber').html());
				   				},
				   				error: function error() {
				   					
				   				}
				   			})
						},
						500: function(){
						    alertResult('alert-danger', 'Error!', 'Confirm order '+ orderId +' failed!');
						}
					}
				})
	    	}
		}
	
	    function deleteOrder(orderId, ele) {
	    	if(window.confirm("Do you want delete this order?")){
				$.ajax({
					url: '/admin/confirm-order',
					method: 'POST',
					data: {orderId: orderId},
					statusCode:{
						200: function(){
						    alertResult('alert-success', 'Success!', 'Delete order '+ orderId +' successed!');
						    $.ajax({
				   				url: '/admin/checkout',
				   				method: 'GET',
				   				data: {	
				   					page: ${orders.number}	
				   				},
				   				success: function(data){
				   					$('#table-edit').html($(data).find('#table-edit').html());
									$('#pageNumber').html($(data).find('#pageNumber').html());
				   				},
				   				error: function error() {
				   					
				   				}
				   			})
						},
						500: function(){
						    alertResult('alert-danger', 'Error!', 'Delete order '+ orderId +' failed!');
						}
					}
				})
	    	}
		}
	    

        
        function select(ele, page) {
           	$.ajax({
   				url: '/admin/order',
   				method: 'GET',
   				data: {	
   					page: page	
   				},
   				success: function(data){
   					$('#table-edit').html($(data).find('#table-edit').html());
					$('#pageNumber').html($(data).find('#pageNumber').html());
   				},
   				error: function error() {
   					
   				}
   			})
		}
    </script>
</body>

</html>