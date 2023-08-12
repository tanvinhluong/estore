<%@ page pageEncoding="UTF-8"%>
<div id="mainBody">
	<div class="row">
		<div class="span9" id="mainCol">
			<ul class="breadcrumb">
				<li><a href="/home/index">Trang Chủ</a> <span class="divider"></span></li>
				<li class="active">Quên mật khẩu</li>
			</ul>
			<h2>FORGOT PASSWORD</h2>
			<h4>${message}</h4>
			<form action="/account/forgot" method="post">
				<div class="form-group">
					<label>Username</label> <input name="id" class="form-control">
				</div>
				<div class="form-group">
					<label>Email</label> <input name="email" class="form-control">
				</div>

				<div class="form-group">
					<button class="btn btn-default">Retrieve Password</button>
				</div>
			</form>
		</div>
	</div>
</div>
