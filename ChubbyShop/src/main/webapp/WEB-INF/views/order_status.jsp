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
                        <span>Đơn hàng</span>
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
                    <div class="" id="orderStatus">
                        <h3 class="fw-bold">Đơn hàng</h3>
                        <hr class="my-4">
						<c:forEach var="order" items="${order.content}">
	                        <div class="d-flex justify-content-between mb-4 row_summary border-bottom">
	                            <h5 class="h6 qty_summary" style="width: 20%">${order.createDate}</h5>
	                            <h5 class="h6 price_summary" style="width: 20%">${order.phone}</h5>
	                            <h5 class="h6 price_summary" style="width: 30%">${order.address}</h5>
	                            <h5 class="h6 price_summary" style="width: 20%"><fmt:formatNumber type="number" value="${order.totalPrice}" /> VND</h5>
	                            <h5 class="h6 price_summary" style="width: 10%">
	                            	<c:choose>
										<c:when test="${order.status == 1}">
											<label class="badge badge-warning p-2" style="font-size: 12px;">Chờ xác nhận</label>
										</c:when>
										<c:when test="${order.status == 2}">
											<label class="badge badge-info p-2" style="font-size: 12px;">Đang giao</label>
										</c:when>
										<c:when test="${order.status == 3}">
											<label class="badge badge-success p-2" style="font-size: 12px;">Đã giao</label>
										</c:when>
										<c:otherwise>
											<label class="badge badge-danger p-2" style="font-size: 12px;">Đã hủy</label>
										</c:otherwise>
									</c:choose>	
	                            </h5>
	                        </div>
						</c:forEach>
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
                                <li class="page-item"><button class="btn page-link" onclick="select(this,${order.number > 0? order.number - 1 : 0})">Prev</button></li>
                                <li class="page-item"><button class="btn page-link">${order.number + 1}/${order.totalPages}</button></li>
                                <li class="page-item"><button class="btn page-link" onclick="select(this,${order.number < order.totalPages-1? order.number + 1 : order.totalPages - 1})">Next</button></li>
                                <li class="page-item">
                                    <button class="btn page-link" onclick="select(this,${order.totalPages - 1})">Last</button>
                                </li>
                            </ul>
                        </nav>
                        <hr class="my-4 ">
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

    function select(ele, page) {
       	$.ajax({
				url: '/order_status',
				method: 'GET',
				data: {	
					page: page	
				},
				success: function(data){
					$('#orderStatus').html($(data).find('#orderStatus').html());
					$('#pageNumber').html($(data).find('#pageNumber').html());
				},
				error: function error() {
					
				}
			})
	}
	</script>
</body>

</html>