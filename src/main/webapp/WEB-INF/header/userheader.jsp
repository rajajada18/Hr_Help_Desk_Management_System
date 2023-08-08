<%@page import="com.example.demo.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/x-icon" href="favicon.ico"> <title>Welcome User</title>
<meta charset="ISO-8859-1">
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- MD Bootstrap -->
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
<!-- favicon  -->
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
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-dark navbar-dark p-3">
		<% 
		UserBean user = (UserBean)request.getSession().getAttribute("user");
		String name = user.getLastname();
		%>
		
		<a href="/jsp/welcome.jsp" class="navbar-brand text-light h5-responsive" >Welcome <%=name %></a>

	

		<!-- Options -->
		<div style="border-left: 0.5vh white solid; margin-left: 5%">
			<ul class="navbar-nav mr-auto text-center ml-5 p-2"
				style="font-size: 1.15em;">
				<li class="nav-item   pl-5" >
				<a href="/jsp/Ticket.jsp"class="nav-link text-uppercase" >Ticket Raise</a>
					</li>			
				<li class="nav-item pl-5"><a href="/cancel"
					class="nav-link text-uppercase ">Cancel Ticket</a></li>
				<li class="nav-item pl-5"><a href="/viewTickets"
					class="nav-link text-uppercase ">View Tickets   <span >
					<%
					/* Object --> Type cast to Integer */
					Integer count  = (Integer)request.getSession().getAttribute("usize");
					if(count<=0)
						out.print("<span class='badge bg-info text-dark rounded-pill ms-2 ml-1 pb-1'> "+count+"</span>");					
					else
						out.print("<span class='badge bg-success rounded-pill ms-4 ml-1 pb-1'> "+count+"</span>");
					%></span></a></li>
				<li class="nav-item  pl-5"><a class="nav-link text-uppercase "
					href="/viewReport">Report to Admin</a></li>
				<li class="nav-item  pl-5 "><a class="nav-link text-uppercase "
					href="/logout">Logout</a></li>
					<li class=" " style="margin-left: 15vh">
					<a title="<%=name.concat(" Profile")%>" href="/userProfile" id="profile"><button  class="" style="border: 2px white ;padding-right: 5px;border-radius: 50%;justify-content: center;text-align: center;color: white;font-weight: 500;background: rgba(255,255,255,0.3);font-size: 3vh;width: 6vh;height: 6vh;"><%=name.toUpperCase().charAt(0) %></button></a>
					</li>
			</ul>
		</div>
	</nav>
	<br>


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