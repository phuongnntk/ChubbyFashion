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
                                                <h5>Users Table</h5>
                                                <span>create, update and delete function</span>
                                                <div class="card-header-right">
                                                    <div class="d-inline-flex">
                                                        <select name="select" class="form-control fill mr-3"
                                                            style="min-width: 180px;">
                                                            <option value="">Select Role</option>
                                                            <option value="true">Admin</option>
                                                            <option value="false">Customer</option>
                                                        </select>

                                                        <select name="select" class="form-control fill mr-3"
                                                            style="min-width: 180px;">
                                                            <option value="">Select Status</option>
                                                            <option value="true">Active</option>
                                                            <option value="false">InActive</option>
                                                        </select>

                                                        <select name="select" class="form-control fill mr-3"
                                                            style="min-width: 180px;">
                                                            <option value="">Select Gender</option>
                                                            <option value="true">Male</option>
                                                            <option value="false">Female</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-body bg-transparent table-border-style">
                                                <div class="table-responsive">
                                                    <table class="table" id="table-edit">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Full Name</th>
                                                                <th>Username</th>
                                                                <th>Email</th>
                                                                <th>Gender</th>
                                                                <th>Phone</th>
                                                                <th>Address</th>
                                                                <th>Role</th>
                                                                <th>Edit</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        	<c:forEach items="${users}" var="user" varStatus="loop">
	                                                            <tr>
	                                                                <th scope="row">${loop.index + 1}</th>
	                                                                <td>
	                                                                    <img src="/avatar/${user.avatar}" alt="" class="rounded-circle" style="width: 40px; height: 40px;">
	                                                                    ${user.fullname}
	                                                                </td>
	                                                                <td>${user.username}</td>
	                                                                <td>${user.email}</td>
	                                                                <td>${user.gender ? 'Male' : 'Female'}</td>
	                                                                <td>${user.phone}</td>
	                                                                <td>${user.address}</td>
	                                                                <td>
																		<c:choose>
																			<c:when test="${user.isAdmin()}">
																				<label class="badge badge-warning p-2" style="font-size: 12px;">Admin</label>
																			</c:when>
																			<c:otherwise>
																				<label class="badge badge-info p-2" style="font-size: 12px;">Customer</label>
																			</c:otherwise>
																		</c:choose>				                                                                
	                                                                </td>
	                                                                <td>
	                                                                    <button class="btn bg-transparent text-primary text-center p-1 mr-2">
	                                                                        <i class="fa fa-pencil-square m-0" style="font-size: 24px;" aria-hidden="true"></i>
	                                                                    </button>
	                                                                    <button class="btn bg-transparent text-danger text-center p-1">
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
                                                    <button class="btn btn-success font-weight-bold">
                                                        <i class="fa fa-plus"></i>
                                                        Create User</button>
                                                    <ul class="pagination">
                                                        <li class="page-item disabled">
                                                            <a class="btn page-link">Previous</a>
                                                        </li>
                                                        <li class="page-item"><a class="btn page-link" href="#">1</a></li>
                                                        <li class="page-item"><a class="btn page-link" href="#">2</a></li>
                                                        <li class="page-item"><a class="btn page-link" href="#">3</a></li>
                                                        <li class="page-item">
                                                            <a class="btn page-link" href="#">Next</a>
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
    </script>
</body>

</html>