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
<!-- JavaScript Bundle with Popper -->
<!-- Bootstrap core JS-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Third party plugin JS-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
	crossorigin="anonymous"></script>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet">
<script src="update-goal.js"></script>
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
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/healthy-life">HOME</a></li>
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
			<h1 class="masthead-heading mb-0">UPDATE YOUR GOALS</h1>
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
			<div id="goal-container">
				<table class="table" role="presentation" id="goal-table">
					<thead>
						<tr>
							<th scope="col" class="text-center">Goal type</th>
							<th scope="col" class="text-center">Current target</th>
							<th scope="col" class="text-center"></th>
						</tr>
					</thead>
					<tbody id="goal-table-body">
						<%
						ArrayList<Goal> goals = (ArrayList<Goal>) session.getAttribute("goals");
						for (Goal goal : goals) {
						%>
						<tr>
							<td class="align-middle text-center" id="<%= goal.getGoalName()%>"><%=goal.getGoalName()%></td>
							<td class="align-middle text-center" id="<%= goal.getGoalName()%>-target"><%=goal.getTarget()%>
								<%=goal.getGoalUnit()%></td>
							<td class="align-middle text-center"><button
									id="add-goal-btn" type="button"
									class="btn btn-secondary text-white rounded mr-auto ml-auto"
									data-bs-toggle="modal" data-bs-target="#addGoalModal"
									onclick="addFormToDialog('<%= goal.getGoalName() %>', '<%= goal.getGoalUnit() %>')"
									aria-label="Update goal for <%=goal.getGoalName()%>">Update
									goal</button></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="addGoalModal" tabindex="-1"
				aria-labelledby="addGoalModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title text-dark" id="addGoalModalLabel">Update
								goal</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body" id="modal-body"></div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<input type="submit" class="btn btn-primary"
								form="goal-entry-form" value="Update" />
						</div>
					</div>
				</div>
			</div>
			<form id="goal-info-form" method="POST" action="update-goals">
				<div class="d-flex align-items-center flex-column">
				<input type="submit"
					class="btn btn-primary mt-2 mb-4 align-middle"
					value="Save changes" />
				</div>
			</form>
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