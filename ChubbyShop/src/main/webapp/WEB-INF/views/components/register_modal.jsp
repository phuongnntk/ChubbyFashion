<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade align-items-center justify-content-center" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="max-width: 1000px !important;">
        <div class="modal-content p-3">
        	<div class="modal-header border-0 d-flex justify-content-between">
        		<h2 class="fw-bold "><Strong> Trang đăng ký </Strong></h2>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                	<span aria-hidden="true" >&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="register-form">
                    <form action="/register" method="post" id="registerForm" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-md-4 border-right">
                                <div class="d-flex flex-column align-items-center text-center px-3 ">
                                    <div class="mt-3">
                                        <label class="h3"> <strong>Hình ảnh</strong>
										</label>
                                    </div>
                                    <div class="avatar-upload m-0 w-100" style="max-width: 100%;">
                                        <label for="imageUpload" class="rounded-0 w-100 d-flex justify-content-center">
											<div class="avatar-preview rounded-0"
												style="width: 250px; height: 300px">
												<div id="imagePreview" class="w-100 rounded-0"
													style="background-image: url('img/no_image.jpg');"></div>
											</div>
										</label>
                                        <input type="file" class="custom-file-input" id="imageUpload" name="avatar" accept=".jpg,.png,.jpeg" onchange="readURL(this)">

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8 border-right">
                                <div class="p-3 ">
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-lg-6 mb-3">
                                            <label class="form-label font-weight-bold">Tên tài khoản</label>
                                            <input name="username" type="text" class="form-control" placeholder="Hãy nhập tên tài khoản" />
                                        </div>
                                        <div class="col-12 col-sm-6 col-lg-6 mb-3">
                                            <label class="form-label font-weight-bold">Họ và tên</label>
                                            <input name="fullname" type="text" class="form-control" placeholder="Hãy nhập họ và tên" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-lg-6 mb-3">
                                            <label class="form-label font-weight-bold">Mật khẩu</label>
                                            <input name="password" type="password" class="form-control" placeholder="Hãy nhập mật khẩu" />
                                        </div>
                                        <div class="col-12 col-sm-6 col-lg-6 mb-3">
                                            <label class="form-label font-weight-bold">Xác nhận mật khẩu</label>
                                            <input name="confirm" type="password" class="form-control" placeholder="Hãy nhập xác nhận mật khẩu" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-lg-6 mb-3">
                                            <label class="form-label font-weight-bold">Giới tính</label>
                                            <select class="form-control" name="gender" id="gender">
												<option value="true">Nam</option>
												<option value="false">Nữ</option>
											</select>
                                        </div>
                                        <div class="col-12 col-sm-6 col-lg-6 mb-3">
                                            <label class="form-label font-weight-bold">Điện thoại</label>
                                            <input name="phone" type="text" class="form-control" placeholder="Hãy nhập số điện thoại" />
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label font-weight-bold">Email</label>
                                        <input name="email" type="email" class="form-control" placeholder="Hãy nhập Email" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label font-weight-bold">Địa chỉ</label>
                                        <input name="address" type="text" class="form-control" placeholder="Hãy nhập địa chỉ" />
                                    </div>
                                    <div class="mt-5">
                                        <button class="btn btn-primary w-100 py-2 font-weight-bold profile-button" style="font-size: 20px">Đăng ký</button>
                                        <div class="mt-2 text-center">
                                            <span>Bạn đã sẵn sàng đăng nhập?</span> 
                                            <a class="img-responsive btn text-danger" data-dismiss="modal" aria-label="Close" data-toggle="modal"
							data-target="#loginModal"> Đăng nhập tại đây</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#imagePreview').css('background-image',
                    'url(' + e.target.result + ')');
                $('#imagePreview').hide();
                $('#imagePreview').fadeIn(650);
            }
            reader.readAsDataURL(input.files[0]);
        } else {
            $('#imagePreview').css('background-image',
                'url(img/no_image.jpg)');
        }
    }
</script>