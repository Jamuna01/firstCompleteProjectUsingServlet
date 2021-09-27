<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@page import="com.entities.User"%>

<%@page errorPage="error_page.jsp" %>
<%@page import="com.entities.Message" %>


<%
 	User user = (User)session.getAttribute("currentUser");
	if(user == null) 
 		response.sendRedirect("login_page.jsp"); 
    %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
	<!-- navbar -->
<body>
	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index.jsp"><span
			class="fa fa-asterisk"></span>Tech Blog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#"><span
						class="fa fa-file-code-o"></span> Learn Code <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="fa fa-check-square"></span>
						Categories
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming Language</a> <a
							class="dropdown-item" href="#">Project Implementation</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data Structure</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-address-book"></span> Contact</a></li>
				
			</ul>
			<ul class="navbar-nav mr-right">
			
				<li class="nav-item">
				<a class="nav-link" href="#!" data-toggle="modal" data-target="#profileModal"
					><span class="fa fa-user"></span>
						<%=user.getName() %></a></li>
						
				<li class="nav-item"><a class="nav-link"
					href="login_page.jsp"><span class="fa fa-power-off"></span>
						Logout</a></li>
			</ul>
		</div>
	</nav>
	          <!-- End of Navbar -->
	          
	          
	  
						<%
							Message m = (Message)session.getAttribute("msg");
							if(m != null)
							{
								%>
								
								<div class="alert <%=m.getCssClass() %>" role="alert">
  									<%=m.getContent() %>
								</div>	
						<% 
						
							session.removeAttribute("msg");
						
							}
						%>
	<!-- profile modal -->
	<!-- Button trigger modal -->

<!-- Modal -->
	<div class="modal fade" id="profileModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header text-white">
					<h5 class="modal-title" id="exampleModalLabel">Profile</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="pics/jamuna.png" class="img-fluid"
							style="border-radius: 50%; max-width: 100px;">
						<h5 class="modal-title" id="exampleModalLabel"><%=user.getName()%></h5>

						<!-- User's Details -->
						<div id="profile-details">
							<table class="table text-center">
								<tbody>
									<tr>
										<th scope="row">ID :</th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><%=user.getEmail()%></td>
									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<th scope="row">Status :</th>
										<td><%=user.getAbout()%></td>
									</tr>
									<tr>
										<th scope="row">Registered on :</th>
										<td><%=user.getDateTime().toString()%></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- Profile Edit -->
						<div id="profile-edit" style="display:none;">
							<h3 class="mt-2">Please Edit Carefully</h3>
							<form action="EditServlet" method="post" enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>Id : </td>
										<td><%= user.getId() %></td>
									</tr>
									<tr>
										<td>Email : </td>
										<td><input class="form-control" type="email" name="user_email" value="<%= user.getEmail()%>"/></td>
									</tr>
									<tr>
										<td>Name : </td>
										<td><input class="form-control" type="text" name="user_name" value="<%= user.getName()%>"/></td>
									</tr>
									<tr>
										<td>Password : </td>
										<td><input class="form-control" type="password" name="user_password" value="<%= user.getPassword()%>"/></td>
									</tr>
									<tr>
										<td>Gender : </td>
										<td><%= user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<td>About : </td>
										<td>
											<textarea rows="3" class="form-control" name="user_about">
												<%=user.getAbout()%>
											</textarea>
										</td>
									</tr>
									<tr>
										<td>Profile Pic : </td>
										<td>
											<input class="form-control" type="file" name="image"/>
										</td>
									</tr>
								</table>
								<div class="container">
									<button type="submit" class="btn-outline-secondary">Save</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button" class="btn btn-secondary">Edit</button>
				</div>
			</div>



		</div>
	</div>
	<!-- End of profile modal -->
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
		$(document).ready(function(){
			
			let editStatus = false; 
			
			$('#edit-profile-button').click(function(){
				//alert("button clicked");
				if(editStatus == false)
					{
						$("#profile-details").hide();
					
						$("#profile-edit").show();
						editStatus = true;
						$(this).text("Back");
					}	
				else
					{
						$("#profile-details").show();
					
						$("#profile-edit").hide();
						editStatus = false;
						$(this).text("Edit");
					}
			})
		});
	</script>
</body>
</html>
