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

<body>
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
                                        <div class="card">
                                            <div class="card-header">
                                                <h5>Form Add User</h5>
                                                <!--<span>Add class of <code>.form-control</code> with <code>&lt;input&gt;</code> tag</span>-->
                                            </div>
                                            <div class="card-block">
                                                <form class="form-material">
                                                    <div class="row">
                                                        <div class="col-md-4 text-center">
                                                            <label for="avatar" class="border border-primary rounded-circle mt-4"
                                                                style="border-width: 4px !important; width: 200px; height: 200px;">
                                                                <img src="/assets/images/no_image.jpg" id="imagePreview" class="over rounded-circle" />
                                                            </label>
                                                            <input type="file" id="avatar" accept=".png, .jpg, .jpeg"
                                                                style="display: none" onchange="readURL(this,event)">
                                                            <p class="mt-4 font-weight-bold" style="font-size: 20px;">Choose Avatar</p>
                                                        </div>
                                                        <div class="col-md-8">
                                                            <div class="row">
                                                                <div class="col-sm-6">
                                                                    <div class="form-group form-primary">
                                                                        <input type="text" name="username"
                                                                            class="form-control">
                                                                        <span class="form-bar"></span>
                                                                        <label class="float-label">Username</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group form-primary">
                                                                        <select type="text" name="isAdmin"
                                                                            class="form-control">
                                                                            <option value=""></option>
                                                                            <option value="false">Customer</option>
                                                                            <option value="true">Admin</option>
                                                                        </select>
                                                                        <span class="form-bar"></span>
                                                                        <label class="float-label">Role</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-6">
                                                                    <div class="form-group form-primary">
                                                                        <input type="password" name="password"
                                                                            class="form-control">
                                                                        <span class="form-bar"></span>
                                                                        <label class="float-label">Password</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group form-primary">
                                                                        <input type="password" name="confirm"
                                                                            class="form-control">
                                                                        <span class="form-bar"></span>
                                                                        <label class="float-label">Confirm Password</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-6">
                                                                    <div class="form-group form-primary">
                                                                        <select type="text" name="gender"
                                                                            class="form-control">
                                                                            <option value=""></option>
                                                                            <option value="true">Male</option>
                                                                            <option value="false">Female</option>
                                                                        </select>
                                                                        <span class="form-bar"></span>
                                                                        <label class="float-label">Gender</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group form-primary">
                                                                        <input type="text" name="phone"
                                                                            class="form-control">
                                                                        <span class="form-bar"></span>
                                                                        <label class="float-label">Phone</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group form-primary">
                                                                <input type="text" name="fullname"
                                                                    class="form-control">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Fullname</label>
                                                            </div>
                                                            <div class="form-group form-primary">
                                                                <input type="email" name="email"
                                                                    class="form-control">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Email</label>
                                                            </div>
                                                            <div class="form-group form-primary">
                                                                <input type="text" name="address"
                                                                    class="form-control">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Address</label>
                                                            </div>
                                                            
                                                        </div>
                                                    </div>
                                                    <div class="mt-3">
                                                        <button class="btn btn-primary w-100 font-weight-bold">Add User</button>
                                                    </div>
                                                </form>
                                            </div>
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

	    function readURL(input, event) {
	        if (input.files && input.files[0]) {
	            var output = document.getElementById('imagePreview');
	            output.src = URL.createObjectURL(event.target.files[0]);
	            output.onload = function () {
	                URL.revokeObjectURL(output.src) // free memory
	            }
	        }
	    }

        function clickHex(ele){
            ele.type = "color";
            ele.value = "#ffffff";
            ele.click();
        }
    </script>
</body>

</html>