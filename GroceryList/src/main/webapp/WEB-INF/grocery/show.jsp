<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Result(s)</title>
</head>
<body>

	<div class="container">
		<h2>Search Result(s):</h2>

		<c:forEach var="grocery" items="${groceries}">
			<h2>${grocery.item}</h2>
			<p>Description: ${grocery.description}</p>
			<p>Amount to buy: ${grocery.amount}</p>
			<p>Size: ${grocery.size}</p>
			<p>Buy at: ${grocery.store}</p>
			<form action="getItemFields.do" method="GET">
				<button type="submit" name="itemId" value="${grocery.id}">Update
					Item</button>
			</form>
			<form action="deleteItem.do" method="POST">
				<button type="submit" name="itemId" value="${grocery.id}">Delete
					Item</button>
			</form>
			<hr>
		</c:forEach>
	</div>
	<a href="index.do">Return Home</a>
</body>
</html>