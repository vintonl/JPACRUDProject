<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Film</title>
</head>
<body>
	<h1>Edit an item:</h1>
	<div class="container">
		<c:out value="${itemId }" />
		<c:if test="${not empty grocery }">

			<form:form action="updateItemFields.do" method="POST"
				modelAttribute="grocery">

				Item: ${grocery.item}
				<br />

				<form:label path="item">Item:</form:label>
				<form:input path="item" />
				<form:errors path="item" />
				<br />

				<form:label path="description">Description:</form:label>
				<form:input path="description" />
				<form:errors path="description" />
				<br />

				<form:label path="amount">Amount:</form:label>
				<form:input path="amount" />
				<form:errors path="amount" />
				<br />

				<form:label path="size">Size:</form:label>
				<form:input path="size" />
				<form:errors path="size" />
				<br />

				<form:label path="store">Store to by item at: </form:label>
				<form:select path="store">
					<form:option value="${grocery.store}">${grocery.store}</form:option>
					<form:option value="Costco">Costco</form:option>
					<form:option value="Trader-Joe's">Trader-Joe's</form:option>
					<form:option value="King Soopers">King Soopers</form:option>
					<form:option value="Sprouts">Sprouts</form:option>
					<form:option value="Whole Foods">Whole Foods</form:option>
				</form:select>
				<br>

				<button type="submit" name="itemId" value="${grocery.id}">Update
					Item</button>
				<%-- <input type="text" name="filmID" value="${film.filmId}">
				<input type="submit" value="Update this Film" /> --%>
			</form:form>
		</c:if>
		<br />
	</div>
</body>
</html>