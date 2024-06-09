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
    <title>${name}</title>
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
	<c:forEach items="${car}" var="c">
		<c:set var="id" value="${c.id}"></c:set>
		<c:set var="name" value="${c.name}"></c:set>
		<c:set var="image" value="${c.photoImagePath}"></c:set>
		<c:set var="make" value="${c.make}"></c:set>
		<c:set var="model" value="${c.model}"></c:set>
		<c:set var="registeration" value="${c.registeration}"></c:set>
		<c:set var="price" value="${c.price}"></c:set>
		<c:set var="sellStatus" value="${c.sellStatus}"></c:set>
	</c:forEach>


		<div class="card mb-5 container mb-5 mt-5 col-md-8" style="background-color: #2c2c2c; color: #e4e4e4;">
			<div class="">
				<div>
					
					<div class="d-flex flex-column justify-content-center">
						<div class="main_image mt-5">
							<hr>
							<img src="${image}" id="main_product_image" width="100%" class="border-white border">
						</div>
					</div>
					<hr>
				</div>
				<div>
					<div class="align-items-center">
						<div class="d-flex justify-content-center mt-2">
							<h3>${name}</h3>

						</div>
						<div class="mx-4 mt-4 content">


							<div class="d-flex justify-content-center">
								<div style="width: 150px;">
									<span class="fw-bold">Condition</span>
									<p style="font-size: 18px;">
										Used
									</p>
								</div>

								<div style="width: 150px;">
									<span class="fw-bold">Make</span>
									<p style="font-size: 18px;">
										${make}
									</p>
								</div>

								<div style="width: 150px;">
									<span class="fw-bold">Model</span>
									<p style="font-size: 18px;">
										${model}
									</p>
								</div>

								<div style="width: 150px;">
									<span class="fw-bold">Registration Date</span>
									<p style="font-size: 18px;">
										${registeration}
									</p>
								</div>
							</div>

						</div>

						<c:if test="${sellStatus == 'sold'}">
							<h3 style="text-align: center; color: rgb(49, 235, 49);">Car Sold!</h3>
						</c:if>
						<c:if test="${sellStatus == 'deactivated'}">
							<h3 style="text-align: center; color: rgb(231, 56, 56);">Post Deactivated!</h3>
						</c:if>
						
						<c:if test="${sellStatus != 'sold' }">
						<c:if test="${sellStatus != 'deactivated' }">

						<div class="d-flex mx-4 mt-3 justify-content-center">
						<div>
							<span class="fw-bold">Current Price</span>
							<h3>₱ ${price}</h3>
						</div>

						<div style="padding-left: 14vw;">
							<span class="fw-bold">Current Bid</span>
							<c:if test="${empty highest}">
								<h3>₱ 0</h3>
							</c:if>
							<c:if test="${not empty highest}">
								<h3>₱ ${highest}</h3>
							</c:if>

						</div>
						</div>
						<sec:authorize access="hasRole('User')">
						<div class="buttons d-flex flex-row mt-5 gap-3 mb-3 justify-content-center">
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-outline-light mb-2"
								data-bs-toggle="modal" data-bs-target="#exampleModal1"
								style="width: 500px;">Book for Test Drive</button>

							<!-- Modal -->
							<div class="modal fade" id="exampleModal1" tabindex="-1"
								aria-labelledby="exampleModal1Label" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content" style="background-color: #363636; color: #e4e4e4;">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModal1Label">Book for
												Test Drive</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">

											<!-- Book Form -->
											<sf:form action="book" method="post" class="was-validated"
												modelAttribute="booking">
												<div class="mb-3 mt-3">
													<label for="bookDate" class="form-label">Booking
														Date:</label> <input type="date" class="form-control"
														name="bookDate" required="true" />
													<div class="valid-feedback">Valid.</div>
													<div class="invalid-feedback">Please fill out this
														field.</div>
												</div>

												<input type="hidden" name="cid" value="${id}">

												<button type="submit" class="btn btn-success"
													style="width: auto;">Book on this Date</button>
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
							<!-- Modal -->

							<!-- Button trigger modal -->
							<button type="button" class="btn btn-outline-light" data-bs-toggle="modal"
								data-bs-target="#exampleModal">Bid</button>

							<!-- Modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content" style="background-color: #363636; color: #e4e4e4;">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Car
												Bidding</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">

											<!-- Bid Form -->
											<sf:form action="bid" method="post" class="was-validated"
												modelAttribute="bidding">
												<div class="mb-3 mt-3">
													<label for="name" class="form-label">Bid Price(₱):</label> 
													<input type="text" class="form-control"
														placeholder="Enter bidding price" name="bidderPrice"
														required="true" />
													<div class="valid-feedback">Valid.</div>
													<div class="invalid-feedback">Please fill out this
														field.</div>
												</div>

												<input type="hidden" name="cid" value="${id}">

												<button type="submit" class="btn btn-success">Bid
													at this price</button>
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
						</sec:authorize>
						</c:if>
						</c:if>
						<!-- end of button options -->
					</div>
				</div>
			</div>
	</div>

	<div class="mb-5 container mb-5 mt-5" style="background-color: #1c1c1d; color: #e4e4e4;">
		<!--list of car bidder -->
		<c:if test="${not empty bid}">
			<div class="row">
				<div class="col-md-6 box table-box">
				<div class="table-row default">
	                    <div class="table-cell">
	                        <p>Name</p>
	                    </div>
	                    <div class="table-cell">
	                        <p>Bidding Price (₱)</p>
	                    </div>
	                    <div class="table-cell">
	                        <p>Bidding Date</p>
	                    </div>
						<div class="table-cell">
	                        <p>Test Drive Book Date</p>
	                    </div>
	            </div>
				
					<c:forEach var="b" items="${bid}">
						<div class="table-row">
		                    <div class="table-cell">
		                        <p>${b.bidderName}</p>
		                    </div>
		                    <div class="table-cell">
		                        <p>${b.bidDate}</p>
		                    </div>
		                    <div class="table-cell">
		                        <p>${b.bidderPrice}</p>
		                    </div>
							<div class="table-cell">
		                        <p>${b.bookDate}</p>
		                    </div>
		                </div>
					</c:forEach>
			</div>
			</div>
		</c:if>

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
	.box {
  		height: auto !important; /* Allow boxes to adjust their height based on content */
  		width: 257px !important; /* Minimum width for each box */
  		background: #2c2c2c;
  		position: relative !important;
	}
	.table-box .default{
  		background: #e4e4e4;
	}
	.table-box .default p{
  		color: #1c1c1d;
	}
	.table-box{
  		height: auto !important;
  		margin-top: 50px !important;
  		margin-bottom: 50px !important;
  		width: 100% !important;
  		max-width: 100% !important;
  		background: #1c1c1d;
  		overflow-y: auto !important;
	}
	.table-box h2{
  		text-align: center !important;
  		margin-top: 20px !important;
  		margin-bottom: 20px !important;
  		font-weight: 500 !important;
	}
	.table-box .t{
  		font-size: 1rem !important;
  		font-weight: 300 !important;
  		text-align: center !important;
	}
	.table-row{
  		display: flex !important;
  		width: 100% !important;
  		border-right: 1px solid #e4e4e4 !important;
  		border-left: 1px solid #e4e4e4 !important; 
	}
	.table-cell{
  		display: table-cell !important;
  		width: 50% !important;
  		text-align: center !important;
  		vertical-align: middle !important;
  		border: 1px solid #e4e4e4 !important;
 	}
	.table-cell span{
  		margin-top: 10px !important;
	}
</style>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<footer>
	<%@ include file="footer.jsp"%>
</footer>
</html>