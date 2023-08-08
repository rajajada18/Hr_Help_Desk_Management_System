<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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

		tbody tr .effect:hover{
			font-size: 2.25vh;
			font-weight:bolder;
			transform: scale(1.1,1.2);
			
			box-shadow: rgba(0, 0, 0, 0.17) 0px -23px 25px 0px inset, rgba(0, 0, 0, 0.15) 0px -36px 30px 0px inset, rgba(0, 0, 0, 0.1) 0px -79px 40px 0px inset, rgba(0, 0, 0, 0.06) 0px 2px 1px, rgba(0, 0, 0, 0.09) 0px 4px 2px, rgba(0, 0, 0, 0.09) 0px 8px 4px, rgba(0, 0, 0, 0.09) 0px 16px 8px, rgba(0, 0, 0, 0.09) 0px 32px 16px;
		}
		
		tbody tr .effect {
		transition: all 2s;
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
</style>
</head>
<body>
	<!-- ##########################INCLUDE HEADER ########################## -->
	<jsp:include page="/WEB-INF/header/HrHeadHeader.jsp"/>
	
	<section>
		<div class="table-responsive-sm container">
		<table  class="table table-hover caption-top table-striped">
		<caption>
	The List is about users/employees of all tickets raised which are pending,
			in state (means the <em>Ticket</em> is not resolved), click on <code>Resolve</code> 
			 (means the <em>Ticket</em> will be resolved)
		</caption>
			<thead class="bg-dark text-light table-bordered text-center" >
				<tr>
					<th scope="col">S.No</th>
					<th scope="col">Description</th>
					<th scope="col">Days</th>
					<th scope="col">Status</th>
					<th scope="col">Get Employee Details</th>
				</tr>
			</thead>
			<% Integer count = 0; %>		
			<tbody class="table-bordered text-center">
				
					<c:forEach items="${list}" var="ticket">
					<tr>
					<th scope="row" style="text-align: center;"  ><%="<b>" + ++count + "</b>" %></th>
					
					<td width="50%" class="effect"><c:out value="${ticket.description} "></c:out></td>
					<td><c:out value="${ticket.date}"></c:out></td>
					<td class="effect" id="ticket-status"><c:out value="${ticket.status}"></c:out></td>
					<td><a class="btn btn-info " href="/head/user/${ticket.user.id}" >EmpId - ${ticket.user.id }</a> </td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
			<div style="padding: 2px;padding-bottom: 15vh;" >
					<c:if test="${hasPrevious}">
					<a href="/head/view/previous" onmouseclick="document.getElementById('btn1').style.backgroundColor='green'"><button id="btn1" class="btn btn-info text-light btn-lg fw-bold" style="font-weight: 700;border: 1px black solid"  name="page" value="Previous">Previous</button></a>
					</c:if>
					<c:if test="${!hasPrevious}">
					<a href="/head/view/previous" style="pointer-events: none;"><button id="btn1" class="btn btn-outline-danger text-muted btn-lg" disabled  name="page" value="Previous">No Previous</button></a>
					</c:if>
					<c:if test="${hasNext}">
					<a href="/head/view/next"><button id="btn2"  class="btn btn-success text-light btn-lg fw-bold" style="margin-left: 105vh;font-weight: 700;border: 1px black solid;">Next</button></a>
					</c:if>
					<c:if test="${!hasNext}">
					<a href="/head/view/next" style="pointer-events: none;"   ><button id="btn2" disabled class="btn btn-outline-danger text-muted btn-lg " style="margin-left: 105vh">No Next</button></a>
					</c:if>
					
				</div>
		</div>
	</section>

 	<!-- ##########################INCLUDE Footer########################## -->
	<footer>
		<jsp:include page="/WEB-INF/footer/footer.jsp"/>
	</footer>
	<script>

		function changeBg(){
			document.getElementById("btn1").style.color="green";
		}
		function noPrevious() {
			alert(`No Previous Page Found! ${list}`);
		}

	</script>
</body>
</html>