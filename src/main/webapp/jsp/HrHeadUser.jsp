<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
<script type="text/javascript">
#myInput {
	  background-image: url('/css/searchicon.png'); /* Add a search icon to input */
	  background-position: 10px 12px; /* Position the search icon */
	  background-repeat: no-repeat; /* Do not repeat the icon image */
	  width: 100%; /* Full-width */
	  font-size: 16px; /* Increase font-size */
	  padding: 12px 20px 12px 40px; /* Add some padding */
	  border: 1px solid #ddd; /* Add a grey border */
	  margin-bottom: 12px; /* Add some space below the input */
	}

	#myTable {
	  border-collapse: collapse; /* Collapse borders */
	  width: 100%; /* Full-width */
	  border: 1px solid #ddd; /* Add a grey border */
	  font-size: 18px; /* Increase font-size */
	}

	#myTable th, #myTable td {
	  text-align: left; /* Left-align text */
	  padding: 12px; /* Add padding */
	}

	#myTable tr {
	  /* Add a bottom border to all table rows */
	  border-bottom: 1px solid #ddd;
	}

	#myTable tr.header, #myTable tr:hover {
	  /* Add a grey background color to the table header and on hover */
	  background-color: #f1f1f1;
	}
</script>
</head>
<body>

		<!-- ##########################INCLUDE HEADER ########################## -->
	<jsp:include page="/WEB-INF/header/HrHeadUserNav.jsp"></jsp:include>
		<section>
		
	<%if(request.getSession().getAttribute("regMessage")!=""){ %>
${regMessage}
<%} %>
<% request.getSession().setAttribute("regMessage", ""); %>
		<div class="table-responsive-sm container">
		<table id="myTable"   class="table table-sm table-hover caption-top table-striped">
		<caption>
			This table is about User-data consists of <code>User-Id, Full Name, Email, Password</code> and also you can   <span class="text-green ">edit </span> or  <span class="text-danger ">delete </span> particular User.			
		</caption>
			<thead class="bg-dark text-light table-bordered text-center" >
				<tr>
					<th scope="col">User Id</th>
					<th scope="col">Full Name </th>
					<th scope="col">Email</th>
					<th scope="col">Password</th>
					<th scope="col">Update Details</th>
					<th scope="col">Delete</th>
				</tr>
			</thead>
		
			<tbody class="table-bordered text-center">
						<c:forEach items="${sessionScope.user}" var="user">
					<tr>		
					<th class="pt-5 pb-5 " style="font-weight: bold;" scope="row">${user.id} </th>
					<td class="pt-5 pb-5" id="name">${user.firstname} ${user.lastname }</td>
					<td class="pt-5 pb-5" >${user.email}</td>
					<td class="pt-5 pb-5">${user.password}</td>
					<td class="pt-5 pb-5"><a class="btn btn-warning" href="/head/edit2/${user.id }">Edit</a></td>
					<td class="pt-5 pb-5"><a class="btn btn-danger" href="/head/listdelete/${user.id }" onclick="return ask()">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
	</section>
			

  <!-- ##########################INCLUDE Footer########################## -->
	<footer>
		<jsp:include page="/WEB-INF/footer/footer.jsp"></jsp:include>
	</footer>
	<script>

		var ask = () => {
			var res = confirm("Are you sure you want to delete ?")
			console.log(res);
			return res;
		}
		
		function myFunction() {
			  // Declare variables
			  var input, filter, table, tr, td, i, txtValue;
			  input = document.getElementById("myInput");
			  filter = input.value.toUpperCase();
			  table = document.getElementById("myTable");
			  tr = table.getElementsByTagName("tr");

			  // Loop through all table rows, and hide those who don't match the search query
			  for (i = 0; i < tr.length; i++) {
			    td = tr[i].getElementsByTagName("td")[0];
			    if (td) {
			      txtValue = td.textContent || td.innerText;
			      if (txtValue.toUpperCase().indexOf(filter) > -1) {
			        tr[i].style.display = "";
			      } else {
			        tr[i].style.display = "none";
			      }
			    }
			  }
			}

	</script>
</body>
</html>