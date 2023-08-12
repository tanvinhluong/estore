<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="panel-body">
	${message}
	<form:form action="/admin/customer/index"
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
			<label>Fullname</label>
			<form:input path="fullname" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<label>Email Address</label>
			<form:input path="email" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<label>Activated</label>
			<div class="form-control">
				<form:radiobutton path="activated" value="true" label="Yes"/>
				<form:radiobutton path="activated" value="false" label="No"/>
			</div>
		</div>
		<div class="form-group">
			<label>Photo</label>
			<input type="file" name="photo_file">
			<form:hidden path="photo"/>
		</div>
		<div class="form-group">
			<button class="btn btn-default" formaction="/admin/customer/insert">Insert</button>
			<button class="btn btn-default" formaction="/admin/customer/update">Update</button>
			<button class="btn btn-default" formaction="/admin/customer/delete">Delete</button>
			<button class="btn btn-default" formaction="/admin/customer/index">Reset</button>
		</div>
	</form:form>
</div>
