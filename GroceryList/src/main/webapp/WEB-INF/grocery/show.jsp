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
				<form action="getItemFields.do" method="GET">
					<button type="submit" name="itemId" value="${grocery.id}">Update
						Item</button>
				</form>
				<form action="deleteItem.do" method="POST">
					<button type="submit" name="itemId" value="${grocery.id}">Delete
						Item</button>
				</form>
				<br>
			</c:forEach>
		</ol>
	</div>
	<a href="index.do">Return Home</a>
</body>
</html>