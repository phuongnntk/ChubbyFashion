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
                                                <h5>Form Add Product</h5>
                                                <!--<span>Add class of <code>.form-control</code> with <code>&lt;input&gt;</code> tag</span>-->
                                            </div>
                                            <div class="card-block">
                                                <form action="/admin/add-product" method="post" class="form-material" id="productForm" enctype="multipart/form-data">
                                                    <div class="row">
                                                        <div class="col-md-4 text-center">
                                                            <label for="thumbnail" class="border border-primary mt-2"
                                                                style="border-width: 4px !important; width: 200px; height: 250px;">
                                                                <img src="/assets/images/no_image.jpg" id="imagePreview" class="over " />
                                                            </label>
                                                            <input type="file" class="custom-file-input"
                                                                style="height: 0;" id="thumbnail" name="thumbnail"
                                                                accept=".jpg,.png,.jpeg"
                                                                onchange="readURL(this,event,'')">
                                                            <p class="mt-4 font-weight-bold" style="font-size: 20px;">
                                                                Choose Thumbnail</p>
                                                        </div>
                                                        <div class="col-md-8">
                                                            <div class="form-group form-primary">
                                                                <input type="text" name="name"
                                                                    class="form-control">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Product Name</label>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-6">
                                                                    <div class="form-group form-primary">
                                                                        <select type="text" name="categoryId" id="category"
                                                                            class="form-control">
                                                                            <option value=""></option>
                                                                            <c:forEach items="${categories}" var="category">
												                            	<option value="${category.id}">${category.name}</option>
																			</c:forEach>
                                                                        </select>
                                                                        <span class="form-bar"></span>
                                                                        <label class="float-label">Category</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group form-primary">
                                                                        <input type="text" name="slug"
                                                                            class="form-control">
                                                                        <span class="form-bar"></span>
                                                                        <label class="float-label">Slug Product</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-6">
                                                                    <div class="form-group form-primary">
                                                                        <input type="number" name="quantity"
                                                                            class="form-control">
                                                                        <span class="form-bar"></span>
                                                                        <label class="float-label">Quantity</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group form-primary">
                                                                        <input type="number" name="price"
                                                                            class="form-control">
                                                                        <span class="form-bar"></span>
                                                                        <label class="float-label">Price</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group form-primary">
                                                                <textarea name="description" class="form-control w-100"
                                                                    style="height: 100px;" rows="5"></textarea>
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Description</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row text-center" id="color-block">
                                                        <div class="col-12" style="border-top: 2px solid #d7dce0;">
                                                            <div class="row">
                                                                <div class="col-12 row px-5 mt-3 mb-4 text-left">
                                                                    <div class="col-sm-3 px-0">
                                                                        <h3 class="my-0 mt-2">Color 1: </h3>
                                                                    </div>
                                                                    <div class="col-sm-3 px-0 mr-4">
                                                                        <input type="text" name="color1"
                                                                            class="form-control color" placeholder="Enter color name">
                                                                    </div>

                                                                    <div class="col-sm-3 px-0">
                                                                        <input type="text" name="hex1"
                                                                            class="form-control hex" onfocus="clickHex(this)" placeholder="Enter color code (HEX)">
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6 col-md-4 col-xl-3 ">
                                                                    <label for="image1_1"
                                                                        class="border border-primary mt-2"
                                                                        style="border-width: 4px !important; width: 200px; height: 250px;">
                                                                        <img src="/assets/images/no_image.jpg" id="imagePreview1_1" class="over " />
                                                                    </label>
                                                                    <input type="file" class="custom-file-input image"
                                                                        style="height: 0;" id="image1_1" name="image1_1"
                                                                        accept=".jpg,.png,.jpeg"
                                                                        onchange="readURL(this,event,'1_1')">
                                                                </div>
                                                                <div class="col-sm-6 col-md-4 col-xl-3">
                                                                    <label for="image1_2"
                                                                        class="border border-primary mt-2"
                                                                        style="border-width: 4px !important; width: 200px; height: 250px;">
                                                                        <img src="/assets/images/no_image.jpg" id="imagePreview1_2" class="over " />
                                                                    </label>
                                                                    <input type="file" class="custom-file-input image"
                                                                        style="height: 0;" id="image1_2" name="image1_2"
                                                                        accept=".jpg,.png,.jpeg"
                                                                        onchange="readURL(this,event,'1_2')">
                                                                </div>
                                                                <div class="col-sm-6 col-md-4 col-xl-3">
                                                                    <label for="image1_3"
                                                                        class="border border-primary mt-2"
                                                                        style="border-width: 4px !important; width: 200px; height: 250px;">
                                                                        <img src="/assets/images/no_image.jpg" id="imagePreview1_3" class="over " />
                                                                    </label>
                                                                    <input type="file" class="custom-file-input image"
                                                                        style="height: 0;" id="image1_3" name="image1_3"
                                                                        accept=".jpg,.png,.jpeg"
                                                                        onchange="readURL(this,event,'1_3')">
                                                                </div>
                                                                <div class="col-sm-6 col-md-4 col-xl-3">
                                                                    <label for="image1_4"
                                                                        class="border border-primary mt-2"
                                                                        style="border-width: 4px !important; width: 200px; height: 250px;">
                                                                        <img src="/assets/images/no_image.jpg" id="imagePreview1_4" class="over " />
                                                                    </label>
                                                                    <input type="file" class="custom-file-input image"
                                                                        style="height: 0;" id="image1_4" name="image1_4"
                                                                        accept=".jpg,.png,.jpeg"
                                                                        onchange="readURL(this,event,'1_4')">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="mt-3 row">
                                                        <div class="col-sm-4">
                                                            <button type="button" onclick="addcolor()" class="btn btn-success w-100 font-weight-bold">
                                                                <i class="fa fa-plus"></i>
                                                                Add Color
                                                            </button>
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <button
                                                                class="btn btn-primary w-100 font-weight-bold">Submit
                                                                Form</button>
                                                        </div>
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
        function readURL(input, event, number) {
            if (input.files && input.files[0]) {
                var output = document.getElementById('imagePreview' + number);
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