<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Manager</title>
</head>
<body>
<div align="center">
	<h2>Customer Manager</h2>
	<form method="get" action="search">
		<input type="text" name="keyword" /> &nbsp;
		<input type="submit" value="Search" />
	</form>
	<h3><a href="new">New Customer</a></h3>
	<table border="1" cellpadding="5">
		<tr>
			<th>ID</th>
			<th>UserName</th>
			<th>Password</th>
			<th>Keys</th>
			<th>Actions</th>
		</tr>
		<c:forEach items="${listUsers}" var="user">
		<tr>
			<td>${user.id}</td>
			<td>${user.username}</td>
			<td>${user.password}</td>
			<td>${user.keys}</td>
			<td>
				<a href="edit?id=${user.id}">Edit</a>
				&nbsp;&nbsp;&nbsp;
				<a href="delete?id=${user.id}">Delete</a>
			</td>
		</tr>
		</c:forEach>
	</table>
</div>	
</body>
</html>