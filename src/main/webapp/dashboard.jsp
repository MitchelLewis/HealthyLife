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
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="home">HOME</a></li>
						<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="dashboard">DASHBOARD</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="sign-out">SIGN
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
				
					<div class="bg-secondary text-white rounded p-3 col-lg-4 mb-3 mt-3 mr-3 ml-3">
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
							<%=goal.getGoalUnit()%></p>
						<div class="row container">
						<a href="update-progress" class="btn btn-primary mt-2 mb-4" aria-label="Update progress for <%= goal.getGoalName() %>">
							Update progress
						</a>
						</div>
						<div class="row container">
						<a class="btn btn-primary" aria-label="Update goals for <%= goal.getGoalName() %>"  href="update-goals">
							Update goal
						</a>
						</div>
					</div>
				
				<%
				}
				%>
				</div>
				</div>
			</div>
	</section>
	<section class="page-section bg-primary text-white mb-0" id="feature-2">
		<div class="container">
			<div class="text-center">
				<h2 class="page-section-heading d-inline-block mb-0">
					ENTER YOUR DAILY PROGRESS</h2>
			</div>
				<div class="container">
					<div class="row mt-4 mb-4 d-flex justify-content-center">
						<a class="btn btn-secondary large-text " href="update-progress">
							Update progress
						</a>
					</div>
				</div>
			</div>
	</section>
	<section class="page-section" id="feature-3">
		<div class="container">
			<div class="text-center">
				<h2 class="page-section-heading text-secondary d-inline-block mb-0">
					CURRENT GOALS</h2>
			</div>
				<div class="container">
					<div class="row mt-4 mb-4 d-flex justify-content-center">
				<%for (Goal goal : goals) {
				%>
					<div class="text-secondary p-3 mb-3 mt-3 mr-3 ml-3">
						<h4 class="text-center">
							Goal: <%=goal.getGoalName()%> per day</h4>
						<p class="large-text mt-2">
							Target:
							<%=goal.getTarget()%>
							<%=goal.getGoalUnit()%>
						</p>
					</div>
				
				<%
				}
				%>
					</div>
					<div class="row justify-content-center">
						<a class="btn btn-primary large-text masthead-subheading" href="update-goals">
							Update goals
						</a>
					</div> 
				</div>
				
			</div>
	</section>
		<section class="page-section bg-primary text-white mb-0" id="feature-2">
		<div class="container">
			<div class="text-center">
				<h2 class="page-section-heading d-inline-block mb-0">
					ACHIEVEMENTS UNLOCKED</h2>
			</div>
				<div class="container">
					<div class="row d-flex justify-content-center">
						<%
						ArrayList<Object> achievements = (ArrayList<Object>) session.getAttribute("achievements");
						if(achievements == null) { %>
							<h3 class="portfolio">You currently haven't earned any achievements</h3>
						<% } %>
					</div>
										<div class="row d-flex justify-content-center">
					
					<a href="" class="btn btn-secondary large-text">View this month's achievements</a>
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