<%@page import="net.codejava.controller.MainController"%>
<%@page import="net.codejava.model.Category"%>
<%@page import="net.codejava.service.CategoryService"%>
<%@page import="net.codejava.service.ProductTypeService"%>
<%@page import="net.codejava.model.ProductType"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Manager</title>
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
	<c:if test="${not empty message }">
	<div role="alert" aria-live="assertive" aria-atomic="true" class="toast" data-autohide="false" style="position: fixed; top: 70px; right:10px; z-index: 999; width: 100%;">
  <div class="toast-header">
    <strong class="mr-auto">Login success</strong>
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
		<div style="width: 80%; text-align: center;">
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


			<div class="login"
				style="height: 600px; width: 50%; margin: auto; text-align: center">
				<form:form style="margin-top: 300px" modelAttribute="Users"
					action="CheckLogin" method="POST">
					<h3>Đăng nhập</h3>
					<div class="form-group" style="color: white">
						<label for="exampleInputEmail1">Email</label>
						<form:input type="email" name="email" path="username"
							class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="Nhập Email của bạn"
							style=" text-align: center" required="required"/>
						<small id="emailHelp" class="form-text text-muted"
							style="color: white">Không chia sẻ tài khoản của bạn cho
							bất cứ ai</small>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1" style="color: white">Password</label>
						<form:input path="Pass_word" type="password" name="password"
							class="form-control" id="exampleInputPassword1"
							placeholder="Mật khẩu" style=" text-align: center" required="required" />
					</div>
					<div class="form-group form-check">
						<span class="badge badge-pill badge-danger">${message}</span> <br />
						Chưa có tài khoản?<a href="Dangky.jsp"> Đăng ký ngay</a>
					</div>
					<button type="submit" class="btn btn-light">Đăng nhập</button>
				</form:form>
			</div>






		</div>

	</div>
</body>
</html>