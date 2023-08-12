<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Administrator Tools</title>
  <tiles:insertAttribute name="head"/>
</head>
<body>

<div class="container">
 	<header class="row">
 	<h1 class="alert alert-success">Administrator Tools</h1>
 	</header>
 	<nav class="row">
 		<tiles:insertAttribute name="menu"/>
 	</nav>
 	<div class="row">
 		<tiles:insertAttribute name="body"/>
 	</div>
 	<footer class="row">
 	<p class="text-center">Đồ án Web&copy;2023.All rights reserved.</p>
 	</footer>
</div>

</body>
</html>