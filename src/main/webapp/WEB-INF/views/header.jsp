<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat+Alternates:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
<title>Insert title here</title>
</head>
<header>
	<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #06050A ;">
		<div class="container-lg">
  			<a class="navbar-brand" href="home">ABC Cars Portal</a>
  			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" 
  			aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    			<span class="navbar-toggler-icon"></span>
  			</button>

			<sec:authorize access="hasAnyRole('Administrator','User')">
				<div class="navbar-nav px-5 search-1" style="width: 50%;">
					<sf:form action="search" method="get" style="width: 100%;" class="form-inline">
						<div class="input-group">
							<input type="search" class="form-control" style="padding-right: 2vw;"
								placeholder="e.g. model, price, make" aria-label="Search" name="keyword"
								aria-describedby="search-addon" />
							<button type="submit" class="btn btn-outline-light fas fa-search"></button>
						</div>
					</sf:form>
				</div>
			</sec:authorize>
  			
  			<div class="collapse navbar-collapse" id="navbarNav">
  				<hr>
    			<ul class="navbar-nav ms-auto">

					<sec:authorize access="hasAnyRole('Administrator','User')">
						<div class="navbar-nav px-5 search-2" style="width: 100%;">
						<sf:form action="search" method="get" style="width: 100%;" class="form-inline">
							<div class="input-group">
								<input type="search" class="form-control"
								placeholder="e.g. model, price, make" aria-label="Search" name="keyword"
								aria-describedby="search-addon" />
								<button type="submit" class="btn btn-outline-light fas fa-search"></button>
							</div>
						</sf:form>
						</div>
					</sec:authorize>

					<sec:authorize access="!isAuthenticated()">
						<li class="nav-item">
        					<a class="nav-link" href="registration">REGISTER.</a>
      					</li>
						<li class="nav-item">
        					<a class="nav-link" href="login">LOGIN.</a>
      					</li>
      				</sec:authorize>

					<sec:authorize access="isAuthenticated()">

					<sec:authorize access="hasRole('User')">
						<li class="nav-item">
        					<a class="nav-link" href="cars">CARS.</a>
      					</li>
						<li class="nav-item">
        					<a class="nav-link" href="profile">PROFILE.</a>
      					</li>
        			</sec:authorize>

					<sec:authorize access="hasRole('Administrator')">
						<li class="nav-item">
        					<a class="nav-link" href="cars">CARS.</a>
      					</li>
						<li class="nav-item">
        					<a class="nav-link" href="all_cars">MANAGE CARS.</a>
      					</li>
						<li class="nav-item">
        					<a class="nav-link" href="users">MANAGE USERS.</a>
      					</li>
						<li class="nav-item">
        					<a class="nav-link" href="profile">PROFILE.</a>
      					</li>
        			</sec:authorize>

					<li class="nav-item">
					<form action="logout" method="post" class="mt-8">
        				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        				<input type="submit" name="Logout" value="LOGOUT" class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600">
    				</form>
					</li>

					</sec:authorize>
    			</ul>
    		</div>
		</div>
	</nav>
</header>
<style>
	button, input[type="submit"], input[type="reset"] {
		background: none;
		color: inherit;
		border: none;
		padding: 0;
		font: inherit;
		cursor: pointer;
		outline: inherit;
	}

	.search-2 {
		display: none;
	}
	@media only screen and (max-width: 992px) {
	
	.search-1 {
		display: none;	
	}
	.search-2 {
		display: block;
	}
	
	}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>