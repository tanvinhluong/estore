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
	<h2 class="aler alert-warning">Master-Role Manager</h2>	
	<fieldset>
		<legend>Master</legend>
		<select id="masterId">
		<c:forEach var="m" items="${masters}">
			<option value="${m.id}">${m.fullName}</option>
		</c:forEach>
		</select>
	</fieldset>
	
	<fieldset>
		<legend>Roles</legend>
		<ul>
		<c:forEach var="r" items="${roles}">
			<li>
				<label class="checkbox-inline">
					<input type="checkbox" value="${r.id}">
					${r.name}
				</label>
			</li>
		</c:forEach>
		</ul>
	</fieldset>
	
	<script type="text/javascript">
	$(function() {
		// Xử lý chọn master
		$("#masterId").change(function() {
			var mid = $(this).val();
			$.ajax({
				url:"/admin/master-role/get-role-ids",
				data:{masterId: mid},
				dataType:"json",
				success:function(response){
					$(":checkbox").prop("checked", false);
					$(response).each(function(index, item) {
						$(":checkbox[value="+item+"]").prop("checked", true);
					});
				}
			});
		});
		
		$("#masterId").change();
		
		// Xử lý chọn/bỏ chọn role
		$(":checkbox").click(function() {
			var rid = $(this).val();
			var mid = $("#masterId").val();
			$.ajax({
				url:"/admin/master-role/update",
				data:{masterId: mid, roleId: rid}
			});
		});
	});
	</script>
</body>
</html>