<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Item</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<link rel="stylesheet" href="/CSS/main.css">

</head>
<body>
	<div class="container">
	<h1>Add an item:</h1>
		<form:form action="createItem.do" method="POST"
			modelAttribute="grocery">

			<form:label path="item">Item:</form:label>
			<form:input path="item" />
			<form:errors path="item" />
			<br />

			<form:label path="description">Description:</form:label>
			<form:input path="description" />
			<form:errors path="description" />
			<br />

			<form:label path="amount">Amount:</form:label>
			<form:input path="amount" type="number" />
			<form:errors path="amount" />
			<br />

			<form:label path="size">Size:</form:label>
			<form:input path="size" />
			<form:errors path="size" />
			<br />

			<form:label path="store">Store to by item at: </form:label>
			<form:select path="store">
				<form:option value="Costco">Costco</form:option>
				<form:option value="Trader-Joe's">Trader-Joe's</form:option>
				<form:option value="King Soopers">King Soopers</form:option>
				<form:option value="Sprouts">Sprouts</form:option>
				<form:option value="Whole Foods">Whole Foods</form:option>
				<form:option value="Not listed">Another store not listed</form:option>
			</form:select>
			<br>

			<button type="submit" name="itemId" value="${grocery.id}" class="btn btn-outline-light btn-md">Add
				Item</button>
		</form:form>
		<br /> <a href="index.do" class="badge badge-light">Cancel and/or Return Home</a>
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