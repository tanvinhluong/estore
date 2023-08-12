<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<table class="table">
	<thead>
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Unit Price</th>
			<th>Unit Brief</th>
			<th>Category</th>
			<th>Supplier</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="item" items="${list}">
		<tr>
			<td>${item.id}</td>
			<td>${item.name}</td>
			<td>${item.unitPrice}</td>
			<td>${item.unitBrief}</td>
			<td>${item.category.nameVN}</td>
			<td>${item.supplier.name}</td>
			<td><a href="/admin/product/edit/${item.id}">Edit</a></td>
		</tr>
		</c:forEach>
	</tbody>
	</table>