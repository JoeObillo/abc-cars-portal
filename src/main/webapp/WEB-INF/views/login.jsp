<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
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

<body class="bg-gray-100 h-screen flex items-center justify-center">

    <section>
		<br>
		<div class="container-lg col-sm-8 mt-3 box-1 d-flex">
			<div class="col-lg-7 align-items-center form-1">
			<div class="text-center">
        		<h4 class="heading-word" style="padding-top: 20px; font-family: 'Montserrat Alternates', sans-serif;
  				font-weight: 600; color: #e4e4e4;"> 
        		LOGIN</h4>
        
                <c:if test="${error_string != null}">
                    <p class="text-red-500 mb-4" style="color: rgb(255, 41, 41);">${error_string}</p>
                </c:if>
        	</div>
				<form action="/login" method="post">

					<div class="form-group">
						<label for="username"> Email </label>
						<input id="username" type="email" class="form-control" required="true" name="username"
						placeholder="Enter your correct email.">
					</div>
					
					<br>
					
                    <div class="form-group">
						<label for="password"> Password</label>
						<input id="password" class="form-control pwd" required="true" name="password" minlength="6" type="password"
              			maxlength="30" placeholder="Enter your password.">
					</div>

					<br>

					<input type="checkbox" onclick="toggleVisibility()" id="show"> Show Password

                    <br>
					
					<div class="text-center mb-4">
						<input type="submit" value="Login" name="Login" class="btn" style="color: #e4e4e4; border: #e4e4e4 solid 1px;">
						<p class="redirect mt-4"> <a href="registration" style="text-decoration: 
              				none; color: #e4e4e4; font-size: 12px;"> Don't have an account? Register here. </a> </p>
					</div>

				</form>
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