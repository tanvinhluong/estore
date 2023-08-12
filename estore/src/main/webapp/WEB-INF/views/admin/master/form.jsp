<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<div class="panel-body">
	${message}
	<form:form action="/admin/master/index"
		modelAttribute="model" enctype="multipart/form-data">
		<div class="form-group">
			<label>Id</label>
			<form:input path="id" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<label>Password</label>
			<form:input path="password" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<label>FullName</label>
			<form:input path="fullName" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<label>Mobile</label>
			<form:input path="mobile" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<label>Email</label>
			<form:input path="email" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<button class="btn btn-default" formaction="/admin/master/insert">Insert</button>
			<button class="btn btn-default" formaction="/admin/master/update">Update</button>
			<button class="btn btn-default" formaction="/admin/master/delete">Delete</button>
			<button class="btn btn-default" formaction="/admin/master/index">Reset</button>
		</div>
	</form:form>
</div>