<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade align-items-center justify-content-center" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content p-3">
            <div class="modal-header border-0 d-flex justify-content-between">
                <h2 class="fw-bold"><Strong> Trang đăng nhập </Strong></h2>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                	<span aria-hidden="true" >&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="login-form">
	                <form action="/login" method="post" id="loginForm">
	                    <div class="mb-3">
	                        <label class="form-label">
	                        <strong>Tên tài khoản </strong></label>
	                        <input name="username" type="text" class="form-control" placeholder="Hãy nhập tên tài khoản" />
	                    </div>
	                    <div class="mb-3">
	                        <label class="form-label">Mật khẩu</label>
	                        <input name="password" type="password" class="form-control" placeholder="Hãy nhập mật khẩu" />
	                    </div>
	                    <div class="row">
		                    <div class="col-sm-7 mt-2 form-group">
		                        <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
		                        <label for="remember-me" class="label-agree-term"><span><span></span></span>Ghi nhớ đăng nhập?</label>
		                    </div>
		                    <div class="col-sm-5  form-group">
		                        <a class="img-responsive btn text-danger" data-dismiss="modal" aria-label="Close" data-toggle="modal"
							data-target="#forgotModal"> Quên mật khẩu?</a>
		                    </div>
	                    </div>
	                    <div class="mt-2 text-center">
	                        <button class="btn primary-btn fw-bold w-100 py-2 rounded-pill" type="submit">Đăng nhập</button>
	                    </div>
	                </form>
	                <div class="mt-3 text-center">
	                    <span>Bạn chưa có tài khoản?</span>
	                    <a class="img-responsive btn text-danger" data-dismiss="modal" aria-label="Close" data-toggle="modal"
							data-target="#registerModal"> Đăng ký ngay</a>
	                </div>
	            </div>
            </div>
        </div>
    </div>
</div>