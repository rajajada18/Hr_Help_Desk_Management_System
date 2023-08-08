<%@page import="com.example.demo.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Info of ${user.lastname}</title>
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
	<jsp:include page="/WEB-INF/header/HrHeadHeader.jsp"></jsp:include>
			<p style="color: green;font-weight: bold;" hidden="true" id="savemsg">${save}</p>
		<section>
		<form action="/head/save" method="post" onsubmit="save()">
		<div class="table-responsive-sm container">
		<table  class="table table-hover caption-top table-striped">
		<caption>
			The details are about ticket raised employee and here displaying all the details of respective employee  even with sensitive login credentials such as <code class="text-danger">password</code>.			
		</caption>
			<thead class="bg-dark text-light table-bordered text-center" >
				<tr>
					<th scope="col">User Id</th>
					<th scope="col">FirstName </th>
					<th scope="col">LastName </th>
					<th scope="col">Email</th>
					<th scope="col">Password</th>
					<th scope="col">Save</th>
					
				</tr>
			</thead>
		
			<tbody class="table-bordered text-center">
				
					<tr>		
						<th class="pt-5 pb-5 " style="font-weight: bold;text-align: center;" scope="row"><input onclick="nosave()" style="font-weight: bold;text-align: center;" name="id" value="${user.id} " readonly="readonly"> </th>
					<td class="pt-5 pb-5"> <input name="firstname" value="${user.firstname}" id="firstname"></td>
					<td class="pt-5 pb-5"> <input name="lastname" value="${user.lastname }" id="lastname" > </td>
					<td class="pt-5 pb-5"> <input name="email" value="${user.email}"  width="2vh" readonly="readonly" onclick="nosave()"> </td>
					<td class="pt-5 pb-5"> <input name="password" value="${user.password}"> </td>
					<td class="pt-5 pb-5"><input class=" btn btn-success" type="submit" value="Save"> </td>					
					</tr>
				
			</tbody>
		</table>
		</div>
		</form>
	</section>
			

  <!-- ##########################INCLUDE Footer########################## -->
	<footer>
		<jsp:include page="/WEB-INF/footer/footer.jsp"></jsp:include>
	</footer>
	<script type="text/javascript">
	
	
	

	var save = () => {		
		//45days -> intern weekly --->45days interview -> java front Angular ~python~ 25k
		var msg = document.getElementById("savemsg").value
		
			alert( document.getElementById("firstname").value + " " + document.getElementById("lastname").value +" Saved successfully!");		
	}

	var nosave = () => {
		alert("You can't edit this field");
	}
	</script>
</body>
</html>