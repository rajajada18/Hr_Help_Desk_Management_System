<%@page import="com.example.demo.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%UserBean user = (UserBean)request.getSession().getAttribute("user");
out.println(user.getLastname());%></title>
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
body{
background-color: #b8ddf780;
background-image: linear-gradient(0deg, #c5afd9 50%, #97D9E1 100%);
}
.divi{

padding-bottom: 4vh;
}
table{
  margin-left: 20%; 
  
}
table tbody tr th{
  padding-top: 50px;
 text-align: left;
 transition: all 1s;
 text-decoration: underline; 
 font-weight: 900
}
table tbody tr td{
  padding-top: 15px;
  text-align: left;
  transition: all 1s;
  }
table tbody tr td:hover{
  transform: scale(1.5) translateX(20%);
  box-shadow: 0 0 black;
  color: rgb(236, 94, 51);  
  background: rgba(235, 194, 194, 0.3);
  overflow: hidden;
  text-align: left;
  margin-top: 20px;
 
}

table tbody tr td input:hover{
	outline: none;
}

table tbody tr td input{
	outline: none;
	border: none;
	border-bottom: 5px solid rgb(69, 134, 231);
	font-weight: 600;
	cursor: none;
}
table tbody tr td a:hover{
  transform: scale(1.2) ;
  color: rgb(236, 156, 51);  
  overflow: hidden;
  text-align: left;
}
table tbody tr th:hover {
	color: rgb(201, 74, 74);
	transform: rotate3d(10deg);
	font-weight: 900;
	
}
#circle{
	border-radius: 50%;
	background: rgb(126, 126, 126);
	margin-left: 20%;
	overflow: hidden;
}

#circle #firstchar{
text-align: center;
margin-top: 25%;
font-weight: 500;
font-size: 7vh;
transition: all 0.7s;
color: whitesmoke;
}

#circle #firstchar:hover{
 transform:scale(1.2);
 cursor: pointer;
}
</style>
</head>
<body>
<!-- ##########################INCLUDE HEADER ########################## -->
	<jsp:include page="/WEB-INF/header/userheader.jsp"/>
	
	<!-- ##########################INCLUDE CODE########################## -->
	<div class="divi" style="">
		<div style="width: 150px;height: 150px;border: 2px black solid;" id="circle" title="<%=user.getLastname()%>" draggable="true">
			<p id="firstchar" class="animated tada h-100" ><%=user.getLastname().charAt(0) %></p>
		</div>
		<table  style="justify-content: center;">
		<tbody>

		  <tr>
		  <th id= "firstname" style="padding-right: 5vh;font-family: serif;font-size: 3vh;text-align: left"> First Name </th>
		  </tr>
		  <tr>
		  <td style="font-weight: 500"><input type="text" readonly value="<%=user.getFirstname() %>"></td>
		  </tr>
		   <tr>
		  <th style="padding-right: 5vh;font-family: serif;font-size: 3vh;text-align: left"> Last Name </th>
		  </tr>
		  <tr>
		  <td style="font-weight: 500"><input type="text" readonly value="<%=user.getLastname() %>" > </td>
		  </tr>

		   <tr>
		  <th style="padding-right: 5vh;font-family: serif;font-size: 3vh;text-align: left"> Email </th>
		  </tr>
		  <tr>
		  <td style="font-weight: 500"><input type="text" style="width: 69%;" readonly value="<%=user.getEmail() %>"></td>
		  </tr>
		    <tr>
		  <th style="padding-right: 5vh;font-family: serif;font-size: 3vh;text-align: left"> Last Ticket Raised </th>
		  </tr>
		  <tr>
		  <td style="font-weight: 800;" onmouseenter="change()" onmouseleave="againchange()"><a href="viewTickets" title="
			<%
			String str = (String)request.getAttribute("ticket");
		  if(str.contains("Resolve")){
			  out.print("resolved");
		  }
		  else if(str.contains("Pending")){
			  out.print("pending");
		  }
		  else{
			out.print("No Tickets!!");
		  }
			%>
			" style="text-decoration: none;color: black" id="anchor" >${ticket}</a> </td>
		  </tr>		
		</tbody>
		<tbody>

			<tr>
				<th style="padding-right: 5vh;font-family: serif;font-size: 3vh;text-align: left">
					Report To Change Your Details: 
				<br>
			
					<a href="report" class="btn btn-primary text-light fw-bold" style="font-weight: 500">Report</a>
				</th>
			</tr>
		</tbody>
		</table>
	</div>
	  <!-- ##########################INCLUDE Footer########################## -->
	<footer style="margin-top: 10% ">
		<jsp:include page="/WEB-INF/footer/footer.jsp"/>
	</footer>
	<script>
		function change() {
			document.getElementById("anchor").style.color = " rgb(236, 94, 51) ";
			
		}
		function againchange() {
			document.getElementById("anchor").style.color = "black";
		}
	</script>
</body>
</html>