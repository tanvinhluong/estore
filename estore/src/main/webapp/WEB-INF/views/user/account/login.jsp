<%@ page pageEncoding="UTF-8"%>
<div id="mainBody">
	<div class="row">
		<div class="span9" id="mainCol">
			<ul class="breadcrumb">
				<li><a href="/home/index">Trang Chủ</a> <span class="divider"></span></li>
				<li class="active">Đăng nhập</li>
			</ul>
			<h2>LOGIN</h2>
			<h4>${message}</h4>
			<form action="/account/login" method="post">
				<div class="form-group">
					<label for="id">Username</label> <input id="id" name="id"
						class="form-control" value="${uid}">
				</div>
				<div class="form-group">
					<label>Password</label> <input type="password" name="pw"
						class="form-control" value="${pwd}">
				</div>
				<div class="form-group">
					<div class="form-control">
						<input name="rm" type="checkbox"> <label>Remember
							me?</label>
					</div>
				</div>

				<div class="form-group">
					<button class="btn btn-default">Login</button>
				</div>

			</form>

		</div>
	</div>
</div>
