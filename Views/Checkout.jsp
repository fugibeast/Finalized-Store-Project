<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">	
<title>Order Review</title>
</head>
<body>
	<div class="container" align="center">
		<h3>Order Summary</h3>
		<table class="table table-bordered table-striped table-hover">
			<tr>
				<td>Name</td> <td>Quantity</td> <td>Price</td>
			</tr>
			<c:forEach items="${shoppingCart}" var="item">
				<tr>
					<td><c:out value="${item.name}" escapeXml="true" /></td> <td>${item.quantity}</td> <td>${item.total}</td>
				</tr>
			</c:forEach>
		</table>
		<br/>
		<h3>Total Amount: ${overallTotal}</h3>
		<br/>
		<c:if test="${infoError}">
			<br/><h4><span style="color:#ff0000">* indicates required fields</span></h4>
		</c:if>
		
		<form class="form-horizontal" action="Checkout" method="post">
			<div class="form-group">
				<label class="col-sm-2 caontrol-label"><c:if test="${firstNameError}"><span style="color:#ff0000">*</span></c:if>First Name: </label>
				<div class="col-sm-10">
					<input class="form-control" type="text" name="firstName" placeHolder="John" value="${firstName}">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 caontrol-label"><c:if test="${lastNameError}"><span style="color:#ff0000">*</span></c:if>Last Name: </label>
				<div class="col-sm-10">
					<input class="form-control" type="text" name="lastName" placeHolder="Smith" value="${lastName}">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 caontrol-label"><c:if test="${emailError}"><span style="color:#ff0000">*</span></c:if>Email: </label>
				<div class="col-sm-10">
					<input class="form-control" type="email" name="email" placeHolder="your@email.com" value="${email}">
				</div>
			</div>
			<div>
				<button type="submit" class="btn btn-success">Complete Purchase</button>
			</div>
		</form><br/>
		<a href="ShoppingCart"><button class="btn btn-danger">Cancel</button></a>
	</div>
</body>
</html>