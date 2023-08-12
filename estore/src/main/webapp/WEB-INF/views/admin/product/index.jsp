<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Insert title here</title>
</head>
<body>
	<h2 class="aler alert-warning">Product Manager</h2>
	
	<ul class="nav nav-tabs">
	  <li class="active"><a data-toggle="tab" href="#edit">Edition</a></li>
	  <li><a data-toggle="tab" href="#list">List</a></li>
	</ul>
	
	<div class="tab-content">
	  <div id="edit" class="tab-pane fade in active">
	    <!-- FORM -->
	    <jsp:include page="_form.jsp"/>
	  </div>
	  <div id="list" class="tab-pane fade">
	    <!-- BANG -->
	    <ul class="pager">
	    	<li><a href="#"><span class="glyphicon glyphicon-fast-backward"></span></a></li>
	    	<li><a href="#"><span class="glyphicon glyphicon-backward"></span></a></li>
	    	<li><a href="#"><span class="glyphicon glyphicon-forward"></span></a></li>
	    	<li><a href="#"><span class="glyphicon glyphicon-fast-forward"></span></a></li>
	    </ul>
	    <div id="table">
	    	<jsp:include page="_table.jsp"/>
	    </div>
	  </div>
	</div>
	
	<script>
	$(function(){
		pageNo = 0;
		pageSize = 10;

		$.ajax({
			url:"/admin/product/count",
			data:{pageSize:pageSize},
			success:function(response){
				pageCount = parseInt(response);
			}
		});
		
		$(".pager a:eq(0)").click(function(){
			pageNo = 0;
			loadPage();
			return false;
		});
		$(".pager a:eq(1)").click(function(){			
			if(pageNo > 0){
				pageNo -= 1;
				loadPage();
			}
			return false;
		});
		$(".pager a:eq(2)").click(function(){
			if(pageNo < pageCount - 1){
				pageNo += 1;
				loadPage();
			}
			return false;
		});
		$(".pager a:eq(3)").click(function(){
			pageNo = pageCount - 1;
			loadPage();
			return false;
		});
		
		function loadPage(){
			$.ajax({
				url:"/admin/product/load",
				data:{pageNo: pageNo, pageSize:pageSize},
				success:function(response){
					$("#table").html(response);
				}
			});
		}
		
		loadPage();
	});
	</script>
</body>
</html>