<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Tickets</title>
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
		
		tr #ticket-status:hover{
		font-weight: bolder;
		color: red;
		font-size: 2.25vh;
		transform: scale(1.1,1.2);
		box-shadow: rgba(0, 0, 0, 0.17) 0px -23px 25px 0px inset, rgba(0, 0, 0, 0.15) 0px -36px 30px 0px inset, rgba(0, 0, 0, 0.1) 0px -79px 40px 0px inset, rgba(0, 0, 0, 0.06) 0px 2px 1px, rgba(0, 0, 0, 0.09) 0px 4px 2px, rgba(0, 0, 0, 0.09) 0px 8px 4px, rgba(0, 0, 0, 0.09) 0px 16px 8px, rgba(0, 0, 0, 0.09) 0px 32px 16px;
		}
		
		tr #ticket-status{
		transition: all 2s !important;
		
		}
		
		 tbody tr #ticket-size:hover{
			font-size: 3.25vh;
			box-shadow: rgba(0, 0, 0, 0.17) 0px -23px 25px 0px inset, rgba(0, 0, 0, 0.15) 0px -36px 30px 0px inset, rgba(0, 0, 0, 0.1) 0px -79px 40px 0px inset, rgba(0, 0, 0, 0.06) 0px 2px 1px, rgba(0, 0, 0, 0.09) 0px 4px 2px, rgba(0, 0, 0, 0.09) 0px 8px 4px, rgba(0, 0, 0, 0.09) 0px 16px 8px, rgba(0, 0, 0, 0.09) 0px 32px 16px;
			padding-top: 2%;
			transform: scale(1.1,1.2);
			font-weight:bolder;
		}
		
		tbody tr #ticket-desc:hover{
			font-size: 2.25vh;
			font-weight:bolder;
			transform: scale(1.1,1.2);
			
			box-shadow: rgba(0, 0, 0, 0.17) 0px -23px 25px 0px inset, rgba(0, 0, 0, 0.15) 0px -36px 30px 0px inset, rgba(0, 0, 0, 0.1) 0px -79px 40px 0px inset, rgba(0, 0, 0, 0.06) 0px 2px 1px, rgba(0, 0, 0, 0.09) 0px 4px 2px, rgba(0, 0, 0, 0.09) 0px 8px 4px, rgba(0, 0, 0, 0.09) 0px 16px 8px, rgba(0, 0, 0, 0.09) 0px 32px 16px;
		}
		
		tbody tr #ticket-desc{
		transition: all 2s;
		}
		section table tbody tr #ticket-size{
			font-size: 2.25vh;
			transition: all 2s;
		}
</style>
</head>
<body>

<!-- ##########################INCLUDE HEADER ########################## -->

	<jsp:include page="/WEB-INF/header/HrHeadHeader.jsp"></jsp:include>
	
<!-- ##########################Our Code Logic To Display The Tickets ########################## -->	
	<section>
		<div class="table-responsive-sm container">
		<table  class="table table-hover caption-top table-striped">
		<caption>
			The List is about users/employees of all tickets raised which are pending,
			for more than <code>2 days</code> which are not resolved by hr 
			 (means the <em>Ticket</em> need to be resolved) by respective Head/Admin.
		</caption>
			<thead class="bg-dark text-light table-bordered text-center" >
				<tr>
					<th scope="col">S.No</th>
					<th scope="col">Description</th>
					<th scope="col">Date</th>
					<th scope="col">Status</th>
					<th scope="col">Raised in Days</th>
					<th scope="col">Resolve</th>
					<th scope="col">Employee Details</th>
					
				</tr>
			</thead>
			<% Integer count = 0; %>		
			<tbody class="table-bordered ">
					<c:forEach items="${sessionScope.reportList}" var="ticket">
					
				<c:if test="${ticket.status == 'Pending' }">
					<tr>
					<th scope="row" style="text-align: center;" class="text-center"><%="<b>" + ++count + "</b>" %></th>
					
					<td width="30%" id="ticket-desc"><p style="white-space: pre-line"><c:out value="${ticket.description} "/></p></td>
					<td><c:out value="${ticket.date}"></c:out></td>
					<td id="ticket-status"><c:out value="${ticket.status}"></c:out></td>					
					<td class="text-danger text-center" id="ticket-size" ><c:out value="${ticket.timediff }"></c:out></td>															
					<td><a class="btn btn-success text-center" href="/head/resolve/${ticket.ticketId}">Resolve</a> </td>
					<td><a class="btn btn-info text-center" href="/head/user/${ticket.user.id}" >EmpId - ${ticket.user.id }</a> </td>
					</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		</div>
	</section>
	
	
	
	  <!-- ##########################INCLUDE Footer########################## -->
	<footer style="margin-top: 15.9%">
		<jsp:include page="/WEB-INF/footer/footer.jsp"></jsp:include>
	</footer>
</body>
</html>