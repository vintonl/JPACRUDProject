<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item Details</title>
</head>
<body>

	<div>
		<h5>${grocery.title}</h5>
		<p>Description: ${grocery.description}</p>
		<p>Amount to buy: ${grocery.amount}</p>
		<p>Store that sells item: ${grocery.store}</p>
		<p>Size of item: ${grocery.size}</p>
	</div>

</body>
</html>