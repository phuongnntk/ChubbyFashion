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
                                        <div class="row">
                                            <!-- Material statustic card start -->
                                            <div class="col-12">
                                                <div class="card mat-stat-card">
                                                    <div class="card-block">
                                                        <div class="row align-items-center b-b-default">
                                                            <div class="col-sm-6 b-r-default p-b-20 p-t-20">
                                                                <div class="row align-items-center text-center">
                                                                    <div class="col-4 p-r-0">
                                                                        <i class="far fa-user text-c-purple f-24"></i>
                                                                    </div>
                                                                    <div class="col-8 p-l-0">
                                                                        <h5>${customer}</h5>
                                                                        <p class="text-muted m-b-0">Customers</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6 p-b-20 p-t-20">
                                                                <div class="row align-items-center text-center">
                                                                    <div class="col-4 p-r-0">
                                                                        <i class="fas fa-volume-down text-c-red f-24"></i>
                                                                    </div>
                                                                    <div class="col-8 p-l-0">
                                                                        <h5>${totalOrderCancel}</h5>
                                                                        <p class="text-muted m-b-0">Order Cancel</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row align-items-center">
                                                            <div class="col-sm-6 p-b-20 p-t-20 b-r-default">
                                                                <div class="row align-items-center text-center">
                                                                    <div class="col-4 p-r-0">
                                                                        <i class="far fa-file-alt text-c-yellow f-24"></i>
                                                                    </div>
                                                                    <div class="col-8 p-l-0">
                                                                        <h5>${totalOrderWaiting}</h5>
                                                                        <p class="text-muted m-b-0">Order Waiting Confirm</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6 p-b-20 p-t-20">
                                                                <div class="row align-items-center text-center">
                                                                    <div class="col-4 p-r-0">
                                                                        <i class="far fa-envelope-open text-c-green f-24"></i>
                                                                    </div>
                                                                    <div class="col-8 p-l-0">
                                                                        <h5>${totalOrderSuccess}</h5>
                                                                        <p class="text-muted m-b-0">OrderSuccess</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            

                                            <!--  sale analytics start -->
                                            <div class="col-xl-6 col-md-12">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>Best Seller</h5>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="card-block">
                                                        <div class="table-responsive">
                                                            <table class="table table-hover m-b-0 without-header">
                                                                <tbody>
                                                                	<%-- <c:forEach items="${bestSeller}" var="product" begin="0" end="4">
	                                                                    <tr>
	                                                                        <td>
	                                                                            <div class="d-inline-block align-middle">
	                                                                                <img src="/assets/images/avatar-4.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
	                                                                                <div class="d-inline-block">
	                                                                                    <h6>Shirley Hoe</h6>
	                                                                                    <p class="text-muted m-b-0">Sales executive , NY</p>
	                                                                                </div>
	                                                                            </div>
	                                                                        </td>
	                                                                        <td class="text-right">
	                                                                            <h6 class="f-w-700">$78.001<i class="fas fa-level-down-alt text-c-red m-l-10"></i></h6>
	                                                                        </td>
	                                                                    </tr>
                                                                    </c:forEach> --%>
                                                                </tbody>
                                                            </table>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--  sale analytics start -->
                                            <div class="col-xl-6 col-md-12">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>Loyal Customer</h5>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                                <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                <li><i class="fa fa-minus minimize-card"></i></li>
                                                                <li><i class="fa fa-refresh reload-card"></i></li>
                                                                <li><i class="fa fa-trash close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="card-block">
                                                        <div class="table-responsive">
                                                            <table class="table table-hover m-b-0 without-header">
                                                                <tbody>
                                                                    <!-- <tr>
                                                                        <td>
                                                                            <div class="d-inline-block align-middle">
                                                                                <img src="/assets/images/avatar-4.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                                                <div class="d-inline-block">
                                                                                    <h6>Shirley Hoe</h6>
                                                                                    <p class="text-muted m-b-0">Sales executive , NY</p>
                                                                                </div>
                                                                            </div>
                                                                        </td>
                                                                        <td class="text-right">
                                                                            <h6 class="f-w-700">$78.001<i class="fas fa-level-down-alt text-c-red m-l-10"></i></h6>
                                                                        </td>
                                                                    </tr>
                                                                     -->
                                                                </tbody>
                                                            </table>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!--  sale analytics end -->

                                        </div>
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
        
        function select(ele, page) {
           	$.ajax({
   				url: '/admin/products-list',
   				method: 'GET',
   				data: {	
   					categoryId: $('#categoryId').val(),
					sort: $('#sort').val(),
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