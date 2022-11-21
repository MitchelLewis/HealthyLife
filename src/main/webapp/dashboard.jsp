<%@page import="java.util.ArrayList"%>
<%@page import="models.Goal"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<jsp:include page="partials/header.jsp"/>
</head>
<body id="page-top">
	<jsp:include page="partials/navbar.jsp"/>
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
	<jsp:include page="partials/footer.jsp"/>
</body>
</html>