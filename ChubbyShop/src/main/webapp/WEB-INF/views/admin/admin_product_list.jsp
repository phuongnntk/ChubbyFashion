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
                                                <h5>Products Table</h5>
                                                <span>create, update and delete function</span>
                                                <div class="card-header-right">
                                                    <div class="d-inline-flex">

                                                        <select type="text" name="categoryId" id="categoryId"
                                                           class="form-control fill mr-3" style="min-width: 180px;"
                                                            onchange="select(this,0)">
                                                           <option value="">Select Category</option>
                                                           	<c:forEach items="${categories}" var="category">
								                            	<option value="${category.id}">${category.name}</option>
															</c:forEach>
                                                        </select>
	                                                        <select name="sort" id="sort" class="form-control fill"
	                                                            style="min-width: 180px;" onchange="select(this,0)">
	                                                            <option value="">Select Sort</option>
	                                                            <option value="name">Name</option>
	                                                            <option value="price">Price</option>
	                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-body bg-transparent table-border-style">
                                                <div class="table-responsive">
                                                    <table class="table" id="table-edit">
                                                        <thead>
                                                            <tr>
                                                                <th width="5%">STT</th>
                                                                <th width="25%">Product Name</th>
                                                                <th width="15%">Type</th>
                                                                <th width="15%">Slug</th>
                                                                <th width="10%">Quantity</th>
                                                                <th width="15">Price</th>
                                                                <th width="15%">Edit</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        	<c:forEach items="${products.content}" var="product" varStatus="loop">
	                                                            <tr>
	                                                                <th class="" scope="row">${loop.index + 1}</th>
	                                                                <td>
	                                                                    <img src="/images/${product.category.id}/${product.thumbnail}" alt="" class="rounded-circle" style="width: 40px; height: 40px;">
	                                                                    ${product.name}
	                                                                </td>
	                                                                <td>${product.category.name}</td>
	                                                                <td class="text-info">${product.slug}</td>
	                                                                <td>${product.quantity}</td>
	                                                                <td class="text-success"><fmt:formatNumber type = "number" value = "${product.price}" /> VND</td>
	                                                                <td>
	                                                                    <a class="btn bg-transparent text-primary text-center p-1 mr-2" href="/admin/edit-product?productId=${product.id}">
	                                                                        <i class="fa fa-pencil-square m-0" style="font-size: 24px;" aria-hidden="true"></i>
	                                                                    </a>
	                                                                    <button class="btn bg-transparent text-danger text-center p-1" onclick="deleteProduct('${product.id}',this)">
	                                                                        <i class="fa fa-trash m-0" style="font-size: 24px;" aria-hidden="true"></i>
	                                                                    </button>
	                                                                </td>
	                                                            </tr>
                                                        	</c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="card-footer" style="border-top: 2px solid #d7dce0;">
                                                <nav aria-label="Page navigation example" class=" d-flex justify-content-between">
                                                    <a class="btn btn-success font-weight-bold" href="/admin/add-product">
                                                        <i class="fa fa-plus"></i>
                                                        Create Product</a>
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