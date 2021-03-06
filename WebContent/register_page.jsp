<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register page</title>
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

	<%@include file="normal_navbar.jsp" %>

	<main class="backpage">
	
		<div class="container">
		
			<div class="col-md-5 offset-md-3">
			
				<div class="card">
				
					<div class="card-header primary-background text-white text-center">
						<span class="fa fa-user-circle fa-3x"></span>
						<br>
						Register Here
					</div>
					<div class="card-body">

						<form id="reg-form" action="signup" method="post">

							<div class="form-group">
								<label for="user_name">Username</label> <input name="user_name"
									type="text" class="form-control" id="username"
									placeholder="Username" required>
							</div>


							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="user_email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email" required> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>


							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name="user_password" type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Password" required>
							</div>

							<div class="form-group">
								<label for="Gender">Select Gender</label><br> <input
									type="radio" id="gender" name="gender" value="male" required>Male
								<input type="radio" id="gender" name="gender" value="female" required>Female
							</div>

							<div class="form-group">

								<textarea class="form-control" name="about" rows="5"
									placeholder="Enter something about yourself"></textarea>

							</div>


							<div class="form-check">
								<input name="user_checkbox" type="checkbox"
									class="form-check-input" id="exampleCheck1"> <label
									class="form-check-label" for="exampleCheck1">Terms and
									Conditions</label>
							</div>

							<br>
							<div class="container text-center" id="loader" style="display:none;">
							
								<span class="fa fa-spinner fa-3x fa-spin"></span>
								<h4>Please wait..</h4>
							</div>
							
							<button id="submit-btn" type="submit" class="btn text-white">Sign Up</button>
						</form>

					</div>
				</div>
			
			</div>
		
		</div>
		
	</main>
	
	
	
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js
	"></script>
	<script>
		$(document).ready(function(){
			
			console.log("loaded...")
			
			$('#reg-form').on('submit', function(event)
					{
				
				event.preventDefault();
				
				let form = new FormData(this);
				
				$("#submit-btn").hide();
				$("#loader").show();
				
				//send register servlet:
					
				$.ajax({
					
					url:"signup",
					type:'POST',
					data: form,
					success: function(data, textStatus, jqXHR)
					{
						console.log(data)
						$("#loader").hide();
						$("#submit-btn").show();
						
						if(data.trim() == 'done')
						 {
							swal("Registered Successfully!")
								.then((value) => {
						  			window.location="login_page.jsp";
						});
						 }
						else
							{
								swal(data);
							}
					}, 
					error: function (jqXHR, textStatus, errorThrown)
					{
						$("#loader").hide();
						$("#submit-btn").show();
						swal("Sorry! something went wrong. Try again!");
					},
					processData: false,
					contentType: false
					
				});
			});
		})
	
	</script>
</body>
</html>