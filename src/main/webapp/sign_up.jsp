<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html class="h-100">
<head>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
	crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<link href="cover.css" rel="stylesheet">
<title>Healthy Life - Sign up</title>
</head>
<body class="d-flex h-100 text-center text-bg-dark">
	<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
		<header class="mb-auto">
			<div>
				<h3 class="float-md-start mb-0">Healthy Life</h3>
				<nav class="nav nav-masthead justify-content-center float-md-end">
					<a class="nav-link fw-bold py-1 px-0" href="/healthy-life">Home</a>
					<a class="nav-link fw-bold py-1 px-0" href="#">Sign in</a>
				</nav>
			</div>
		</header>

		<main class="mb-auto">
			<h1 class="mb-5">Sign up to Healthy Life</h1>

			<%ArrayList<String> errors = 
            (ArrayList<String>)request.getAttribute("errors");
			if(!errors.isEmpty()) {%>
			<div class="alert alert-danger" role="alert">
				<ul>
					<ul>
						<%
        		for(String error: errors){%>
						<li><%=error%></li>
						<%}%>
					</ul>
			</div>
			<%}%>

			<form method="POST" action="sign-up">
				<!-- 2 column grid layout with text inputs for the first and last names -->
				<div class="row mb-4">
					<div class="col">
						<div class="form-group">
							<label class="form-label" for="first-name">First name</label> <input
								type="text" id="first-name" class="form-control"
								name="first-name" />

						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label class="form-label" for="surname">Last name</label> <input
								type="text" id="surname" class="form-control" name="surname" />

						</div>
					</div>
				</div>

				<!-- Email input -->
				<div class="form-group mb-4">
					<label class="form-label" for="email">Email address</label> <input
						type="email" id="email" class="form-control" name="email" />
				</div>

				<!-- Password input -->
				<div class="form-group mb-4">
					<label class="form-label" for="password">Password</label> <input
						type="password" id="password" id="password" class="form-control"
						name="password" />

				</div>

				<!-- Submit button -->
				<button type="submit" class="btn btn-success btn-block mb-4">Sign
					up</button>


			</form>
		</main>
	</div>

</body>
</html>