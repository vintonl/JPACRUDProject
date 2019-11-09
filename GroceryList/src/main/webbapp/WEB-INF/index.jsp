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
		Enter item to find: <input type="text" name="find" /> <input type="submit"
			value="Find Item" />
	</form>
	<br>
	<h2>Items on the list:</h2>
	<ul>
		<c:forEach var="grocery" items="${groceries}">
			<li>
				<form action="getGroceries.do" method="GET">
					<a href="getGroceries.do?find=${grocery.title }">${grocery.title}</a>
				</form>
			</li>
			<br>
		</c:forEach>
	</ul>
</body>
</html>