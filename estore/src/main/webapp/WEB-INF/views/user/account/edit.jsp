<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div id="mainBody">
	<div class="row">
		<div class="span9" id="mainCol">
			<ul class="breadcrumb">
				<li><a href="/home/index">Trang Chủ</a> <span class="divider"></span></li>
				<li class="active">Sửa thông tin</li>
			</ul>
			<h2>EDIT PROFILE</h2>
			${message}
			<form:form action="/account/edit" modelAttribute="form"
				enctype="multipart/form-data">
				<div class="form-group">
					<label>Username</label>
					<form:input path="id" cssClass="form-control" readonly="true" />
				</div>
				<form:hidden path="password" cssClass="form-control" />
				<div class="form-group">
					<label>Fullname</label>
					<form:input path="fullname" cssClass="form-control" />
				</div>
				<div class="form-group">
					<label>Email Address</label>
					<form:input path="email" cssClass="form-control" />
				</div>
				<div class="form-group">
					<label>Photo</label> <input type="file" name="photo_file">
					<form:hidden path="photo" />
					<img src="/static/images/customers/${form.photo}" width="100">
				</div>
				<form:hidden path="activated" />
				<div class="form-group">
					<button class="btn btn-primary">Update</button>
				</div>
			</form:form>

		</div>
	</div>
</div>
