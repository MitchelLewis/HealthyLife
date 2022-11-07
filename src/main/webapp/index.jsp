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
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="#">HOME</a></li>
					<%
						String userName = (String) session.getAttribute("name");
						 if(userName != null) {%>
 					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="dashboard">DASHBOARD</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="sign-out">SIGN OUT</a></li>
			 	    <% } else { %>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="sign-in">SIGN IN</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="sign-up">REGISTER</a></li>
					<% } %>
				</ul>
			</div>
		</div>
	</nav>
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<h1 class="masthead-heading mb-0">WELCOME TO HEALTHY LIFE</h1>
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<p class="pre-wrap masthead-subheading font-weight-light mb-0">A modern-day service to track, manage and make changes to your daily life!</p>
			<div class="col-lg-8 mr-auto mt-4 ml-auto text-center">
				<a
					class="btn btn-secondary text-white rounded text-large masthead-subheading"
					href="sign-up">SIGN UP NOW</a>
			</div>
		</div>
	</header>
	<section class="page-section" id="feature-1">
		<div class="container">
			<div class="text-center">
				<h2 class="page-section-heading text-secondary d-inline-block mb-0">NUTRITIONAL
					TRACKING</h2>
			</div>
			<div class="divider-custom	">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<div class="row">
				<div class="col-lg-8 mr-auto ml-auto">
					<p class="pre-wrap lead">Track all your nutrients such as calories, protein and sugar intake all in one place using Healthy Life. You can enter specific goals for each of these nutrients and check on your progress!</p>
				</div>
			</div>
		</div>
	</section>
	<section class="page-section bg-primary text-white mb-0" id="feature-2">
		<div class="container">
			<div class="text-center">
				<h2 class="page-section-heading d-inline-block mb-0">SLEEP
					TRACKING</h2>
			</div>
			<div class="divider-custom	">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<div class="row">
				<div class="col-lg-8 mr-auto ml-auto">
					<p class="pre-wrap lead">Track your sleep by entering how many hours you sleep in a night. You can enter specific goals for	tracking sleep and the Healthy Life service will recommend articles on how to better manage your sleep!</p>
				</div>
			</div>
		</div>
	</section>
	<section class="page-section" id="feature-3">
		<div class="container">
			<div class="text-center">
				<h2 class="page-section-heading text-secondary d-inline-block mb-0">PLUS,
					MANY MORE...</h2>
			</div>
			<div class="divider-custom	">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<div class="row">
				<div class="col-lg-8 mr-auto ml-auto">
					<p class="pre-wrap lead">Sign up to the Healthy Life service to create your profile, enter your goals and make progress toward them now!</p>
				</div>
			</div>
		</div>
	</section>
	<section class="page-section bg-primary text-white mb-0" id="about">
		<div class="container">
			<!-- About Section Heading-->
			<div class="text-center">
				<h2 class="page-section-heading d-inline-block text-white">ABOUT</h2>
			</div>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- About Section Content-->
			<div class="row">
				<div class="col-lg-4 ml-auto">
					<p class="pre-wrap lead">Healthy Life is a modern-day health tracking service where you can input your daily routines and nutritional information to gain insights into health changes.</p>
				</div>
				<div class="col-lg-4 mr-auto">
					<p class="pre-wrap lead">There is a range of different metrics to track against and you can define goals you want to meet and view your progress at any time.</p>
				</div>
			</div>
		</div>
	</section>
	<footer class="footer text-center">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 mb-5 mb-lg-0">
					<h4 class="mb-4">COOKIES</h4>
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