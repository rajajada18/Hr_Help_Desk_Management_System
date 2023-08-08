<%@page import="com.example.demo.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
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
<style type="text/css">
section {
	height: 620px;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;	
	position: relative;
    margin-top: -1.5%;
    
}
div h4{
	font-weight: bold;
	font-size: 2.5em;
	font-family: ;
}
 div h1{
 	font-weight: bold;
 	font-size: 9vh;
 }
div h1, div h4 {

}
#demo{
	display: none;
	transition-delay: 1s;
	transition-duration: 1s;
}



</style>
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
</head>




<body onload="fun()">


<!-- ##########################INCLUDE HEADER ########################## -->
	<jsp:include page="/WEB-INF/header/userheader.jsp"></jsp:include>
	
	
	
	
<!-- ##########################Form Starts ########################## -->
	<section class="container-flex"
		style="background-image: url('/jsp/bg.png'); background-repeat: no-repeat; " >

		<center style="padding-top: 15%">
		<div id="demo" class="carousel slide" data-ride="carousel">

			

			
			<!-- The slideshow -->
			<div class="carousel-inner mt-5" id="slide">
				<div class="carousel-item ">
				<h4>Have an Issue? Then..</h4>
				<a class="btn bg-dark text-light btn-lg " href="/jsp/Ticket.jsp">Raise a Ticket</a>
				</div>
				<div class="carousel-item">
				<h4>See your tickets...</h4>
				
				<a class="btn bg-dark text-light btn-lg " href="/viewTickets">View All Tickets 
					<%
					/* Object --> Type cast to Integer */
					Integer count  = (Integer)request.getSession().getAttribute("usize");
					if(count<=0)
						out.print("<span class='badge badge-notification bg-success rounded-pill ml-1 p-1'> "+count+"</span>");
					else if(count>=1 && count<=5)
						out.print("<span class='badge badge-notification bg-warning rounded-pill ml-1  p-1'> "+count+"</span>");
					else
						out.print("<span class='badge badge-notification bg-danger rounded-pill ml-1 p-1'> "+count+"</span>");
					%></a>
				</div>
				<div class="carousel-item active ">
				<h1>Welcome<% UserBean bean =  (UserBean)request.getSession().getAttribute("user");
				out.print(" " +bean.getLastname());
				%></h1>	
				<a href="#" style="font-size: 0.5rem;">
  						<i class="fas fa-envelope fa-5x"></i>
  								<span class=" badge rounded-pill badge-notification bg-danger text-top" style="font-size: 1.2em;border: 2px black solid">Notifications</span>
				</a>
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="carousel-control-prev " href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon bg-dark"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon bg-dark"></span>
			</a>

		</div>
</center>
	</section>
  <!-- ##########################Form End########################## -->
  
  <!-- ##########################INCLUDE Footer########################## -->
	<footer>
		<jsp:include page="/WEB-INF/footer/footer.jsp"></jsp:include>
	</footer>
	
														<!---------------------- Script conditions  ----------------------------->
		<% if(request.getSession().getAttribute("message").toString()!=""){
			out.print("<script> alert(' " + request.getSession().getAttribute("message").toString() + "') </script>");
			request.getSession().setAttribute("message", "");
		}
%>
	<script>
		
		function fun(){
			document.getElementById("demo").style.transition = "1s";
			document.getElementById("demo").style.display="block";
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