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
			<h1 class="masthead-heading mb-0">UPDATE YOUR PROGRESS</h1>
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
		<div class="container d-flex align-items-center flex-column">
			<%
			ArrayList<Goal> goals = (ArrayList<Goal>) session.getAttribute("goals");
			for (Goal goal : goals) {
			%>
			<input type="hidden" id="<%=goal.getGoalName()%>.units"
				name="<%=goal.getGoalName()%>.units"
				value="<%=goal.getGoalUnit()%>"> <input type="hidden"
				id="<%=goal.getGoalName()%>.target"
				name="<%=goal.getGoalName()%>.target"
				value="<%=goal.getTarget()%>"> <input type="hidden"
				id="<%=goal.getGoalName()%>.progress"
				name="<%=goal.getGoalName()%>.progress"
				value="<%=goal.getCurrentProgress()%>">
			<%
			}
			%>
			<form method="POST" action="update-progress">
				<div class="row large-text mb-2">
					<div class="col-sm-4">Goal:</div>
					<div class="col-sm-4">
						<select name="goal" onchange="populateProgressFields(this)">
							<option selected>Select goal</option>
							<%
							for (Goal goal : goals) {
							%>
							<option value="<%=goal.getGoalName()%>"><%=goal.getGoalName()%></option>
							<%
							}
							%>
						</select>
					</div>
					<div class="col-sm-4" id="goal-units"></div>
				</div>
				<div class="row large-text hidden mb-2">
					<div class="col-sm-4">Target:</div>
					<div class="col-sm-4" id="target"></div>
					<div class="col-sm-4" id="target-units"></div>
				</div>
				<div class="row large-text hidden mb-2">
					<div class="col-sm-4">Current progress:</div>
					<div class="col-sm-4" id="progress"></div>
					<div class="col-sm-4" id="progress-units"></div>
				</div>
				<div class="row large-text hidden mb-2">
					<div class="col-sm-4">Update:</div>
					<input class="col-sm-4" type="number" min="0" name="goal-update"
						onchange="updateTotal(this)">
					<div class="col-sm-4" id="update-units"></div>
				</div>
				<div class="row large-text hidden mb-2">
					<div class="col-sm-4">Total:</div>
					<div class="col-sm-4" id="total"></div>
					<div class="col-sm-4" id="total-units"></div>
				</div>
				<div class="d-flex align-items-center flex-column">
					<input type="submit" value="Save changes" class="btn btn-primary mt-3">
				</div>
			</form>
		</div>
	</section>
	<jsp:include page="partials/footer.jsp"/>
</body>
</html>