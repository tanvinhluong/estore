<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width,initial-scale=1" />
    <link rel="stylesheet" type="text/css" href="/static/slideshow/css/demo.css" media="all" />
    <link rel="icon" href="http://www.thuthuatweb.net/wp-content/themes/HostingSite/favicon.ico" type="image/x-ico"/>
    <script src="/static/slideshow/js/modernizr.custom.63321.js"></script>
    <script src="/static/slideshow/js/jquery.min.js"></script>
<script src="/static/slideshow/js/jquery.catslider.js"></script>

</head>

<style>
.mi-slider {
	height: 300px;
}

.mi-slider ul li img {
	height: 120px;
}
</style>
<script type="text/javascript">
    $(function() {

        $( '#mi-slider' ).catslider();

	});
</script>
<h2>TRANG CHỦ</h2>

<!--Slide show-->

<div class="mi-slider">
<div id="mi-slider" class="mi-slider">
					<c:forEach var="c" items="${rands}">
					<ul>
						<c:forEach var="p" items="${c.products}">
						<li>
						<a href="/product/detail/${p.id}">
						<img src="/static/images/products/${p.image}" alt="img01">
						<h4>${p.name}</h4>
						<h4>${p.unitPrice}</h4>
						</a>
						
						</li>
						</c:forEach>
					</ul>
					</c:forEach>
					<nav>
						<c:forEach var="c" items="${rands}">
							<a href="#">${c.nameVN}</a>
						</c:forEach>
					</nav>
				</div>
</div>
				
<!--Specials-->
<%--  <jsp:include page="../product/list.jsp"/>  --%>