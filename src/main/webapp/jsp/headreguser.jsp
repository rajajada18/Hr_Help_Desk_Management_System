<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register User</title>
<link rel="icon" type="image/x-icon" href="data:image/x-icon;base64,AAABAAEAEBAAAAEAIABoBAAAFgAAACgAAAAQAAAAIAAAAAEAIAAAAAAAAAQAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABVVVUAYWFhAFBQUBFNTU0pTU1NJFBQ
UAhNTU0AVlZWAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABSUlIAWFhXAU1NTj1MTE5nTU1P
UkxNT1hMTE5mTU1NIEtLSwBiYmIAAAAAAAAAAAAAAAAAzqAoAM+hLQDSnxQT5asNDk1OTitPT0xi
pYMmIOavDgvepwoOe2k2NU5OTXtTUk811J8HFNCcChK8o0sAxKM0AM+cHQDMmyUD1p0Gm9eeBYtI
TFQZh3AtINadArPWoAtw158IidKbA6JPTk1ygWw1edeeAsXTnQhl5JsAAMWkNgDPnBsAy5okBNee
A7TXnQOj55QAAM2YBBHWnQHS16AKg9ifB6DWnQG8w5ccGteeBafXngPC058OGNSeCwAAAAAAz5wb
AMuaJATXngOy154Dv9WdB0jUnQZV150B4NegCoLYnwed154B8daeBMrXngH41Z4Gls2hGwbRoBEA
AAAAAM+cGwDLmiQE154Dr9eeAffXnQLe150C4NieAfzXoAqA2J8Hn9eeA9HVnQZa1p4FgNeeAufV
nghG1p0EAAAAAADPnBsAy5okBNeeA7PWnQOw0ZsJItGbBjLWnQHZ16AKg9ifB6DXngS2w6ROAtSf
DyXXngPh1Z4HYdedAAAAAAAAz5wbAMuaJQTXngO01p0Do+eVAADNlwMR1p0B0tegCoPYnwed154C
7NeeBbHXngPM1p4D09SeDCnUngkAAAAAAM6eIwDKnS0C1qALWNWfC0/kmQAAzpsNCNWfCWfWohFA
2KEPTNigCIHYoAiC158HdtSeCy8Kwv8AyqAiAAAAAAAAAAAAAAAAAAAAAAAAAAAApr7oAKa+6ACm
vugApr7oAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAA//8AAP//AAD8PwAA8B8AAMADAACAAwAAiAMAAIADAACAAwAAgAMAAIgDAACIBwAA//8AAP//
AAD//wAA//8AAA=="> 
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
	input:valid{
			color: green;
		}
		input:invalid{
			color: red;
		}
		title{
			background-color: black;
			color: white;
			font-size: 1.25em;
		}
</style>
</head>
<body class="bg-dark">
<!--#################################Header here#################################  -->
	<jsp:include page="/WEB-INF/header/HrHeadUserNav.jsp"></jsp:include>
<%if(request.getSession().getAttribute("regMessage")!=""){ %>
${regMessage}
<%} %>
<% request.getSession().setAttribute("regMessage", ""); %>
<!--#################################Code Starts here#################################  -->
	<section class="vh-99 bg-image"
		style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
		<div class="mask d-flex align-items-center h-90 gradient-custom-3">
			<div class="container h-100">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-12 col-md-9 col-lg-7 col-xl-6">
						<div class="card" style="border-radius: 15px;">
							<div class="card-body p-5">						
								<h2
									class="text-uppercase text-center mb-5">
									Create account	</h2>
									
											
								<form action="../head/user/register"  method="post">

									<div class="form-outline mb-4">
										<input type="text" id="form3Example1cg"
											class="form-control form-control-lg" placeholder="User First name"  title="Name fields should contain only alphabets" name="firstname" required="required"/>
									</div>
									<div class="form-outline mb-4">
										<input type="text" id="form3Example1cg"
											class="form-control form-control-lg" placeholder="User Last name"  title="Name fields should contain only alphabets"  name="lastname" required="required"/>
									</div>
									<div class="form-outline mb-4">
										<input type="email" id="form3Example3cg"
											class="form-control form-control-lg" placeholder="User Email" title="Email should contain @Virtusa.com"  name="email" required="required"/>
									</div>
								

									<div class="form-outline mb-4">
										<input type="password" id="password"
											class="form-control form-control-lg"
											placeholder="Password for User"  title="Password must contain 5-7[words],1-3[digits/numbers] and 1[special character]" name="password" required="required" />

									</div>

									<div class="form-outline mb-4">
										<input type="password" id="repassword"
											class="form-control form-control-lg"
											placeholder="Repeat your password" required="required"/>
											<p id="passwordCheck" style="color: red;font-weight: bold;"></p>
									</div>

									<div class="form-check  justify-content-center mb-5">
										<input class="form-check-input me-3" type="checkbox" value=""
											id="form2Example3cg" /> <label
											class="form-check-label" for="form2Example3g"> I
											agree all statements in <a href="#!" class="text-body"><u>Terms
													of service</u></a>
										</label>
									</div>

									<div class="d-flex justify-content-center">
										<button type="submit"
											class="btn btn-success btn-block btn-lg gradient-custom-4 text-body btn-rounded" onclick="return validPassword()">Register</button>
									</div>
									<p class="text-center" style="color: red;font-weight:bold; text-align: left">${error}</p>
									<p class="text-center text-muted mt-5 mb-0">
										Have already an account? <a href="/jsp/login.jsp"
											class="fw-bold text-body"><u>Login here</u></a>
									</p>

								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

<!--#################################Footer here#################################  -->
	<footer>
		<jsp:include page="/WEB-INF/footer/footer.jsp"></jsp:include>
	</footer>
	<script type="text/javascript">
	
	document.addEventListener('DOMContentLoaded', function () {
	        let today = new Date().toLocaleDateString();
	        var options = {
	            defaultDate: new Date(today),
	            setDefaultDate: true
	        };
	        var elems = document.querySelector('#datepicker');
	        var instance = Datepicker.init(elems, options);
	        instance.setDate(new Date(today));
	        document.getElementById("datepicker").value = instance;
	});
	
	var validPassword = ()  =>
	{
		var password =  document.getElementById("password").value;
		var repassword = document.getElementById("repassword").value;
		if(password !==repassword){
			document.querySelector("#passwordCheck").innerHTML = "Passwords are not same";
			document.getElementById("#password").style.color = "red";
			document.getElementById("#repassword").style.color = "red";
			return false;
		}
	
	}
	
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