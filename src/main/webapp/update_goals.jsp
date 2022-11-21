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
							<td class="align-middle text-center"
								id="<%=goal.getGoalName()%>"><%=goal.getGoalName()%></td>
							<td class="align-middle text-center"
								id="<%=goal.getGoalName()%>-target"><%=goal.getTarget()%>
								<%=goal.getGoalUnit()%></td>
							<td class="align-middle text-center"><button
									id="add-goal-btn" type="button"
									class="btn btn-secondary text-white rounded mr-auto ml-auto"
									data-bs-toggle="modal" data-bs-target="#addGoalModal"
									onclick="addFormToDialog('<%=goal.getGoalName()%>', '<%=goal.getGoalUnit()%>')"
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
					<input type="submit" class="btn btn-primary mt-2 mb-4 align-middle"
						value="Save changes" />
				</div>
			</form>
		</div>
	</section>
	<jsp:include page="partials/footer.jsp"/>

</body>
</html>