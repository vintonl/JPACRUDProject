<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Grocery List</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<link rel="stylesheet" href="/CSS/main.css">

</head>

<body>

	<form action="getGroceries.do" method="GET">
		Search List: <input type="text" name="find"
			placeholder="banana or Costco" /> <input type="submit"
			value="Find Item" />
	</form>
	<a href="create.do">Add Item</a>
	<br>
	<div class="container">
		<h2>Grocery List:</h2>

		<ol>
			<c:forEach var="grocery" items="${groceries}">
				<li><c:if test="${empty groceries }">No items on the list found</c:if>
					<form action="getGroceries.do" method="GET">
						<a href="getGroceries.do?find=${grocery.item }">${grocery.item }</a>
					</form></li>

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