<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/common.jsp"%>
<header class="header-section" style="background: #ffffff">
	<div class="header-top">
		<div class="container">
			<div class="ht-left">
				<div class="mail-service">
					<i class=" fa fa-envelope"></i> phithang0403@gmail.com
				</div>
				<div class="phone-service">
					<i class=" fa fa-phone"></i> +84377166208
				</div>
			</div>
			<div class="ht-right">
				<c:choose>
					<c:when test="${sessionScope.account == null}">
						<a class="login-panel px-3" data-toggle="modal"
							data-target="#registerModal"><i class="fa fa-user"></i>Đăng ký</a>
						<a class="login-panel px-3" data-toggle="modal"
							data-target="#loginModal"><i class="fa fa-user"></i>Đăng nhập</a>
					</c:when>
					<c:otherwise>
						<span class="login-panel p-0  dropdown">
							<button type="button"
								class="btn bg-transparent px-3 py-1 w-100 dropdown-toggle text-right"
								data-toggle="dropdown" aria-expanded="false">
								<span class="mr-3">Chào, ${sessionScope.account.fullname}</span>
								<img src="/avatar/${sessionScope.account.avatar}" class="rounded-circle mr-3" style="width: 40px; height: 40px;">
							</button>
							<div class="dropdown-menu" style="left: auto; right: 0;">
								<c:if test="${sessionScope.account.isAdmin()}">
									<a class="dropdown-item" href="/admin/home">Quản lý</a>
								</c:if>
								<a class="dropdown-item" href="/profile">Thông tin</a> <a
									class="dropdown-item" href="/change_password">Đổi mật khẩu</a> <a
									class="dropdown-item" href="/order_status">Đơn hàng</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="/logout">Đăng xuất</a>
							</div>
						</span>
					</c:otherwise>
				</c:choose>
				<div class="lan-selector">
					<select class="language_drop" name="countries" id="countries"
						style="width: 300px;">
						<option value='yu' data-image="/img/flag-2.jpg"
							data-imagecss="flag yu" data-title="Bangladesh"> VIE </option>
						<option value='yt' data-image="/img/flag-1.jpg"
							data-imagecss="flag yt" data-title="English"> ENG </option>
					</select>
				</div>
				<div class="top-social">
					<a href="#"><i class="ti-facebook"></i></a> <a href="#"><i
						class="ti-twitter-alt"></i></a> <a href="#"><i class="ti-linkedin"></i></a>
					<a href="#"><i class="ti-pinterest"></i></a>
				</div>
			</div>
		</div>
	</div>
	<div class="container" style="background: #ffffff">
		<div class="inner-header">
			<div class="row">
				<div class="col-lg-2 col-md-2">
					<div class="logo">
						<a href="/home"> <img src="/img/logo.png"
							class="img-responsive" alt="Logo">
						</a>
					</div>
				</div>
				<div class="col-lg-7 col-md-7">
					<div class="advanced-search">
						<button type="button" class="category-btn">Danh mục</button>
						<div class="input-group">
							<input type="text" placeholder="Bạn cần tìm kiếm gì?">
							<button type="button">
								<i class="ti-search"></i>
							</button>
						</div>
					</div>
				</div>
				<div class="col-lg-3 text-right col-md-3">
					<ul class="nav-right">
						<li class="heart-icon"><a href="#"> <i
								class="icon_heart_alt"></i> <span>0</span>
						</a></li>
						<li class="cart-icon"><a href="/cart"> <i
								class="icon_bag_alt"></i> <span id="totalQuantity">${cart.totalQuantity}</span>
						</a>
							<div class="cart-hover">
								<div class="select-items">
									<table>
										<tbody id="cartShow">
											<c:forEach var="detail" items="${cart.listDetail}">
												<tr>
													<td class="si-pic"><img style="width: 60px"
														src="/images/${detail.value.cateId}/${detail.value.image}" alt=""></td>
													<td class="si-text">
														<div class="product-selected">
															<p>
																<fmt:formatNumber type="number"
																	value="${detail.value.price}" />
																VND
															</p>
															<h6>${detail.value.quantity}x${detail.value.name}</h6>
														</div>
													</td>
													<td class="si-close"><i class="ti-close"></i></td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>
								<div class="select-total">
									<span>Tổng:</span>
									<h5 id="totalPrice1">
										<fmt:formatNumber type="number" value="${cart.totalPrice}" />
										VND
									</h5>
								</div>
								<div class="select-button">
									<a href="/cart" class="primary-btn view-card">Giỏ hàng </a> <a
										href="/checkout" class="primary-btn checkout-btn">Thanh toán</a>
								</div>
							</div></li>
						<li class="cart-price" id="totalPrice2"><fmt:formatNumber
								type="number" value="${cart.totalPrice}" /> VND</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="nav-item">
		<div class="container">
			<div class="nav-depart">
				<div class="depart-btn">
					<i class="ti-menu"></i> <span>Tất cả danh mục</span>
					<ul class="depart-hover">
						<li><a href="/product/shirt">Áo</a></li>
						<li><a href="/product/trouser">Quần</a></li>
						<li><a href="/product/accessory">Phụ kiện</a></li>
					</ul>
				</div>
			</div>
			<nav class="nav-menu mobile-menu">
				<ul>
					<li class="item_nav"><a href="/home">Trang chủ</a></li>
					<li class="item_nav"><a href="/about">Giới thiệu</a></li>
					<li class="item_nav"><a href="/products">Sản phẩm</a></li>
					<li class="item_nav"><a href="/contact">Liên hệ</a></li>
				</ul>
			</nav>
			<div id="mobile-menu-wrap"></div>
		</div>
	</div>
</header>