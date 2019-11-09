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
</head>
<body>
	<h1>Add an item:</h1>
	<div class="container">

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

			<button type="submit" name="itemId" value="${grocery.id}">Add
				Item</button>
		</form:form>
		<br />
	</div>
</body>
</html>