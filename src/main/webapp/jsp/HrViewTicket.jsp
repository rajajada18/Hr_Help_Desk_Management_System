<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Tickets</title>
<link rel="icon" type="image/x-icon"
	href="data:image/x-icon;base64,AAABAAEAEBAAAAEAIABoBAAAFgAAACgAAAAQAAAAIAAAAAEAIAAAAAAAAAQAAAAAAAAAAAAAAAAA
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
footer {
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

	<jsp:include page="/WEB-INF/header/hrHeader.jsp"></jsp:include>

	<!-- ##########################Our Code Logic To Display The Tickets ########################## -->
	<section>
		<div class="table-responsive-sm container">
			<table class="table table-hover caption-top table-striped">
				<caption>
					The List is about users/employees of all tickets raised which are
					pending, in state (means the <em>Ticket</em> is not resolved),
					click on
					<code>Resolve</code>
					(means the <em>Ticket</em> will be resolved)
				</caption>
				<thead class="bg-dark text-light table-bordered text-center">
					<tr>
						<th scope="col">S.No</th>
						<th scope="col">Description</th>
						<th scope="col">Days</th>
						<th scope="col">Status</th>
						<th scope="col">Resolve</th>
						<th scope="col">Raised in Days</th>
						<th scope="col">Get Employee Details</th>
					</tr>
				</thead>
				<%
				Integer count = 0;
				%>
				<tbody class="table-bordered ">

					<c:forEach items="${sessionScope.rlist}" var="ticket">
						<c:set var="desc" value="${ticket.description}"></c:set>
						<c:if test="${!fn:contains(desc,'User Defined Report') }">
							<tr>
								<th scope="row" style="text-align: center;" class="text-center"><%="<b>" + ++count + "</b>"%></th>

								<td width="30%"><p style="white-space: pre-line">
										<c:out value="${ticket.description} " />
									</p></td>
								<td><c:out value="${ticket.date}"></c:out></td>
								<td><c:out value="${ticket.status}"></c:out></td>
								<%-- <c:if test="${ticket.timediff <= '2' }"> --%>
								<td><a class="btn btn-success "
									href="/hr/resolve/${ticket.ticketId}">Resolve</a></td>
								<%-- </c:if> --%>
								<%-- <c:if test="${ticket.timediff >= '3' }">
					<td><a class="btn btn-danger " href="/hr/resolveReason/${ticket.ticketId}" onclick="reason()">Resolve</a> </td>
					</c:if> --%>
								<td class="text-danger text-center"><c:out
										value="${ticket.timediff }"></c:out></td>
								<td><a class="btn btn-info "
									href="/hr/user/${ticket.user.id}">EmpId - ${ticket.user.id }</a>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>



	<!-- ##########################INCLUDE Footer########################## -->
	<footer>
		<jsp:include page="/WEB-INF/footer/footer.jsp"></jsp:include>
	</footer>
	<script type="text/javascript">
		var reason = () =>{
		var reason = 	prompt('Enter the reason for delay?','Write your reason here');
		console.log(reason)
		}
	
	</script>
</body>
</html>