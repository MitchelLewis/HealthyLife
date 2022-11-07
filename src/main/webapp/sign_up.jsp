<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Healthy Life</title>
<!-- Font Awesome icons (free version)-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
	crossorigin="anonymous"></script>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet">
<script src="validate-registration-form.js"></script>
<!-- Fonts CSS-->
<link rel="stylesheet" href="css/heading.css">
<link rel="stylesheet" href="css/body.css">
</head>
<body id="page-top">
	<nav class="navbar navbar-expand-lg bg-secondary fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top">HEALTHY
				LIFE</a>
			<button
				class="navbar-toggler navbar-toggler-right font-weight-bold bg-primary text-white rounded"
				type="button" data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded"
						href="home">HOME</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded"
						href="sign-in">SIGN IN</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded"
						href="sign-up">REGISTER</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<h1 class="masthead-heading mb-0">REGISTER FOR AN ACCOUNT</h1>
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
		</div>
	</header>
	<section class="page-section" id="feature-1">
		<div class="container">
			<div class="text-center">
				<h2 class="page-section-heading text-secondary d-inline-block mb-0">ENTER YOUR DETAILS</h2>
			</div>
			<div class="divider-custom	">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<div class="row">
				<div class="col-lg-8 mr-auto ml-auto" id="input-col">
				<%ArrayList<String> errors = 
            (ArrayList<String>)request.getAttribute("errors");
			if(!errors.isEmpty()) {%>
			<div class="alert alert-danger" role="alert">
				<ul>
					<%
			for(String error: errors){%>
					<li><%=error%></li>
					<%}%>
				</ul>
			</div>
			<%}%>

			<form method="POST" action="sign-up" id="sign-up-form">
				<!-- 2 column grid layout with text inputs for the first and last names -->
				<div class="row mb-4">
					<div class="col">
						<div class="form-group">
							<label class="form-label" for="first-name">First name</label> <input
								type="text" id="first-name" class="form-control"
								name="first-name" required/>

						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label class="form-label" for="surname">Last name</label> <input
								type="text" id="surname" class="form-control" name="surname" required/>

						</div>
					</div>
				</div>

						<!-- Email input -->
						<div class="form-group mb-4">
					<label class="form-label" for="email">Email address</label> <input
						type="email" id="email" class="form-control" name="email" required/>
				</div>

				<!-- Password input -->
				<div class="form-group mb-4">
					<label class="form-label" for="password">Password</label> <input
						type="password" id="password" id="password" class="form-control"
						name="password" required />

				</div>

				<!-- Submit button -->
				<button type="submit" class="btn btn-success btn-block mb-4">Sign
					up</button>


			</form>
				</div>
			</div>
		</div>
	</section>
<footer class="footer text-center">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 mb-5 mb-lg-0">
					<h4 class="mb-2">COOKIES</h4>
					<p class="mb-0 mr-auto ml-auto">
						<a href="cookies">View our cookie policy</a>
					</p>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-lg-12 mb-5 mb-lg-0">
					<h4 class="mb-2">CREDITS</h4>
					<p class="mb-0 mr-auto ml-auto">
						Thanks to David Miller for the Bootstrap Template (Freelancer)
					</p>
				</div>
			</div>
		</div>
	</footer>
	<script>
		document.getElementById('sign-up-form').addEventListener('submit', function(e) {validateRegistrationFormData(e)});
	</script>
			<!-- Bootstrap core JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<!-- Third party plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
</body>
</html>