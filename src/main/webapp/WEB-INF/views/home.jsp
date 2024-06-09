<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ABC Cars</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<header>
	<%@ include file="header.jsp"%>
</header>
<body>
	<section class="section-1">
			<div>
				<!-- <img src="https://i.pinimg.com/736x/3e/c9/16/3ec916c98be77f85462abfce883fb163.jpg" class="pic-1" 
				/> -->
				<h3 class="home-line"> Your One-Stop Shop for 
					<br> All Things Automotive </h3>
				<div class="buttons">
					<sec:authorize access="!isAuthenticated()">
        					<a type="button" class="btn btn-outline-light btn-1" href="registration">Register</a>
        					<a type="button" class="btn btn-outline-light btn-1" href="login">Log In</a>
      				</sec:authorize>

					<sec:authorize access="isAuthenticated()">

					<sec:authorize access="hasRole('User')">
            			<a type="button" class="btn btn-outline-light btn-1" href="cars">CARS</a>
        				<a type="button" class="btn btn-outline-light btn-1" href="profile">PROFILE</a>
        			</sec:authorize>

					<sec:authorize access="hasRole('Administrator')">
						<a type="button" class="btn btn-outline-light btn-1" href="cars">CARS</a>
						<a type="button" class="btn btn-outline-light btn-1" href="profile">PROFILE</a>
        			</sec:authorize>

					</sec:authorize>
				</div>
			</div>
	</section>
</body>
<footer>
	<jsp:include page="footer.jsp"></jsp:include>
</footer>
<style>
	body {
		background-color: #1c1c1d;
		display: block;
  		max-width: 100%;
  		height: auto;
  		background-repeat: none;
  		background-size: cover;
  		font-family: "Raleway", sans-serif;
  		font-optical-sizing: auto;
  		font-style: normal;
		font-weight: 200;
	}
	img {
  		display: block;
  		max-width: 100%;
  		height: auto;
	}
	.section-1 {
		background-image: url(https://i.pinimg.com/736x/3e/c9/16/3ec916c98be77f85462abfce883fb163.jpg);
		background-repeat: none;
    	background-size: cover;
		height: 100%;
	}
	.pic-1 {
		height: 30vw;
		width: 100%;
	}
	.home-line {
		font-size: 3.5vw;
		color:antiquewhite;
		padding-top: 14vw;
		margin-left: 8vw;
	}
	.btn-1 {
		font-size: 2vw;
		margin-top: 2vw;
		margin-left: 8vw;
		margin-bottom: 8vw;
	}
	.select-1 {
		color: #966F92;
		width: 100%;
		text-align: center;
	}
	@media only screen and (max-width: 767px) {

	.home-line {
		font-size: 8.5vw;
		text-align: center;
		padding-top: 35vw;
		margin-left: 0;
	}
	.buttons {
		text-align: center;
	}
	.btn-1 {
		font-size: 7vw;
		align-items: center;
		position: relative;
		margin-top: 10vw;
		margin-left: 3vw;
		margin-bottom: 10vw;
	}
	}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>