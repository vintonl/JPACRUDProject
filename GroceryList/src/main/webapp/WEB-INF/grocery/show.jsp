<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item Details</title>
</head>
<body>

	<div>
		<c:forEach var="grocery" items="${groceries}">
			<h2>${grocery.item}</h2>
			<p>Description: ${grocery.description}</p>
			<p>Amount to buy: ${grocery.amount}</p>
			<p>Store that sells item: ${grocery.store}</p>
			<p>Size of item: ${grocery.size}</p>
			<form action="getItemFields.do" method="GET">
				<button type="submit" name="itemId" value="${grocery.id}">Update
					Item</button>
			</form>
			<form action="deleteItem.do" method="POST">
				<button type="submit" name="itemId" value="${grocery.id}">Delete
					Item</button>
			</form>
		</c:forEach>
	</div>

</body>
</html>