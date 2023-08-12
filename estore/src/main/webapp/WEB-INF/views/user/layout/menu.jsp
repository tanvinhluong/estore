<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/home/index">Home</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="/home/about">About Us</a></li>
			<li><a href="/home/contact">Contact Us</a></li>
			<li><a href="/home/feedback">Feedback</a></li>
			<li class="dropdown">
			<a class="dropdown-toggle"
				data-toggle="dropdown" href="#">Account<span class="caret"></span></a>
				<c:choose>
					<c:when test="${empty sessionScope.user}">
						<ul class="dropdown-menu">
							<li><a href="/account/login">Đăng nhập</a></li>
							<li><a href="/account/register">Đăng ký</a></li>
							<li><a href="/account/forgot">Quên mật khẩu</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="dropdown-menu">
							<li><a href="/account/logoff">Đăng xuất</a></li>
							<li><a href="/account/change">Đổi mật khẩu</a></li>
							<li><a href="/account/edit">Cập nhật tài khoản</a></li>
							<li><a href="/order/list">Đơn hàng</a></li>
							<li><a href="/order/items">Sản phẩm đã mua</a></li>
						</ul>
					</c:otherwise>
				</c:choose></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#">VietNam</a></li>
			<li><a href="#">English</a></li>
		</ul>
	</div>
</nav>