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
    <title>Cars</title>
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

<body style="background-color: #1c1c1d;">
	<div class="container mt-4">
		<div class="row p-3 mb-5 border">
			<div class="col-9">
					<h3 style="color: #e4e4e4;"> <i> EXPLORE OUR VEHICLES </i> </h3>
			</div>
		</div>

		<!-- Modal -->

		<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true"
						role="dialog">
						<div class="modal-dialog">
							<div class="modal-content" style="background-color: #363636; color: #e4e4e4;">

								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Sell Your
										Car Today!</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<c:if test="${success_post != null}">
										<div class="alert alert-success">${success_post}</div>
									</c:if>

									<!-- Car Post Form -->
									<sf:form action="car_post" method="post" class="was-validated"
										modelAttribute="car" enctype="multipart/form-data">
										<div class="mb-3 mt-3">
											<label for="name" class="d-flex form-label">Name:</label>
											<sf:input type="text" class="form-control"
												placeholder="Enter car name" name="name" path="name"
												required="true" />
											<div class="valid-feedback">Valid.</div>
											<div class="invalid-feedback">Please fill out this
												field.</div>
										</div>
										<div class="mb-3">
											<label for="model" class="d-flex form-label">Model:</label>
											<sf:input type="text" class="form-control"
												placeholder="Enter model" name="model" path="model"
												required="true" />
											<div class="valid-feedback">Valid.</div>
											<div class="invalid-feedback">Please fill out this
												field.</div>
										</div>
										<div class="mb-3">
											<label for="price" class="d-flex form-label">Price
												(₱):</label>
											<sf:input type="text" class="form-control" id="price"
												placeholder="Enter car price" name="price" path="price"
												required="true" />
											<div class="valid-feedback">Valid.</div>
											<div class="invalid-feedback">Please fill out this
												field.</div>
										</div>
										<div class="mb-3">
											<label for="make" class="d-flex form-label">Make
												Year:</label>
											<sf:input type="text" class="form-control"
												placeholder="Enter make year" name="make" path="make"
												required="true" />
											<div class="valid-feedback">Valid.</div>
											<div class="invalid-feedback">Please fill out this
												field.</div>
										</div>
										<div class="mb-3">
											<label for="registeration" class="d-flex form-label">Registration
												Date:</label>
											<sf:input type="text" class="form-control" id="registeration"
												placeholder="Enter registeration date" name="registeration"
												path="registeration" required="true" />
											<div class="valid-feedback">Valid.</div>
											<div class="invalid-feedback">Please fill out this
												field.</div>
										</div>
										<div class="mb-3">
											<label class="d-flex form-label">Photo:</label> <input
												type="file" class="form-control" name="fileImage" id="photo"
												accept="image/png, image/jpeg" required="true" />
											<div class="valid-feedback">Valid.</div>
											<div class="invalid-feedback">Please fill out this
												field.</div>
										</div>

										<div class="holder"
											style="height: 300px; width: 300px; margin: auto;">
											<img id="imgPreview" src="#" alt="image preview"
												style="width: inherit;" />
										</div>

										<div class="d-flex justify-content-center">
										<button type="submit" class="btn btn-outline-light">Post</button>
										</div>
									</sf:form>
									<script>
						            $(document).ready(() => {
						            	
						                $("#photo").change(function () {
						                    const file = this.files[0];
						                    if (file) {
						                        let reader = new FileReader();
						                        reader.onload = function (event) {
						                            $("#imgPreview")
						                              .attr("src", event.target.result);
						                        };
						                        reader.readAsDataURL(file);
						                    }
						                });
						            });
						        </script>
									<!-- Car Post Form -->
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Close</button>

								</div>
							</div>
						</div>

					</div>

		<!-- list of all cars posted -->
		<div class="row" style="gap: 60px;">
			<c:forEach items="${cars}" var="c">
				<c:set var="id" value="${c.id}"></c:set>
				<c:if test="${success_post == null}">

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

				</c:if>
			</c:forEach>
			<c:if test="${success_post != null}">
				<div class="alert alert-success">${success_post}
					Click here to <a href="/car_detail?cid=${id}" style="color: #106b27;">View</a> your car
					post
				</div>
			</c:if>
		</div>

		<sec:authorize access="hasRole('User')">
			<!-- post car link-->
				<div class="col col-lg-2 add-car" style="text-align: end; margin: auto;">
					<span class="p-2"> <!-- Button trigger modal -->
						<button type="button" class="btn" data-bs-toggle="modal"
							data-bs-target="#exampleModal" style="background-color:#2c2c2c; color: #e4e4e4;">
							<b> Sell Your Car Now! </b></button>
					</span>
				</div>
		</sec:authorize>
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
	img{
  		display: block;
  		max-width: 100%;
  		height: auto;
	}
	.add-car {
		position: fixed; 
		top: 6vw; 
		right: 1vw;
	}
	@media only screen and (max-width: 992px) {

		.add-car {
		position: fixed; 
		top: 13vw; 
		right: 0.5vw;
		}

	}
</style>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<footer>
	<%@ include file="footer.jsp"%>
</footer>
</html>