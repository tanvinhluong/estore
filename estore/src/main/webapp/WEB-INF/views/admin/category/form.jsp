<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="panel panel-default">
<div class="panel-body">
	${message}
	<form:form action="/admin/category/index" modelAttribute="model">
		<c:if test="${model.id > 0}">
		<div class="form-group">
			<label>Id</label>
			<form:input path="id" cssClass="form-control" readonly="true"/>
		</div>
		</c:if>
		<div class="form-group">
			<label>Name</label>
			<form:input path="name" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<label>Name VN</label>
			<form:input path="nameVN" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<button class="btn btn-default" formaction="/admin/category/insert">Insert</button>
			<button class="btn btn-default" formaction="/admin/category/update">Update</button>
			<button class="btn btn-default" formaction="/admin/category/delete">Delete</button>
			<button class="btn btn-default" formaction="/admin/category/index">Reset</button>
		</div>
	</form:form>
	</div>
</div>