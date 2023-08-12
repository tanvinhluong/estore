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
	<h2 class="aler alert-warning">Web-Action Role Manager</h2>
	
	<fieldset>
		<legend>Role</legend>
		<select id="roleId">
		<c:forEach var="r" items="${roles}">
			<option value="${r.id}">${r.name}</option>
		</c:forEach>
		</select>
	</fieldset>
	
	
	<fieldset>
		<legend>Web Actions</legend>
		<ul class="row list-unstyled">
		<c:forEach var="a" items="${actions}">
			<li class="col-sm-3">
				<label class="checkbox-inline">
					<input type="checkbox" value="${a.id}">
					${a.name}
				</label>
			</li>
		</c:forEach>
		</ul>
		<button class="btn btn-default" formaction="/web-action-role/update">Update</button>
	</fieldset>
	
	<script>
	$(function(){
		$("#roleId").change(function(){
			$.ajax({
				url:"/admin/web-action-role/get-action-ids",
				data:{roleId: $(this).val()},
				dataType:"json",
				success:function(response){
					$(":checkbox").prop("checked", false);
					$(response).each(function(index, item){
						$(":checkbox[value="+item+"]").prop("checked", true);
					})
				}
			});
		});
		
		$("#roleId").change();
		
 		$(":checkbox").click(function(){
			var roleId = $("#roleId").val();
			var actionId = $(this).val();
			$.ajax({
				url:"/admin/web-action-role/update",
				data:{roleId: roleId, actionId: actionId}
			});
		});

	});
	</script>
</body>
</html>