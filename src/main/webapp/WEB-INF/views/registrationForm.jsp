<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> Registration </title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css"/>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
</head>
<header>
	<jsp:include page="header.jsp"></jsp:include>
</header>
<body>
	<section>
		<br>
		<div class="container-lg col-sm-9 mt-3 box-1 d-flex">
			<div class="col-lg-7 align-items-center form-1">
			<div class="text-center">
        		<h4 class="heading-word" style="padding-top: 20px; font-family: Raleway, sans-serif;
  					font-optical-sizing: auto; font-style: normal; font-weight: 600;; color: #e4e4e4;"> 
        		REGISTER</h4>

				<c:if test="${success_register != null}">

				<div class="alert alert-success">${success_register} Click here to <a href="login">
				Sign In</a> </div>

				</c:if>
        	</div>
				<form:form action="register" method="post" modelAttribute="user">
					<form:hidden path="id"/>
					<div class="form-group">
						<label for="firstName"> First Name</label>
						<form:input path="firstName" class="form-control" required="true"
						placeholder="Enter your first name" />
					</div>
					
					<br>

					<div class="form-group">
						<label for="lastName"> Last Name</label>
						<form:input path="lastName" class="form-control" required="true"
						placeholder="Enter your last name" />
					</div>

					<br>

					<div class="form-group">
						<label for="email"> Email</label>
						<form:input path="userName" class="form-control" required="true"
						placeholder="Enter your email" type="email"/>
					</div>

					<br>
					
					<div class="form-group">
						<label for="phoneNumber"> Phone Number</label>
						<form:input path="phoneNumber" class="form-control" id="phoneNumber" required="true" />
					</div>
					
					<script>
	   					const phoneInputField = document.querySelector("#phoneNumber");
	   					const phoneInput = window.intlTelInput(phoneInputField, {
	     					utilsScript:
	       					"https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js",
	   					});
	 				</script>
					
					<br>

					<div class="form-group">
						<label for="password"> Password </label>
						<form:input path="password" type="password" class="form-control pwd" required="true" id="password" minlength="6"
              			maxlength="30" placeholder="Password must be 6 characters or more" name="password" />
					</div>

					<br>

					<div class="form-group">
						<label for="password"> Confirm Password </label>
						<input type="password" class="form-control pwd" required="true" name="repassword" id="repassword" onkeyup="check()"
						placeholder="Password confirmation" />
					</div>

					<br>

					<div id="message"> </div>

					<br>

					<input type="checkbox" onclick="toggleVisibility()" id="show"> Show Password

					<br>
					
					<div class="text-center mb-4">
						<input type="submit" value="Sign Up" class="btn" style="color: #e4e4e4; border: #e4e4e4 solid 1px;" />
						<p class="redirect mt-4"> <a href="login" style="text-decoration: none; color:#e4e4e4;
              				font-size: 12px;"> Have an account? Log in here. </a> </p>
					</div>

				</form:form>
			</div>
			
			<div>
				<img src="https://i.pinimg.com/564x/4e/1b/9c/4e1b9c620c547d980f011b695644c6f1.jpg" class="pic-1" 
				/>
			</div>
		</div>
	</section>
</body>
<style>
	body {
		background-color: #1c1c1d;
		font-family: "Raleway", sans-serif;
  		font-optical-sizing: auto;
  		font-style: normal;
		font-weight: 600;
		color: #e4e4e4;
	}
	img {
  		display: block;
  		max-width: 100%;
  		height: auto;
	}
	.box-1 {
		background-color: #2c2c2c;
		border-radius: 10px;
		border: 2px #e4e4e4 solid;
	}
	.pic-1 {
		height: 33vw;
		padding-left: 1vw;
		width: 83vw;
		height: 100%;
	}
	.heading-word {
		font-size: 5vw;
	}
	label {
		color: #e4e4e4;
	}
	.select-1 {
		color: #966F92;
		width: 100%;
		text-align: center;
	}
	@media only screen and (max-width: 992px) {
	
	.pic-1 {
		display: none;	
	}
	.heading-word {
		font-size: 12vw;
	}
	.form-1 {
		width: 100%;
	}
	
	}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
	var check = function() {
	  if (document.getElementById('password').value ==
	    document.getElementById('repassword').value) {
	    document.getElementById('message').style.color = 'rgb(87, 255, 87)';
	    document.getElementById('message').innerHTML = 'MATCHING';
	  } else {
	    document.getElementById('message').style.color = 'rgb(255, 96, 96)';
	    document.getElementById('message').innerHTML = 'NOT MATCHING';
        return false;
	  }
	}
</script>
<script>
	function matching(){

		if (document.getElementById('password').value !=
		  	document.getElementById('repassword').value) {
			alert("Passwords don't match. Try again.");
			return false;
		}
	}

</script>
<script>
	let passwords = document.querySelectorAll('.pwd');
	let toggle = document.querySelector('#show');

	toggle.addEventListener('click', function () {
		if (toggle.checked) {
			for (let password of passwords) {
				password.type = "text";
			}
		} else {
			for (let password of passwords) {
				password.type = 'password';
			}
		}
	});
</script>
</html>