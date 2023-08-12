<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<div class="panel-body">
	${message}
	<form:form action="/admin/webaction/index" modelAttribute="model">
		<div class="form-group">
			<label>Id</label>
			<form:input path="id" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<label>Name</label>
			<form:input path="name" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<label>Description</label>
			<form:input path="description" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<button class="btn btn-default" formaction="/admin/webaction/insert">Insert</button>
			<button class="btn btn-default" formaction="/admin/webaction/update">Update</button>
			<button class="btn btn-default" formaction="/admin/webaction/delete">Delete</button>
			<button class="btn btn-default" formaction="/admin/webaction/index">Reset</button>
		</div>
	</form:form>
</div>