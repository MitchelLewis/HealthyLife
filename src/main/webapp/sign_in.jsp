<%@page import="java.util.ArrayList"%>

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
			<h1 class="masthead-heading mb-0">SIGN IN</h1>
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
				<h2 class="page-section-heading text-secondary d-inline-block mb-0">ENTER
					YOUR DETAILS</h2>
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
					<%
					ArrayList<String> errors = (ArrayList<String>) request.getAttribute("errors");
					if (!errors.isEmpty()) {
					%>
					<div class="alert alert-danger" role="alert">
						<ul>
							<ul>
								<%
								for (String error : errors) {
								%>
								<li><%=error%></li>
								<%}%>
							</ul>
					</div>
					<%}%>

					<form method="POST" action="sign-in">

						<!-- Email input -->
						<div class="form-group mb-4">
							<label class="form-label" for="email">Email address</label> <input
								type="email" id="email" class="form-control" name="email" required />
						</div>

						<!-- Password input -->
						<div class="form-group mb-4">
							<label class="form-label" for="password">Password</label> <input
								type="password" id="password" id="password" class="form-control"
								name="password" required />

						</div>

						<!-- Submit button -->
						<button type="submit" class="btn btn-success btn-block mb-4">Sign
							in</button>


					</form>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="partials/footer.jsp"/>
</body>
</html>