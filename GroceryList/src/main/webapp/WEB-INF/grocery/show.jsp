<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="nav.jsp"%>
<title>Search Result(s)</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<link href="<c:url value="/CSS/main.css" />" rel="stylesheet">

</head>
<body>
	<div class="container">
		<br> <br> <br>
		<h4>Search Result(s):</h4>
		<c:if test="${empty groceries }">
			<h5>No items found</h5>
		</c:if>
		<ol>
			<c:forEach var="grocery" items="${groceries}">
				<li>
					<h4>${grocery.item}</h4>
				</li>
				<ul>
					<li>Description: ${grocery.description}</li>
					<li>Amount: ${grocery.amount}</li>
					<li>Size: ${grocery.size}</li>
					<li>Buy at: ${grocery.store}</li>
				</ul>
				<br>
				<form action="updateItemPurchased.do" method="POST">
					<button type="submit" class="btn btn-outline-light btn-md"
						name="itemId" value="${grocery.id}">Mark as Purchased</button>
				</form>
				<form action="getItemFields.do" method="GET">
					<button type="submit" class="btn btn-outline-light btn-md"
						name="itemId" value="${grocery.id}">Update Item</button>
				</form>
				<br>
			</c:forEach>
		</ol>
		<a href="index.do" class="badge badge-light">Return Home</a> <br>
		<br> <br>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>

</body>
</html>