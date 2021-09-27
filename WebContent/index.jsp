<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
<%@ page import="java.sql.*"%>
<%@ page import="com.dbutilities.ConnectionProvider" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
	.banner-background
	{
		clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 70%, 72% 83%, 46% 69%, 18% 85%, 0% 70%, 0 1%, 20% 0);
	}
</style>

</head>
<body>
	<!--navbar-->
	<%@include file="normal_navbar.jsp" %>
	
	<!-- Banner -->
	<div class="container-fluid p-0 m-0">

		<div class="jumbotron bg-light text-dark">
			<div class="container">
				<h3 class="display-4">Welcome To TechBlog</h3>
				<p>Welcome to technical blog</p>
				<p>A programming language is a formal language comprising a set
					of strings that produce various kinds of machine code output.
					Programming languages are one kind of computer language, and are
					used in computer programming to implement algorithms.Most
					programming languages consist of instructions for computers. There
					are programmable machines that use a set of specific instructions,
					rather than general programming languages. Since the early 1800s,
					programs have been used to direct the behavior of machines such as
					Jacquard looms, music boxes and player pianos.[1] The programs for
					these machines (such as a player piano's scrolls) did not produce
					different behavior in response to different inputs or conditions.</p>
				<a href="register_page.jsp" class="btn btn-outline-light btn-lg">
					<span class="fa fa-user-plus"></span> Start ! it's Free
				</a>
				<a href="login_page.jsp" class="btn btn-outline-light btn-lg">
					<span class="fa fa-user-circle-o fa-spin"></span> Login
				</a>
			</div>
		</div>
	

		<!-- cards -->
		<div class="container">

			<div class="row mb-2">

				<div class="col-md-4">

					<div class="card">
						<div class="card-body">
							<h5 class="Card title">Java Programming</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn text-white">Read More</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">

					<div class="card">
						<div class="card-body">
							<h5 class="Card title">Python Programming</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn text-white">Read More</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">

					<div class="card">
						<div class="card-body">
							<h5 class="Card title">C++</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn text-white">Read More</a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">

				<div class="col-md-4">

					<div class="card">
						<div class="card-body">
							<h5 class="Card title">JavaScript</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn text-white">Read More</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">

					<div class="card">
						<div class="card-body">
							<h5 class="Card title">HTML</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn text-white">Read More</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">

					<div class="card">
						<div class="card-body">
							<h5 class="card-title">CSS</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn text-white">Read More</a>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>


	<!-- JavaScript -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script>
		/* $(document).ready(function(){
			alert("document loaded")
		}) */
	</script>
<!-- 	<script type="text/javascript" src="js/myjs.js"></script> -->
</body>
</html>