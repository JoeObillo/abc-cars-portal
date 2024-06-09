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
    <title>Car Management</title>
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
				<h3 style="color: #e4e4e4;"> <i> CAR MANAGEMENT </i> </h3>
			</div>
		</div>

		<div class="row">
			<div class="col-15">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col" style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">#</th>
							<th scope="col" style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">Name</th>
							<th scope="col" style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">Model</th>
							<th scope="col" style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">Price (₱)</th>
							<th scope="col" style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">Action</th>
							<th scope="col" style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">Status</th>
							<th scope="col" style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">Current Bid (₱)</th>
							<th scope="col" style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">Booking Date</th>
							<sec:authorize access="hasRole('Administrator')">
							<th scope="col" style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">Booking Status</th>
							</sec:authorize>
							<th scope="col" style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">Bidder</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cars}" var="c" varStatus="status">
							<tr>
								<th scope="row" style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">${status.count}</th>
								<td style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">${c.name}</td>
								<td style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">${c.model}</td>
								<td style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">${c.price}</td>
								<td style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;"><a type="button" class="btn"
									href="/car_detail?cid=${c.id}" style="color: #e4e4e4;"> <i class="far fa-eye"></i>
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
														Car Post</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">

													<!-- Car Post Form -->
													<sf:form action="/edit_car?cid=${c.id}" method="post"
														class="was-validated" modelAttribute="car"
														enctype="multipart/form-data">
														<div class="mb-3 mt-3">
															<label for="name" class="d-flex form-label">Name:</label>
															<input type="text" class="form-control"
																placeholder="Enter car name" name="name" path="name"
																required="true" value="${c.name}" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>
														<div class="mb-3">
															<label for="model" class="d-flex form-label">Model:</label>
															<input type="text" class="form-control"
																placeholder="Enter model" name="model" path="model"
																value="${c.model}" required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>
														<div class="mb-3">
															<label for="price" class="d-flex form-label">Price
																(₱):</label> <input type="text" class="form-control" id="price"
																placeholder="Enter car price" name="price" path="price"
																value="${c.price}" required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>
														<div class="mb-3">
															<label for="make" class="d-flex form-label">Make
																Year:</label> <input type="text" class="form-control"
																placeholder="Enter make year" name="make" path="make"
																value="${c.make}" required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>
														<div class="mb-3">
															<label for="registeration" class="d-flex form-label">Registration
																Date:</label> <input type="text" class="form-control"
																id="registeration"
																placeholder="Enter registeration date"
																name="registeration" path="registeration"
																value="${c.registeration}" required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>

														<input type="hidden" name="sellerId" value="${c.sellerId}" />
														<input type="hidden" name="photos" value="${c.photos}" />
														<input type="hidden" name="photoImagePath"
															value="${c.photoImagePath}" />

														<div class="holder"
															style="height: 300px; width: 300px; margin: auto;">
															<img id="imgPreview" src="${c.photoImagePath}"
																alt="image preview" style="width: inherit;" />
														</div>

														<button type="submit" class="btn btn-success d-flex">Edit</button>
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

									</div> <a type="button" class="btn" style="color: #ff3232;"
									href="/delete_car?cid=${c.id}"> <i class="far fa-trash-alt"></i>
								</a></td>


								<!-- selling modal -->
								<td style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;"><!-- Button trigger modal -->
									<button type="button" class="btn" data-bs-toggle="modal" style="color: #e4e4e4;"
										data-bs-target="#exampleModal2${status.index}">
										<i class="fas fa-edit fa-sm"></i>
									</button> 
									${c.sellStatus}
									<!-- Modal -->

									<div class="modal fade" id="exampleModal2${status.index}"
										tabindex="-1" aria-labelledby="exampleModalLabel"
										aria-hidden="true" role="dialog">
										<div class="modal-dialog">
											<div class="modal-content" style="background-color: #363636; color: #e4e4e4;">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModal2Label">Set
														Car Sale Status</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">

													<!-- Sale Status Form -->
													<sf:form action="/sale_status?cid=${c.id}" method="post"
														class="was-validated" modelAttribute="biddings">
														<div class="mb-3 mt-3">
															<label for="sellStatus" class="form-label">Sale
																Status:</label> <input type="text" class="form-control"
																placeholder="Enter sale status" name="sellStatus"
																value="${c.sellStatus}" required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>

														<button type="submit" class="btn btn-success">Set</button>
													</sf:form>
												</div>
											</div>
										</div>
									</div>

								</td>
								<!-- selling modal -->
								<c:forEach items="${c.biddings}" var="b" begin="0" end="0">

									<td style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">${b.bidderPrice}</td>
									<td style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">${b.bookDate}</td>
									<!-- booking modal -->
									<td style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;"><!-- Button trigger modal -->
										<button type="button" class="btn" data-bs-toggle="modal"
											data-bs-target="#exampleModal1${status.index}" style="color: #e4e4e4;">
											<i class="fas fa-edit fa-sm"></i>
										</button>
										${b.bookStatus}
										<!-- Modal -->

										<div class="modal fade" id="exampleModal1${status.index}"
											tabindex="-1" aria-labelledby="exampleModalLabel"
											aria-hidden="true" role="dialog">
											<div class="modal-dialog">
												<div class="modal-content" style="background-color: #363636; color: #e4e4e4;">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModal1Label">Set
															Booking Status</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">

														<!-- Booking Status Form -->
														<sf:form action="/booking_status?bid=${b.id}"
															method="post" class="was-validated" modelAttribute="book">
															<div class="mb-3 mt-3">
																<label for="bookStatus" class="form-label">Booking
																	Status:</label> <input type="text" class="form-control"
																	placeholder="Enter booking status" name="bookStatus"
																	value="${b.bookStatus}" required="true" />
																<div class="valid-feedback">Valid.</div>
																<div class="invalid-feedback">Please fill out this
																	field.</div>
															</div>

															<button type="submit" class="btn btn-success">Set</button>
														</sf:form>
													</div>
												</div>
											</div>
										</div> <!-- booking modal -->
									</td>
									<td style="background-color: #2c2c2c; border: #e4e4e4 solid 1px; color:#e4e4e4;">${b.bidderName}</td>

								</c:forEach>

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