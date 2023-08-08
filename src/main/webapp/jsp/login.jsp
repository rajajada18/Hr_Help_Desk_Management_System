<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Google Fonts -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<!-- Bootstrap core CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Material Design Bootstrap -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css"
	rel="stylesheet">
	<style type="text/css">
	body{
	background-color:#6DD5FA;
	}
	#form{
	background: linear-gradient(45deg,#2980B9,#6DD5FA,#FFFFFF);
	}
	<style type="text/css">
.allButFooter {
	min-height: calc(100vh - 40px);
}

.gradient-custom-3 {
	/* fallback for old browsers */
	background: #84fab0;
	/* Chrome 10-25, Safari 5.1-6 */
	background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 0.5),
		rgba(143, 211, 244, 0.5));
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	background: linear-gradient(to right, rgba(132, 250, 176, 0.5),
		rgba(143, 211, 244, 0.5))
}

.gradient-custom-4 {
	/* fallback for old browsers */
	background: #84fab0;
	/* Chrome 10-25, Safari 5.1-6 */
	background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 1),
		rgba(143, 211, 244, 1));
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	background: linear-gradient(to right, rgba(132, 250, 176, 1),
		rgba(143, 211, 244, 1))
}
</style>
	</style>
</head>
<body öncontextmenu="return false">

<!--#################################Header here#################################  -->
	<jsp:include page="/WEB-INF/header/header.jsp" />
	${logout}
	<!--#################################Code Starts here#################################  -->
	<section class="vh-99  bg-image mt-5 "
		style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
		<div class="mask d-flex align-items-center h-90 gradient-custom-3">
		<div class="container py-5 h-100 ">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12 col-md-8 col-lg-6 col-xl-5 ">
					<div class="card shadow-2-strong p-5 " style="border-radius: 1rem;"  >
						<div class="card-body text-center  mt-2 pl-1 pr-1" >

							<h3 class="mb-5">Sign in</h3>
							
							<!-- Form Begins  -->
							<form action="login" method="post">
							<div class="form-outline mb-5 ">
								<input type="email" id="typeEmailX-2"
									class="form-control form-control-lg" value="${bean.email }" placeholder="Enter Email" name="email"/> 
							</div>

							<div class="form-outline mb-4">
								<input type="password" id="typePasswordX-2"
									class="form-control form-control-lg"  placeholder="Enter Password" name="password"/>
									<p style="color: red;font-weight:bold; text-align: left">${error}</p>
							</div>

							<!-- Checkbox -->
							<div class="form-check d-flex justify-content-start mb-4">
								<input class="form-check-input" type="checkbox" value=""
									id="form1Example3" /> <label
									class="form-check-label" for="form1Example3"> Remember
									password </label>
							</div>
                               
							<button class="btn aqua-gradient btn-lg btn-block" type="submit">Login</button>	
							<p style="color: green;text-align: left;font-weight: bold;">${success}</p>		
							<p style="color: red;text-align: left">${lmessage}</p>		
							</form>											
						</div>
						<a href="#" class="text-dark text-left ">Forget password?</a>	
							<p style="color: red;text-align: left">${warn}</p>				
					</div>					
				</div>
			</div>
		</div>
		</div>
	</section>
	
	
	<!--#################################Footer Starts here#################################  -->
	<footer>
		<jsp:include page="/WEB-INF/footer/footer.jsp"></jsp:include>
	</footer>
${logged}
<script type="text/javascript">

   
</script>

	<!-- JQuery -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- Bootstrap tooltips -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
</body>
</html>