<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
   	<div class="container">
        <div class="row pt-5">
            <div class="col-6">
                <form action="/add" method="post">
                    <div class="form-group">
                        <label for="productName">Tên sản phẩm</label>
                        <input type="text" class="form-control" name="productName" id="productName">
                    </div>
                    <div class="form-group">
                        <label for="slug">Slug</label>
                        <input type="text" class="form-control" name="slug" id="slug">
                    </div>
                    <div class="form-group">
                        <label for="category">Loại</label>
                        <select class="form-control" name="category" id="category">
                        	<c:forEach items="${categories}" var="category">
                            	<option value="${category.id}">${category.name}</option>
							</c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="description">Mô tả</label>
                        <textarea class="form-control" name="description" id="description" rows="3"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="price">Giá</label>
                        <input type="text" class="form-control" name="price" id="price">
                    </div>
                    <div class="form-group">
                        <label for="quantity">Số lượng</label>
                        <input type="text" class="form-control" name="quantity" id="quantity">
                    </div>
                    <div class="form-group">
                        <label for="thumbnail">Ảnh nền</label>
                        <input type="text" class="form-control" name="thumbnail" id="thumbnail">
                    </div>
                    <hr>
                    <h3>Màu 1</h3>
                    <div class="form-group">
                        <label for="color1">Màu 1</label>
                        <input type="text" class="form-control" name="color1" id="color1">
                    </div>
                    <div class="form-group">
                        <label for="hex1">Mã màu 1</label>
                        <input type="text" class="form-control" name="hex1" id="hex1">
                    </div>
                    <div class="form-group">
                        <label for="image1_1">Tên Ảnh 1</label>
                        <input type="text" class="form-control" name="image1_1" id="image1_1">
                    </div>
                    <div class="form-group">
                        <label for="image1_2">Tên Ảnh 1</label>
                        <input type="text" class="form-control" name="image1_2" id="image1_2">
                    </div>
                    <div class="form-group">
                        <label for="image1_3">Tên Ảnh 1</label>
                        <input type="text" class="form-control" name="image1_3" id="image1_3">
                    </div>
                    <div class="form-group">
                        <label for="image1_4">Tên Ảnh 1</label>
                        <input type="text" class="form-control" name="image1_4" id="image1_4">
                    </div>
                    <hr>
                    <h3>Màu 2</h3>
                    <div class="form-group">
                        <label for="color2">Màu 2</label>
                        <input type="text" class="form-control" name="color2" id="color2">
                    </div>
                    <div class="form-group">
                        <label for="hex2">Mã màu 2</label>
                        <input type="text" class="form-control" name="hex2" id="hex2">
                    </div>
                    <div class="form-group">
                        <label for="image2_1">Tên Ảnh 2</label>
                        <input type="text" class="form-control" name="image2_1" id="image2_1">
                    </div>
                    <div class="form-group">
                        <label for="image2_2">Tên Ảnh 2</label>
                        <input type="text" class="form-control" name="image2_2" id="image2_2">
                    </div>
                    <div class="form-group">
                        <label for="image2_3">Tên Ảnh 2</label>
                        <input type="text" class="form-control" name="image2_3" id="image2_3">
                    </div>
                    <div class="form-group">
                        <label for="image2_4">Tên Ảnh 2</label>
                        <input type="text" class="form-control" name="image2_4" id="image2_4">
                    </div>
                    <hr>
                    <h3>Màu 3</h3>
                    <div class="form-group">
                        <label for="color3">Màu 3</label>
                        <input type="text" class="form-control" name="color3" id="color3">
                    </div>
                    <div class="form-group">
                        <label for="hex3">Mã màu 3</label>
                        <input type="text" class="form-control" name="hex3" id="hex3">
                    </div>
                    <div class="form-group">
                        <label for="image3_1">Tên Ảnh 3</label>
                        <input type="text" class="form-control" name="image3_1" id="image3_1">
                    </div>
                    <div class="form-group">
                        <label for="image3_2">Tên Ảnh 3</label>
                        <input type="text" class="form-control" name="image3_2" id="image3_2">
                    </div>
                    <div class="form-group">
                        <label for="image3_3">Tên Ảnh 3</label>
                        <input type="text" class="form-control" name="image3_3" id="image3_3">
                    </div>
                    <div class="form-group">
                        <label for="image3_4">Tên Ảnh 3</label>
                        <input type="text" class="form-control" name="image3_4" id="image3_4">
                    </div>
                    <hr>
                    <div class="mt-4">
                    	<button class="btn btn-success px-4 py-3">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>

</html>