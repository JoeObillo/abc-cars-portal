<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${u.firstName}</title>
<!--  Enable Bootstrap -->
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
	<section> 
		<c:forEach items="${user}" var="u">
		<c:set var="id" value="${u.id}"></c:set>
		<c:set var="firstName" value="${u.firstName}"></c:set>
		<c:set var="lastName" value="${u.lastName}"></c:set>
        <!-- email as username -->
		<c:set var="userName" value="${u.userName}"></c:set>
		<c:set var="phoneNumber" value="${u.phoneNumber}"></c:set>
	</c:forEach>
	<div class="container">
	<div class="row p-3 mb-5 border">
		<div class="col-9">
			<h3 style="color: #e4e4e4;"> <i> PROFILE </i> </h3>
		</div>
	</div>
	</div>
	<div class="container d-flex align-items-center justify-content-center">

		<div>

			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content" style="background-color: #363636; color: #e4e4e4;">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Edit Profile</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">

							<!-- User Update Form -->
							<sf:form action="update" method="post" class="was-validated"
								modelAttribute="user">
								<div class="mb-3 mt-3">
									<label for="firstName" class="form-label">First Name:</label> <input
										type="text" class="form-control" placeholder="Enter first name"
										name="firstName" path="firstName" value="${firstName}" required="true" />
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">Please fill out this field.</div>
								</div>
								<div class="mb-3 mt-3">
									<label for="lastName" class="form-label">Last Name:</label> <input
										type="text" class="form-control" placeholder="Enter last name"
										name="lastName" path="lastName" value="${lastName}" required="true" />
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">Please fill out this field.</div>
								</div>
								<div class="mb-3">
									<label for="userName" class="form-label">Email:</label> <input
										type="email" class="form-control" id="userName"
										placeholder="Enter username" name="userName" path="userName"
										value="${userName}" required="true" />
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">Please fill out this field.</div>
								</div>
								<div class="mb-3">
									<label for="mobile" class="form-label">Phone Number:</label> <input
										type="text" class="form-control" id="mobile"
										placeholder="Enter your number" name="phoneNumber" path="phoneNumber"
										value="${phoneNumber}" required="true" />
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">Please fill out this field.</div>
								</div>

								<button type="submit" class="btn btn-success">Update</button>
							</sf:form>
							<!-- User Update Form -->
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>

						</div>
					</div>
				</div>

			</div>

		</div>

		<div class="card bg-dark border border-white mb-2" style="width: 500px; color: #e4e4e4;">
			<div class="card-body text-center" style="height: 284px;">
				<img src="/images/imagesimg_avatar1.jpg" alt="avatar"
					class="rounded-circle img-fluid border border-white" style="width: 250px;">
			</div>
			<hr style="color: white;">
			<div class="card-body">
				<h4 class="card-title">${firstName} ${lastName}</h4>
				<hr>
				<p> Email: ${userName}</p>
				<hr>
				<p> Phone Number: ${phoneNumber}</p>
				<hr>
				<button type="button" class="btn btn-outline-light text-center" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					Edit Profile
				</button>
			</div>
		</div>
	</div>
	</section>
</body>
<footer>
	<%@ include file="footer.jsp"%>
</footer>
<style>
	body {
		background-color: #1c1c1d;
		font-family: "Raleway", sans-serif;
  		font-optical-sizing: auto;
  		font-style: normal;
		font-weight: 500;
	}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>