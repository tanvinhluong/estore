<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="panel-body">
	${message}
	<form:form action="/admin/product/index"
		modelAttribute="model" enctype="multipart/form-data">
		<div class="row">
			<div class="form-group col-sm-4">
				<label>Id</label>
				<form:input path="id" cssClass="form-control" readonly ="true" placeholder="Auto Number"/>
			</div>
			<div class="form-group col-sm-4">
				<label>Name</label>
				<form:input path="name" cssClass="form-control"/>
			</div>
			<div class="form-group col-sm-4">
				<label>Unit Price</label>
				<form:input path="unitPrice" cssClass="form-control"/>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-sm-4">
				<label>Unit Brief</label>
				<form:input path="unitBrief" cssClass="form-control"/>
			</div>
			<div class="form-group col-sm-4">
				<label>Quantity</label>
				<form:input path="quantity" cssClass="form-control"/>
			</div>
			<div class="form-group col-sm-4">
				<label>Discount</label>
				<form:input path="discount" cssClass="form-control"/>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-sm-4">
				<label>Product Date</label>
				<form:input path="productDate" cssClass="form-control"/>
			</div>
			<div class="form-group col-sm-4">
				<label>View Count</label>
				<form:input path="views" cssClass="form-control"/>
			</div>
			<div class="form-group col-sm-4">
				<label>Features</label>
				<div class="form-control">
					<form:checkbox path="available" label="Available?"/>
					<form:checkbox path="special" label="Special?"/>
					<form:checkbox path="latest" label="Latest?"/>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-sm-4">
				<label>Image</label>
				<input type="file" name="photo_file">
				<form:hidden path="image"/>
			</div>
			<div class="form-group col-sm-4">
				<label>Category</label>
				<form:select path="category.id" cssClass="form-control"
					items="${categories}" itemValue="id" itemLabel="nameVN"/>
			</div>
			<div class="form-group col-sm-4">
				<label>Supplier</label>
				<form:select path="supplier.id" cssClass="form-control"
					items="${suppliers}" itemValue="id" itemLabel="name"/>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-sm-12">
				<label>Description</label>
				<form:textarea path="description" rows="3" cssClass="form-control"></form:textarea>
			</div>
			<div class="form-group col-sm-12">
				<button class="btn btn-default" formaction="/admin/product/insert">Insert</button>
				<button class="btn btn-default" formaction="/admin/product/update">Update</button>
				<button class="btn btn-default" formaction="/admin/product/delete">Delete</button>
				<button class="btn btn-default" formaction="/admin/product/index">Reset</button>
			</div>
		</div>
	</form:form>
</div>

<script type="text/javascript">
 
        bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
</script>