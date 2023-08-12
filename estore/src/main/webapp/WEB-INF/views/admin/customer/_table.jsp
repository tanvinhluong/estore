<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>


<table class="table">
<thead>
	<tr>
		<th>Id</th>
		<th>Name</th>
		<th>Email</th>
		<th>Photo</th>
		<th>Activated</th>
		<th></th>
	</tr>
</thead>
<tbody>
	<c:forEach var="item" items="${list}">
	<tr>
		<td>${item.id}</td>
		<td>${item.fullname}</td>
		<td>${item.email}</td>
		<td>${item.photo}</td>
		<td>${item.activated?'Yes':'No'}</td>
		<td><a href="/admin/customer/edit/${item.id}">Edit</a></td>
	</tr>
	</c:forEach>
</tbody>
</table>