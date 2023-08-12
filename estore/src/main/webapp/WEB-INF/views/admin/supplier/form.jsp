<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

	<div class="panel-body">
	${message}
	<form:form action="/admin/supplier/index"
		modelAttribute="model" enctype="multipart/form-data">
		<div class="form-group">
			<label>Id</label>
			<form:input path="id" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<label>Name</label>
			<form:input path="name" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<label>Phone</label>
			<form:input path="phone" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<label>Email</label>
			<form:input path="email" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<label>Logo</label>
			<input type="file" name="upLogo">
			<form:hidden path="logo"/>
		</div>
		<div class="form-group">
			<button class="btn btn-default" formaction="/admin/supplier/insert">Insert</button>
			<button class="btn btn-default" formaction="/admin/supplier/update">Update</button>
			<button class="btn btn-default" formaction="/admin/supplier/delete">Delete</button>
			<button class="btn btn-default" formaction="/admin/supplier/index">Reset</button>
		</div>
	</form:form>
</div>