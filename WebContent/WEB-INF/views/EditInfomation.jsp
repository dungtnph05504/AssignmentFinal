<%@page import="net.codejava.controller.MainController"%>
<%@page import="net.codejava.model.Category"%>
<%@page import="net.codejava.service.CategoryService"%>
<%@page import="net.codejava.service.ProductTypeService"%>
<%@page import="net.codejava.model.ProductType"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shop</title>
<!-- CSS only -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
</head>
<script type="text/javascript">
$(document).ready(function(){
	  $('.toast').toast('show');
	});
</script>
<body>
	<div class="body" align="center">

	<div class="body" align="center">
<c:if test="${not empty message }">
	<div role="alert" aria-live="assertive" aria-atomic="true" class="toast float-left" data-autohide="false" style="position: fixed; top: 70px; right:10px; z-index: 999; width: 100%;" data-delay="4000">
  <div class="toast-header">
    <strong class="mr-auto">Notice</strong>
    <small>now</small>
    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
  <div class="toast-body">
    ${message }
  </div>
</div>
</c:if>


		<div class="navHead"
			style="position: fixed; top: 0; left: 0; z-index: 999; width: 100%;">
			<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
				class="navbar-brand" href="/CustomerManager/">Home</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<%
						List<ProductType> listProductType = (List<ProductType>) request.getAttribute("listProductTypes");
					for (int i = 0; i < listProductType.size(); i++) {
						String listCategories = "Listcategory" + i;
						List<Category> listCategory = (List<Category>) request.getAttribute(listCategories);
					%>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <%
 	out.print(listProductType.get(i).getProducttype());
 %>
					</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">

							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/prodType?id=<%=listProductType.get(i).getId()%>">
								Toàn bộ <%
								out.print(listProductType.get(i).getProducttype());
							%>
							</a>
							<div class="dropdown-divider"></div>

							<%
								for (Category x : listCategory) {
							%><a class="dropdown-item"
								href="<%=request.getContextPath()%>/prodCate?id=<%=x.getIdcategory()%>">
								<%
									out.print(x.getCategoryname());
								%>
							</a>
							<%
								}
							%>

						</div></li>
					<%
						}
					%>


				</ul>
				<form class="form-inline my-2 my-lg-0" method="get" action="search">
					<input class="form-control mr-sm-2" type="search"
						placeholder="Search" aria-label="Search" name="keyword">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				</form>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/shoppingCart">Giỏ
							Hàng</a></li>
					


					<c:choose>
						<c:when test="${empty cookieValue.value}">
      <li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/Login">Login</a></li>
    </c:when>
						<c:otherwise>
       <li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> Xin chào: ${cookieValue.value}</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="">Your Account </a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="Logout">Đăng xuất</a>
							</div></li>
    </c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</div>


	<div style="padding-top: 5%; width: 60%;">
			<h2>Edit your information</h2>
			<small id="emailHelp" class="form-text text-muted">Edit here</small></br>
			<form:form action="SaveInfoUser" method="post" modelAttribute="Users">
			
			<div class="form-group row">
					<label for="example-text-input" class="col-3 col-form-label">Password:</label>
					<div class="col-9">
							<form:input path="Pass_word" type="password" name="password"
							class="form-control" id="exampleInputPassword1"
							placeholder="**********"  required="required"/>
					</div>
				</div>
				<div class="form-group row">
					<label for="example-text-input" class="col-3 col-form-label">Re-Password:</label>
					<div class="col-9">
							<form:input path="" type="password" name="password"
							class="form-control" id="exampleInputPassword1"
							placeholder="**********"  required="required"/>
					</div>
				</div>
				
				<div class="form-group row">
					<label for="example-text-input" class="col-3 col-form-label">Full
						Name:</label>
					<div class="col-9">
						<form:input type="text" class="form-control" id="example-text-input"
							aria-describedby="emailHelp" placeholder="John Wick" path="fullname" required="required" />
					</div>
				</div>
				<div class="form-group row">
					<label for="exampleInputEmail1" class="col-3 col-form-label">Email
						address:</label>
					<div class="col-9">
						<form:input type="email" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="name@example.com" path="email" required="required" pattern="{1,20}"/>
				
					</div>
					
				</div>
				<div class="form-group row">
					<label for="example-tel-input" class="col-3 col-form-label">Phone
						Number:</label>
					<div class="col-9">
						<form:input type="text" class="form-control" id="example-tel-input"
							placeholder="0936119596" path="phone" required="required" pattern="[0-9]{8,20}"/>
							<small id="emailHelp" class="form-text text-muted "
						style="align: center;">Only enter number. E.g: ...0936119596</small>
					</div>
				</div>
				<div class="form-group row">
					<label for="exampleFormControlTextarea2"
						class="col-3 col-form-label ">Address:</label>
					<div class="col-9">
						<form:textarea class="form-control rounded-0 md-textarea" placeholder="D'Capitale, Trung Hoa, Cau Giay, Ha Noi"  type="text"
							id="exampleFormControlTextarea2" rows="3" path="address" required="required" />
					</div>
				</div>
				<div class="float-right">
					 
					<button type="submit" class="btn btn-success" value="save">Save</button>
				</div>
			</form:form>
		</div>


			<%-- 
			<h2>Customer Manager</h2>
			<form method="get" action="search">
				<input type="text" name="keyword" /> &nbsp; <input type="submit"
					value="Search" />
			</form>
			<h3>
				<a href="new">New Customer</a>
			</h3>
			<table border="1" cellpadding="5" class="table">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Name</th>
					<th scope="col">E-mail</th>
					<th scope="col">Address</th>
					<th scope="col">Action</th>
				</tr>
				<c:forEach items="${listCustomer}" var="customer">
					<tr>
						<td>${customer.id}</td>
						<td>${customer.name}</td>
						<td>${customer.email}</td>
						<td>${customer.address}</td>
						<td><a href="edit?id=${customer.id}">Edit</a>
							&nbsp;&nbsp;&nbsp; <a href="delete?id=${customer.id}">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<h3>
				<a href="user">User</a>
			</h3>
			--%>
		</div>


	</div>
</body>
</html>