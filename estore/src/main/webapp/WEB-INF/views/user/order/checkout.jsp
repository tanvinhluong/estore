<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Insert title here</title>
</head>
<body>
	<h2>CHECKOUT</h2>
	<table class="table table-hover">
	<thead>
		<tr>
			<th>Name</th>
			<th>Unit Price</th>
			<th>Quantity</th>
			<th>Discount</th>
			<th>Amount</th>
		</tr>
	</thead>
	<tbody>
		<c:set var="cart" value="${sessionScope['scopedTarget.cart']}"/>
		<c:forEach var="p" items="${cart.items}">
			<tr>
				<td>${p.name}</td>
				<td>${p.unitPrice}</td>
				<td>${p.quantity}</td>
				<td>${p.discount}</td>
				<td>${p.unitPrice*p.quantity*(1-p.discount)}</td>
			</tr>
		</c:forEach>
	</tbody>
	</table>
	${message}
	<form:form action="/order/checkout" modelAttribute="order">
		<form:hidden path="id"/>
		<div class="row">
			<div class="form-group col-sm-4">
				<label>Customer</label>
				<form:input path="customer.id" readonly="true" cssClass="form-control"/>
			</div>
			<div class="form-group col-sm-4">
				<label>Order Date</label>
				<form:input path="orderDate" readonly="true" cssClass="form-control"/>
			</div>
			<div class="form-group col-sm-4">
				<label>Require Date</label>
				<form:input path="requireDate" cssClass="form-control"/>
			</div>
		</div>
		<div class="row">
			<div class="form-group col-sm-4">
				<label>Receiver</label>
				<form:input path="receiver" cssClass="form-control"/>
			</div>
			<div class="form-group col-sm-4">
				<label>Address</label>
				<form:input path="address" cssClass="form-control"/>
			</div>
			<div class="form-group col-sm-4">
				<label>Amount</label>
				<form:input path="amount" readonly="true" cssClass="form-control"/>
			</div>
		</div>
		<div class="row">
			<div class="form-group col-sm-12">
				<label>Notes</label>
				<form:textarea path="description" cssClass="form-control" rows="5"></form:textarea>
			</div>
			<div class="form-group col-sm-12">
				<button class="btn btn-default">Purchase</button>
			</div>
		</div>
	</form:form>	
</body>
</html>