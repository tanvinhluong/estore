<%@ page pageEncoding="UTF-8"%>
<div id="mainBody">
	<div class="row">
		<div class="span9" id="mainCol">
			<ul class="breadcrumb">
				<li><a href="/home/index">Trang Chủ</a> <span class="divider"></span></li>
				<li class="active">Đổi mật khẩu</li>
			</ul>
			<h2>CHANGE PASSWORD</h2>
			<h4>${message}</h4>
			<form action="/account/change" method="post">
				<div class="form-group">
					<label>Username</label> <input name="id" class="form-control">
				</div>
				<div class="form-group">
					<label>Current Password</label> <input name="pw"
						class="form-control">
				</div>
				<div class="form-group">
					<label>New Password</label> <input name="pw1" class="form-control">
				</div>
				<div class="form-group">
					<label>Confirm New Password</label> <input name="pw2"
						class="form-control">
				</div>

				<div class="form-group">
					<button class="btn btn-default">Change</button>
				</div>
			</form>
		</div>
	</div>
</div>
