<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<%@include file="nav.jsp" %>
<title>The Grocery List</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link href="<c:url value="/CSS/main.css" />" rel="stylesheet">
</head>

<body>
	<div class="container">
		<br> <br> <br>
		<h4>Items to purchase:</h4>
		<c:if test="${empty groceries }">No items found</c:if>
		<c:forEach var="grocery" items="${groceries}">
			<ul>
				<li><form action="getGroceries.do" method="GET">
						<a href="getGroceries.do?find=${grocery.item }">${grocery.item }</a>
					</form></li>
				<ul>
					<li><form action="updateItemPurchased.do" method="POST">
							<button type="submit" class="btn btn-outline-light btn-md" name="itemId"
								value="${grocery.id}">Mark as Purchased</button>
						</form></li>
					<li><form action="getItemFields.do" method="GET">
							<button type="submit" class="btn btn-outline-light btn-md" name="itemId"
								value="${grocery.id}">Update Item</button>
						</form></li>
				</ul>
			</ul>
		</c:forEach>
		<h4>Purchased items:</h4>
		<c:if test="${empty purchasedGroceries }">No items found</c:if>
		<c:forEach var="purchasedGroceries" items="${purchasedGroceries}">
			<ul>
				<li><form action="getGroceries.do" method="GET">
						<a href="getGroceries.do?find=${purchasedGroceries.item }">${purchasedGroceries.item }</a>
					</form></li>
				<ul>
					<li><form action="updateItemAddBackToList.do" method="POST">
							<button type="submit" class="btn btn-outline-light btn-md" name="itemId"
								value="${purchasedGroceries.id}">Add Back</button>
						</form></li>

					<li><form action="deleteItem.do" method="POST">
							<button type="submit" class="btn btn-outline-light btn-md" name="itemId"
								value="${purchasedGroceries.id}">Delete Item</button>
						</form></li>
				</ul>
			</ul>
		</c:forEach>
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