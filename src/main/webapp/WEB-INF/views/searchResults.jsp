<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--  Enable Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
</head>
<header>
	<%@ include file="header.jsp"%>
</header>
<body>
	<div class="container">
		<div class="row p-3 mb-5 border">
			<div class="col-9">
					<h3 style="color: #e4e4e4;"> <i> Search Results for: ${keyword} </i> </h3>
			</div>
		</div>
		<c:if test="${empty searchCar}">
			<div class="alert alert-danger">No search results found for
			${keyword}</div>
		</c:if>
		<!-- list of all cars posted -->
		<div class="row" style="gap: 60px;">
			<c:forEach items="${searchCar}" var="c">
				<c:if test="${c.sellStatus != 'sold'}">
				<c:if test="${c.sellStatus != 'deactivated'}">
				<div class="card bg-dark border border-white mb-2" style="width: 335px; color: #e4e4e4;">
					<img class="card-img-top mt-3 border border-white" src="${c.photoImagePath}"
						alt="${c.photos}" style="width: 100%">
					<hr style="color: white;">
					<div class="card-body">
						<h4 class="card-title">${c.name}</h4>
						<p class="card-text">
							<i class="fas fa-tags" style="color: #e4e4e4;"></i>&nbsp;₱ ${c.price}
							<br>
							<i class="fas fa-calendar" style="color: #e4e4e4;"></i> ${c.make}
						</p>
						<a href="/car_detail?cid=${c.id}" class="btn btn-outline-light">View
							Car Details</a>
					</div>
				</div>
				</c:if>
				</c:if>
			</c:forEach>

		</div>
		<!-- list of all cars posted -->
	</div>
</body>
<style>
	body {
		background-color: #1c1c1d;
		font-family: "Raleway", sans-serif;
  		font-optical-sizing: auto;
  		font-style: normal;
		font-weight: 500;
	}
</style>
<footer>
	<%@ include file="footer.jsp"%>
</footer>
</html>