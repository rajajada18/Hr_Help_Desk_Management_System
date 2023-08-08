<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cancel Tickets</title>
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
	footer{
		  left: 0;
		  bottom: 0;
		  width: 100%;
		  background-color: red;
		  color: white;
		  text-align: center;
		}
</style>
</head>
<body>

<!-- ##########################INCLUDE HEADER ########################## -->
	<jsp:include page="/WEB-INF/header/userheader.jsp"></jsp:include>
	
<!-- ##########################Our Code Logic To Display The Tickets ########################## -->	
	<marquee behavior="alternate"   scrolldelay="1" class=" text-danger">${cmessage}</marquee>
	<section>		
		<div class="table-responsive-sm container">
		<table  class="table table-hover caption-top table-striped">
		<caption>
			Here is the list of tickets where you can find all you're pending tickets which you can cancel them but <span class="text-danger">
			, once you have cancelled the ticket will be deleted.
			</span> 
		</caption>
			<thead class="bg-dark text-light table-bordered text-center" >
				<tr>
					<th scope="col">S.No</th>
					<th scope="col">Description</th>
					<th scope="col">Days</th>
					<th scope="col">Status</th>
					<th scope="col">Cancel Ticket</th>
				</tr>
			</thead>
			<% Integer count = 0; %>		
			<tbody class="table-bordered text-center">
				
					<c:forEach items="${sessionScope.ulist}" var="ticket">
					<tr>
					<th scope="row" style="text-align: center;" ><%="<b>" + ++count + "</b>" %></th>
					
					<td width="50%"><c:out value="${ticket.description} "></c:out></td>
					<td><c:out value="${ticket.date}"></c:out></td>
					
					<th scope="row">
						<p class="text-danger" ><c:out value="${ticket.status}"/></p>
					</th>
					
					<th>
						<a class="btn btn--outline-dark" href="/cancel/${ticket.ticketId}" onclick="return ask()">Cancel</a>
					</th>
					</tr>					
				</c:forEach>
			</tbody>
		</table>
		</div>
	</section>
	
	
	
	  <!-- ##########################INCLUDE Footer########################## -->
	<footer style="margin-top: 10% ">
		<jsp:include page="/WEB-INF/footer/footer.jsp"></jsp:include>
	</footer>
												<!---------------------- Script conditions  ----------------------------->
			<script type="text/javascript">
		function remove() {
				//replace() does not keep the originating page in the session history,
				window.location.replace("/welcome"); // clear the last entry in the history and redirect to new url
				}
		
		var ask = () => {
			var res = confirm("Are you sure you want to cancel ticket?")
			console.log(res);
			return res;
		}

			</script>
</body>
</html>