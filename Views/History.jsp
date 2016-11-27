<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<title>Transactions</title>
</head>
<body>
<div class="container" align="center">
	<h3>Transaction History</h3>
	<div class="container">
		<c:choose>
			<c:when test="${empty history}">
				<div class="jumbotron">
				<h3 class="text-center" style="color:#ffa366"> Yikes! There are no transactions to display</h3>
				</div>
		</c:when>
		<c:otherwise>
			<table class="table table-bordered table-striped table-hover">
				<tr>
					<th>Order Number</th> <th>Name</th> <th>Quantity</th> <th>Total</th>
				</tr>
				<c:forEach items="${history}" var="item">
					<tr>
						<td>${item.order_number}</td> <td><c:out value="${item.name}" escapeXml="true" /></td> <td>${item.quantity}</td> <td>${item.total}</td>
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
	<a href="Inventory"><button class="btn btn-primary"> Back to Inventory</button></a>
	</div>
</div>
</body>
</html>