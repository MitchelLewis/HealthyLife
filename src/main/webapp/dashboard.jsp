<%@page import="java.util.ArrayList"%>
<%@page import="models.Goal"%>

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
						class="nav-link py-3 px-0 px-lg-3 rounded" href="/healthy-life">HOME</a></li>
						<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="dashboard">DASHBOARD</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="sign-out">SIGN
							OUT</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<h1 class="masthead-heading mb-0">DASHBOARD</h1>
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
				<h2 class="page-section-heading text-secondary d-inline-block mb-0">
					WELCOME,
					<%=session.getAttribute("name")%></h2>
				<h3 class="mt-2">Let's see how you are getting on!</h3>
			</div>
				<div class="container">
				<div class="row mt-4 mb-4 d-flex justify-content-center">
				<%
				ArrayList<Goal> goals = (ArrayList<Goal>) session.getAttribute("goals");
				for (Goal goal : goals) {
				%>
				
					<div class="bg-secondary text-white rounded p-3 col-lg-3 mb-3 mt-3 mr-3 ml-3">
						<h4 class="text-center">
							Goal:
							<%=goal.getGoalName()%> per day</h4>
						<div class="progress">
							<div class="progress-bar" role="progressbar" style="width: <%=((double) goal.getCurrentProgress() / goal.getTarget()) * 100 %>%" aria-valuenow="<%=goal.getCurrentProgress()%>"
								aria-valuemin="0" aria-valuemax="<%=goal.getTarget()%>"></div>
						</div>
						<p class="large-text mt-2">
							Progress:
							<%=goal.getCurrentProgress()%>
							<%=goal.getGoalUnit()%></p>
						<p class="large-text">
							Target:
							<%=goal.getTarget()%>
							<%=goal.getGoalUnit()%>
						<button class="btn btn-primary mt-2 mb-4" aria-label="Update progress for <%= goal.getGoalName() %>">
							Update progress
						</button>
						<button class="btn btn-primary" aria-label="Update goals for <%= goal.getGoalName() %>">
							Update goal
						</button>
					</div>
				
				<%
				}
				%>
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
		</div>
	</footer>
</body>
</html>