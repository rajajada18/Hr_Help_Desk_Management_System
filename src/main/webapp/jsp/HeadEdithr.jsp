<%@page import="com.example.demo.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Info of ${hr.name}</title>
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
		 position: fixed;
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
	<jsp:include page="/WEB-INF/header/HrHeadHrNav.jsp"></jsp:include>
	
		<%if(request.getSession().getAttribute("Edithr")!=""){ %>
${Edithr}
<%} %>
<% request.getSession().setAttribute("Edithr", ""); %>
		<section>
		<form action="/head/hredit" method="post" onload="save()">
		<div class="table-responsive-sm container">
		<table  class="table table-hover caption-top table-striped">
		<caption>
			Here you can edit <code>Name,Password</code> but not <span class="text-danger">HR-Id, Email </span> of hr	data.		
		</caption>
			<thead class="bg-dark text-light table-bordered text-center" >
				<tr>
					<th scope="col">HR Id</th>
					<th scope="col">Name </th>
					<th scope="col">Email</th>
					<th scope="col">Password</th>
					<th scope="col">Save</th>
					
				</tr>
			</thead>
		
			<tbody class="table-bordered text-center">
				
					<tr>		
						<th class="pt-5 pb-5 " style="font-weight: bold;text-align: center;" scope="row"><input onclick="nosave()" style="font-weight: bold;text-align: center;" name="id" value="${hr.id} " readonly="readonly"> </th>
					<td class="pt-5 pb-5"> <input name="name" value="${hr.name}" id="firstname"></td>
					<td class="pt-5 pb-5"> <input name="email" value="${hr.email}"  width="2vh" readonly="readonly" onclick="nosave()"> </td>
					<td class="pt-5 pb-5"> <input name="password" value="${hr.password}"> </td>
					<td class="pt-5 pb-5"><input class=" btn btn-success" type="submit" value="Save"> </td>					
					</tr>
				
			</tbody>
		</table>
		<p class="text-danger btn-outline-dark">${unsave }</p>
		</div>
		</form>
	</section>
			

  <!-- ##########################INCLUDE Footer########################## -->
	<footer>
		<jsp:include page="/WEB-INF/footer/footer.jsp"></jsp:include>
	</footer>
	<script type="text/javascript">
	
	
	


	var nosave = () => {
		alert("You can't edit this field");
	}
	</script>
</body>
</html>