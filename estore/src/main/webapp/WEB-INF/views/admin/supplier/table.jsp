<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<table class="table">
<thead>
	<tr>
		<th>Id</th>
		<th>Name</th>
		<th>Email</th>
		<th>Phone</th>
		<th>Logo</th>
		<th></th>
	</tr>
</thead>
<tbody>
	<c:forEach var="item" items="${list}">
	<tr>
		<td>${item.id}</td>
		<td>${item.name}</td>
		<td>${item.email}</td>
		<td>${item.phone}</td>
		<td>${item.logo}</td>
		<td><a href="/admin/supplier/edit/${item.id}">Edit</a></td>
	</tr>
	</c:forEach>
</tbody>
</table>