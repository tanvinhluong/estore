<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}"/>
<div class="panel panel-default">
	<div class="panel-heading">Shopping Cart</div>
	<div class="panel-body">
		<img id="cart-img" src="/static/images/ico-cart.png" class="col-sm-5">
		<ul class="col-sm-7">
		<li><b id="cart-cnt">${cart.count}</b> mặt hàng </li>
		<li><b id="cart-amt">
			<f:formatNumber value="${cart.amount}" pattern="#,###.00"/> 
		</b> VNĐ </li>
		<li>
		<a href="/cart/view">Xem giỏ hàng</a>
		</li>
		</ul>
	</div>
</div>

<div class="panel panel-default">
	<div class="panel-heading">TÌM KIẾM</div>
	<div class="panel-body">
		<form action="/product/list-by-keywords/" method="post">
			<input value="${param.keywords}" name="keywords" class="form-control" placeholder="Keywords">
		</form>
	</div>
</div>

<div class="panel panel-default">
	<div class="panel-heading">DANH MỤC</div>
	<div class="list-group">
	<c:forEach var="c" items="${cates}">
		<a href="/product/list-by-category/${c.id}" class="list-group-item">${c.nameVN }</a>
	</c:forEach> 
	</div>
</div>
<div class="panel panel-default">
	<div class="panel-heading">NHÀ CUNG CẤP</div>
	<div class="list-group">
	<c:forEach var="c" items="${supps}">
		<a href="/product/list-by-supplier/${c.id}" class="list-group-item">${c.name}</a>
	</c:forEach> 
	</div>
</div>

<div class="panel panel-default">
	<div class="panel-heading">ĐẶC BIỆT</div>
	<div class="list-group">
		<a href="/product/list-by-special/0" class="list-group-item">New products</a> 
		<a href="/product/list-by-special/1" class="list-group-item">Best seller</a> 
		<a href="/product/list-by-special/2"class="list-group-item">Most popular</a>
		<a href="/product/list-by-special/3"class="list-group-item">Sale off</a>
	</div>
</div>

<style id="cart-css"></style>
