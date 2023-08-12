<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div id="mainBody">
	<div class="row">
		<div class="span9" id="mainCol">
			<ul class="breadcrumb">
				<li><a href="/home/index">Trang Chủ</a> <span class="divider"></span></li>
				<li class="active">Đăng ký</li>
			</ul>
			<h2>REGISTRATION</h2>
			<h4>${message}</h4>
			<form:form action="/account/register" modelAttribute="form"
				enctype="multipart/form-data">
				<div class="form-group">
					<label>Username</label>
					<form:input path="id" class="form-control" />
				</div>
				<div class="form-group">
					<label>Password</label>
					<form:input path="password" class="form-control" />
				</div>
				<div class="form-group">
					<label>Fullname</label>
					<form:input path="fullname" class="form-control" />
				</div>
				<div class="form-group">
					<label>Email Address</label>
					<form:input path="email" class="form-control" />
				</div>
				<div class="form-group">
					<label>Photo</label> <input type="file" name="photo_file">
					<form:hidden path="photo" class="form-control" />
				</div>

				<div class="form-group">
					<button class="btn btn-default">Register</button>
				</div>
			</form:form>
		</div>
	</div>
</div>
