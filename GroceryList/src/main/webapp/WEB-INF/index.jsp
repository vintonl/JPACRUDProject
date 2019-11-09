<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Grocery List</title>
</head>

<body>

	<form action="getGroceries.do" method="GET">
		Enter item: <input type="text" name="find" /> <input
			type="submit" value="Find Item" />
	</form>
	<br>
	<h2>Grocery List:</h2>
	<ul>
		<c:forEach var="grocery" items="${groceries}">
			<li>
				<form action="getGroceries.do" method="GET">
					<a href="getGroceries.do?find=${grocery.item }">${grocery.item }</a>
				</form>
			</li>
			<br>
		</c:forEach>
	</ul>
</body>
</html>