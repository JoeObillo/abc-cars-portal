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
    <title>Users Management</title>
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
	<div class="container">
		<div class="row p-3 mb-5 border">
			<div class="col-9">
				<h3 style="color: #e4e4e4;"> <i> USERS MANAGEMENT </i> </h3>
			</div>
		</div>

		<div class="row">
			<div class="col-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col" style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">#</th>
							<th scope="col" style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">First Name</th>
							<th scope="col" style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">Last Name</th>
							<th scope="col" style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">Username</th>
							<th scope="col" style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">Email</th>
							<th scope="col" style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">Role</th>
							<th scope="col" style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${user}" var="u" varStatus="status">
							<tr>
								<th scope="row" style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">${status.count}</th>
								<td style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">${u.firstName}</td>
								<td style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">${u.lastName}</td>
								<td style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">${u.userName}</td>
								<td style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">${u.phoneNumber}</td>
								<c:forEach items="${u.roles}" var="r">
									<td style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">${r.name}<!-- Button trigger modal -->
										<button type="button" class="btn" style="color: #e4e4e4;" data-bs-toggle="modal"
											data-bs-target="#exampleModal1${status.index}">
											<i class="fas fa-edit fa-sm"></i>
										</button> <!-- Modal -->

										<div class="modal fade" id="exampleModal1${status.index}"
											tabindex="-1" aria-labelledby="exampleModalLabel"
											aria-hidden="true" role="dialog">
											<div class="modal-dialog">
												<div class="modal-content" style="background-color: #363636; color: #e4e4e4;">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModal1Label">Assign as Admin</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">

														<!-- Assign Admin Form -->
														<sf:form action="/assign_role?uid=${u.id}" method="post"
															class="was-validated" modelAttribute="user">
															<div class="mb-3 mt-3">
																<label for="name" class="form-label">Role:</label> <input
																	type="text" class="form-control"
																	placeholder="Enter role" name="name" value="${r.name}"
																	required="true" />
																<div class="valid-feedback">Valid.</div>
																<div class="invalid-feedback">Please fill out this
																	field.</div>
															</div>
															
															<button type="submit" class="btn btn-success">Assign</button>
														</sf:form>
													</div>
												</div>
											</div>
										</div>
									</td>
								</c:forEach>


								<td style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;"><a type="button" class="btn"
									style="color: #e4e4e4;" href="/view?uid=${u.id}"> <i class="far fa-eye"></i>
								</a> <!-- Button trigger modal -->
									<button type="button" class="btn" style="color: #e4e4e4;"
										data-bs-toggle="modal"
										data-bs-target="#exampleModal${status.index}">
										<i class="fas fa-edit"></i>
									</button> <!-- Modal -->

									<div class="modal fade" id="exampleModal${status.index}"
										tabindex="-1" aria-labelledby="exampleModalLabel"
										aria-hidden="true" role="dialog">
										<div class="modal-dialog">
											<div class="modal-content" style="background-color: #363636; color: #e4e4e4;">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Edit
														User</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">

													<!-- User Update Form -->
													<sf:form action="/edit?uid=${u.id}" method="post"
														class="was-validated" modelAttribute="user">
														<div class="mb-3 mt-3">
															<label for="firstName" class="form-label">First Name:</label> <input
																type="text" class="form-control"
																placeholder="Enter name" name="firstName" value="${u.firstName}"
																required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>

														<div class="mb-3 mt-3">
															<label for="lastName" class="form-label">Last Name:</label> <input
																type="text" class="form-control"
																placeholder="Enter last name" name="lastName" value="${u.lastName}"
																required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>
														
														<div class="mb-3">
															<label for="email" class="form-label">Email:</label> <input
																type="email" class="form-control"
																placeholder="Enter email" name="userName"
																value="${u.userName}" required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>
														<div class="mb-3">
															<label for="mobile" class="form-label">Phone Number:</label> <input
																type="text" class="form-control" id="mobile"
																placeholder="Enter phone number" name="phoneNumber"
																value="${u.phoneNumber}" required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>

														<button type="submit" class="btn btn-success">Edit</button>
													</sf:form>
													<!-- User Update Form -->
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">Close</button>

												</div>
											</div>
										</div>

									</div> <a type="button" class="btn" style="color: #e4e4e4;"
									href="/delete?uid=${u.id}"> <i class="far fa-trash-alt"></i>
								</a></td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
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
	@media only screen and (max-width: 992px) {
		.row {
			overflow-x:scroll;
		}
	}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>