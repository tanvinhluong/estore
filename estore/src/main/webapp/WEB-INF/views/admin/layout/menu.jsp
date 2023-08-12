<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<body>

        <div class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="/admin/home/login" class="navbar-brand">Trang chủ</a>
            </div>
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Quản lý<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/admin/product/index">Hàng hóa</a></li>
                            <li><a href="/admin/supplier/index">Nhà cung cấp</a></li>
                            <li><a href="/admin/category/index">Chủng loại</a></li>
                            <li><a href="/admin/customer/index">Khách hàng</a></li>
                            <li><a href="/admin/order/index">Hóa đơn</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Thống kê<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/admin/inventory/index">Tồn kho theo loại</a></li>
                            <li class="divider"></li>
                            <li><a href="/admin/revenue/category">Doanh số theo loại</a></li>
					<li><a href="/admin/revenue/customer">Doanh số theo khách hàng</a></li>
                            <li class="divider"></li>
                            <li><a href="/admin/revenue/year">Doanh số theo năm</a></li>
					<li><a href="/admin/revenue/quarter">Doanh số theo quý</a></li>
					<li><a href="/admin/revenue/month">Doanh số theo tháng</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#" class="dropdown-toggle" data-toggle="dropdown">Tài khoản <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li>
                            	<a href="/admin/home/logoff">
                            	<c:choose>
                            		<c:when test="${empty master}">Đăng nhập</c:when>
                            		<c:otherwise>Đăng xuất</c:otherwise>
                            	</c:choose>
                            	</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="/admin/master/index">Quản lý tài khoản</a></li>
                            <li><a href="/admin/role/index">Quản lý vai trò</a></li>
                            <li><a href="/admin/webaction/index">Quản lý chức năng</a></li>
                            <li class="divider"></li>
                            <li><a href="/admin/master-role/index">Phân vai trò</a></li>
                            <li><a href="/admin/web-action-role/index">Phân quyền sử dụng</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
</body>