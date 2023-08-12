<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>

<script src="/static/slideshow/js/modernizr.custom.63321.js"></script>
<script src="/static/slideshow/js/jquery.catslider.js"></script>
<link href="/static/slideshow/css/catslider.css" rel="stylesheet" />

<style>
.mi-slider {
	height: 330px;
}

.mi-slider ul li img {
	height: 200px;
}
</style>
<script>
	$(function() {
		showCatSlider('.mi-slider', 5000);
	});
</script>
</head>
<body>
	<!--Slide show-->
	<div class="mi-slider">
		<!-- 	hiện danh sách 5 sản phẩm -->
		<c:forEach items="${cates}" var="c">
			<ul>
				<c:forEach items="${list}" var="p">
					<li><a href="/product/detail/${p.id}"> <img
							src="/static/images/products/${p.image}" />
							<h4>${p.unitPrice}</h4>
					</a></li>
				</c:forEach>

			</ul>
		</c:forEach>
		<nav>
			<c:forEach items="${cates}" var="c">
				<a href="#" style="font-size: 12px">${c.nameVN}</a>
			</c:forEach>
		</nav>
	</div>
</body>
</html>
