<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>


<table class="table">
<thead>
	<tr>
		<th>Id</th>
		<th>Customer</th>
		<th>Order Date</th>
		<th>Amount</th>
		<th>Receiver</th>
		<th></th>
	</tr>
</thead>
<tbody>
	<c:forEach var="item" items="${list}">
	<tr>
		<td>${item.id}</td>
		<td>${item.customer.id}</td>
		<td>${item.orderDate}</td>
		<td>${item.amount}</td>
		<td>${item.receiver}</td>
		<td><a href="/admin/order/edit/${item.id}">Edit</a></td>
	</tr>
	</c:forEach>
</tbody>
</table>