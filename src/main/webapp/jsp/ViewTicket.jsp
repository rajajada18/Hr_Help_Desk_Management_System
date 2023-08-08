<%@page import="java.sql.Date"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	Footer{
		 
		  left: 0;
		  bottom: 0;
		  width: 100%;
		  background-color: red;
		  color: white;
		  text-align: center;
		}
		#collapseExample{
  width: 200px;
  -webkit-transition: width .35s ;
  transition: width 1s ;
}
#collapseExample:focus {
  width: 250px;
}
</style>
</head>
<body >

<!-- ##########################INCLUDE HEADER ########################## -->
	<jsp:include page="/WEB-INF/header/userheader.jsp"></jsp:include>
	
<!-- ##########################Our Code Logic To Display The Tickets ########################## -->	
	<section>
	<p >
  <a class="btn btn-warning text-dark animated fadeInLeft delay-1s font-weight-bold" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" id="col" aria-controls="collapseExample" >
  Summary!
  </a>
</p>
<div class="collapse" id="collapseExample" style="width: 70%" >
  <div class="card card-body">
    Your ticket will be get resolved in 24-48hrs from your ticket raise.
<p>	For assistance we might reach you through email.</p>
  </div>
  <a class="btn btn-success delay-1s" onclick="gone()">Okay</a>
  </div>
			
				
			
		<div class="table-responsive-sm container ">
	
		<table  class="table table-hover caption-top table-striped">
		<caption>
			The List is about your all tickets raised which are active and resolved kindly check on appropriate ticket which gives <code>`Red Color`</code> status for the ticket
			which is in pending state (means the <em>Ticket</em> is not resolved), else ticket be in <code class="text-success">`Green Color`</code> 
			 (means the <em>Ticket</em> is  resolved)
			
		</caption>
			<thead class="bg-dark text-light table-bordered text-center" >
				<tr>
					<th scope="col">S.No</th>
					<th scope="col">Description</th>
					<th scope="col">Date of Raise</th>
					<th scope="col">Status</th>
					<th scope="col">Days</th>
				</tr>
			</thead>
			<% Integer count = 0; %>		
			<tbody class="table-bordered text-center">
					
					<c:forEach items="${sessionScope.tdlist}"  var="ticket" >
					
					<tr>
					<th scope="row" style="text-align: center;" ><%="<b>" + ++count + "</b>" %></th>
				
					<td width="50%"><p style="white-space: pre-line"><c:out value="${ticket.description} "></c:out></p></td>
					<td><c:out value="${ticket.date}"></c:out></td>
					
					<th scope="row">
					
					<c:if test="${ticket.status =='Pending'  }">
						<p class="text-danger" ><c:out value="${ticket.status}"/></p>
					</c:if>
					<c:if test="${ticket.status =='Resolve'  }">
						<p class="text-success"><c:out value="${ticket.status}"/></p>
					</c:if>
					</th>
					<!-- 11 next 11 -> 0  -->
					<th scope="row">
						<c:if test="${ticket.status =='Pending'  }">
						<c:if test="${ticket.timediff =='0'  }">
							<p class="text-success"><c:out value="Raised ${ticket.timediff}  days ago"/></p>
							</c:if>
						<c:if test="${ticket.timediff =='1'  }">
							<p class="text-success"><c:out value="Raised ${ticket.timediff}  day ago"/></p>
							</c:if>
							<c:if test="${ticket.timediff =='2'  }">
							<p class="text-success"><c:out value="Raised ${ticket.timediff}  days ago"/></p>
							</c:if>
						<c:if test="${ticket.timediff =='3'  }">
							<p class="text-warning"><c:out value="Raised ${ticket.timediff}  days ago"/></p>
							</c:if>
							<c:if test="${ticket.timediff >='4'  }">
							<p class="text-danger"><c:out value="Raised ${ticket.timediff}  days ago"/></p>
							</c:if>
							</c:if>
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
	<script>
	var gone = () =>{
		document.getElementById("col").style.transition = "1s";
		document.getElementById("col").hidden = "true";
		document.getElementById("collapseExample").hidden = "true";
		
	}
	var notallowed = () => {
		alert('You can report if time exceeds two days')
	}
	
	
	</script>
</body>
</html>