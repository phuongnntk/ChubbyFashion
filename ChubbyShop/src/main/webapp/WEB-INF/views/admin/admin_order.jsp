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
                                            <div class="card-header">
                                                <h5>Order Manament</h5>
                                                <span>checkout and delete function</span>
                                                <div class="card-header-right">
                                                    
                                                </div>
                                            </div>
                                            <div class="card-body bg-transparent table-border-style">
                                                <div class="table-responsive">
                                                    <table class="table" id="table-edit">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Fullname</th>
                                                                <th>Phone</th>
                                                                <th>Address</th>
                                                                <th>Create Date</th>
                                                                <th>Total Price</th>
                                                                <th>Status</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
	                                                        <c:forEach items="${orders.content}" var="order" varStatus="loop">
	                                                            <tr>
	                                                                <th scope="row">${orders.number*5 + loop.index + 1}</th>
	                                                                <td>
	                                                                	<img src="/avatar/${order.account.avatar}" alt="" class="rounded-circle" style="width: 40px; height: 40px;">
	                                                                	${order.account.fullname}</td>
	                                                                <td>${order.phone}</td>
	                                                                <td>${order.address}</td>
	                                                                <td>${order.createDate}</td>
	                                                                <td class="text-success"><fmt:formatNumber type = "number" value = "${order.totalPrice}" /> VND</td>
	                                                                <td>
																		<c:choose>
																			<c:when test="${order.status == 1}">
																				<label class="badge badge-warning p-2" style="font-size: 12px;">Waiting confirm</label>
																			</c:when>
																			<c:when test="${order.status == 2}">
																				<label class="badge badge-info p-2" style="font-size: 12px;">Delivering</label>
																			</c:when>
																			<c:otherwise>
																				<label class="badge badge-success p-2" style="font-size: 12px;">Success</label>
																			</c:otherwise>
																		</c:choose>	
	                                                                </td>
	                                                                <td>
	                                                                    <a href="/admin/order-detail/${order.id}"
	                                                                        class="btn bg-primary py-1 px-3 rounded-pill">
	                                                                        Detail
	                                                                        <i class="fa fa-arrow-right"></i>
	                                                                    </a>
	                                                                </td>
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
                                                        <!-- <button class="btn btn-success font-weight-bold mr-3">
                                                            <i class="fa fa-plus"></i>
                                                            Checkout All Order</button>
                                                        <button class="btn btn-danger font-weight-bold">
                                                            <i class="fa fa-plus"></i>
                                                            Delete All Order</button> -->
                                                    </div>
                                                    
                                                    <ul class="pagination" id="pageNumber">
                                                        <li class="page-item">
                                                            <button class="btn page-link" onclick="select(this,0)">First</button>
                                                        </li>
                                                        <li class="page-item"><button class="btn page-link" onclick="select(this,${orders.number > 0? orders.number - 1 : 0})">Prev</button></li>
                                                        <li class="page-item"><button class="btn page-link">${orders.number + 1}/${orders.totalPages}</button></li>
                                                        <li class="page-item"><button class="btn page-link" onclick="select(this,${orders.number < orders.totalPages-1? orders.number + 1 : orders.totalPages - 1})">Next</button></li>
                                                        <li class="page-item">
                                                            <button class="btn page-link" onclick="select(this,${orders.totalPages - 1})">Last</button>
                                                        </li>
                                                    </ul>
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