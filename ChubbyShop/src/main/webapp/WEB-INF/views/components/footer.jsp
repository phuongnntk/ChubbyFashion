<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer class="footer-section">
	<div class="container">
      	<div class="row">
               <div class="col-lg-3">
                   <div class="footer-left">
                       <div class="footer-logo">
                           <a href="#"><img src="/img/footer-logo.png" alt=""></a>
                       </div>
                       <ul>
                           <li>Đia chỉ: Phường Trung Mỹ Tây, Quận 12, Thành phố Hồ Chí Minh</li>
                           <li>Điện thoại: +84377166208</li>
                           <li>Email: phithang0403@gmail.com</li>
                       </ul>
                       <div class="footer-social">
                           <a href="#"><i class="fa fa-facebook"></i></a>
                           <a href="#"><i class="fa fa-instagram"></i></a>
                           <a href="#"><i class="fa fa-twitter"></i></a>
                           <a href="#"><i class="fa fa-pinterest"></i></a>
                       </div>
                   </div>
               </div>
               <div class="col-lg-2 offset-lg-1">
                   <div class="footer-widget">
                       <h5>Trang Chủ</h5>
                       <ul>
                           <li><a href="#">Giới thiệu</a></li>
                           <li><a href="#">Thanh toán</a></li>
                           <li><a href="#">Liên hệ</a></li>
                           <li><a href="#">Dịch vụ</a></li>
                       </ul>
                   </div>
               </div>
               <div class="col-lg-2">
                   <div class="footer-widget">
                       <h5>Thông tin</h5>
                       <ul>
                           <li><a href="#">Tài khoản</a></li>
                           <li><a href="#">Giỏ hàng</a></li>
                           <li><a href="#">Cửa hàng</a></li>
                           <li><a href="#">Khác hàng</a></li>
                       </ul>
                   </div>
               </div>
               <div class="col-lg-4">
                   <div class="newslatter-item">
                       <h5>Tham gia bản tin của chúng tôi ngay bây giờ</h5>
                       <p>Nhận thông tin cập nhật qua Mail về cửa hàng mới nhất của chúng tôi và các ưu đãi đặc biệt.</p>
                       <form action="#" class="subscribe-form">
                           <input type="text" placeholder="Hãy nhập email của bạn!">
                           <button type="button">Đăng ký</button>
                       </form>
                   </div>
               </div>
           </div>
       </div>
       <div class="copyright-reserved">
           <div class="container">
               <div class="row">
                   <div class="col-lg-12">
                       <div class="copyright-text">
                           FPT Polytechnic &copy; 2022 All rights reserved
                   	</div>
                   	<div class="payment-pic">
                       <img src="/img/payment-method.png" alt="">
                   	</div>
                </div>
            </div>
        </div>
    </div>
</footer>
<div class="alert alert-dismissible fade in show fixed-bottom" style="left: auto;right: 20px; width: 500px" role="alert">
	<strong id="message-strong">! </strong>
	<span id="message"></span>
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
</div>
<script type="text/javascript">
	$('.alert').hide();
	<c:if test="${success != null}">
		alertResult('alert-success', 'Success!', '${success}');
	</c:if>
	<c:if test="${param.success != null}">
		alertResult('alert-success', 'Success!', '${param.success}');
		history.pushState({}, "", "${sessionScope.historyURI}");
	</c:if> 
	<c:if test="${error != null}">
		alertResult('alert-danger', 'Error!', '${error}');
		
	</c:if> 
	<c:if test="${param.error != null}">
		alertResult('alert-danger', 'Error!', '${param.error}');
		history.pushState({}, "", "${sessionScope.historyURI}");
	</c:if> 
	
	function alertResult(cls,strong, mess){
		$('.alert').addClass(cls);
		$('.alert #message-strong').html(strong);
		$('.alert #message').html(mess);
		$('.alert').show();
		
		setTimeout(function() {
			$('button.close').click();
		},5000);
	}
	
</script>
<!-- modal -->
<c:if test="${sessionScope.account == null}">
	<%@include file="../components/login_modal.jsp" %>
	<%@include file="../components/register_modal.jsp" %>
	<%@include file="../components/forgot_modal.jsp" %>
</c:if>