<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Report Raise</title>
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

<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">
	<style type="text/css">
	@media (min-width: 1025px) {
  .h-custom {
    height: 100vh !important;
  }  
}
section #sec{
background-color: #8EC5FC;
background-image: linear-gradient(62deg, #8EC5FC 0%, #E0C3FC 100%);

}
div textarea{
background-color: #D9AFD9;
background-image: linear-gradient(0deg, #D9AFD9 0%, #97D9E1 100%);
overflow: hidden;
}

         .btn-grad {background-image: linear-gradient(to right, #3CA55C 0%, #B5AC49  51%, #3CA55C  100%)}
         .btn-grad {
            margin: 10px;
            padding: 15px 45px;
            text-align: center;
            text-transform: uppercase;            
            background-size: 200% auto;
            color: white;            
            box-shadow: 0 0 20px #eee;
            border-radius: 10px;
            display: block;
            transition: linear 0.5s;
          }

          .btn-grad:hover {
            background-position: right center; /* change the direction of the change here */
            color: #fff;
            text-decoration: none;
          }
          
          #select{
          
          }
	section  #ticket{ 
   
    background-clip: padding-box; 
         }
         /* CSS */

	</style>
</head>
<body style="background-color: #8fc4b7;">
<jsp:include page="/WEB-INF/header/userheader.jsp"/>
	<!-- ###############################CODE STARTS HERE##########################################  -->
	
	
	
	
	<section class="h-100 vh-99 h-custom mb-3 " >
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100" >
      <div class="col-lg-8 col-xl-6"  >
        <div class="card rounded-3" style="box-shadow: rgba(0, 0, 0, 0.35) 0px -50px 36px -28px inset;" id="sec">
          <img src="/jsp/report.png" class="w-20 mt-3" style="width: 110px;box-shadow: rgba(0, 0, 0, 0.09) 0px 2px 1px, rgba(0, 0, 0, 0.09) 0px 4px 2px, rgba(0, 0, 0, 0.09) 0px 8px 4px, rgba(0, 0, 0, 0.09) 0px 16px 8px, rgba(0, 0, 0, 0.09) 0px 32px 16px;height: 110px;border-radius:50% ;margin-left: 40%;color: white;background-color: #8fc4b7;opacity: 0.9  " alt="Report photo">
          <div class="card-body p-4 p-md-5">
            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 px-md-2 text-center fs-1 btn-floating btn-rounded" id="ticket">Report Raise</h3>

            <form class="px-md-2" action="/report/raise" method="post">
              

              <div class="row">
                <div class="col-md-6 mb-4">

                  <div class="form-outline datepicker w-100  text-left container-fluid"  >
                    <input
                      type="date"
                      class="form-control "
                      id="datepicker"
                      name="date"               
                      placeholder="Select Date"
                      required="required"
                      style="width: 200x;text-align: left;display: none;"
                    />
                    
                  </div>

                </div>
            	
              </div>


              <div class="mb-4 text-center dropdown btn-outline-secondary" hidden="true">

                <select class="select containter p-3 pl-5 pr-5 text-center w-100 dropdown-toggle" id="select" name="type"  >
                  <option value="Select" disabled class="bg-dark">Select Issue Type</option>
                  <option value="Account" >Personal Account Issue</option>
                  <option value="Technical" >Technical Issue</option>
                  <option value="Asset" >Asset Issue</option>
                  <option value="Payment">Payment Issue</option>
                  <option value="Payment">Expenses Issue</option>
                  <option value="Payment">Loss of pay</option>
                  <option value="Payment">Other Permissions</option>
                  <option value="Other" selected="selected" >Other Issue</option>
                </select>

              </div>

              <div class="row mb-4 pb-2 pb-md-0 mb-md-5">
                <div class="col-md-6">

                  <div class="form-outline bg-outline-primary"   >
                   <textarea rows="10" cols="50" placeholder="Describe your issue here" class="text-dark" name="description" style="white-space: pre-wrap;"></textarea>
                  </div>

                </div>
              </div>

              <button type="submit" id="button-71" class="btn btn-grad btn-lg mb-1 btn-floating ">Report</button>
			 <button type="button" onclick="history.back()" class="btn bg-dark text-right text-light btn-lg mb-1 btn-floating ">Back</button>
            </form>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>
	
	
	
	
	
	<!-- ##############################CODE ENDS HERE###########################################  -->
	<footer >
		<jsp:include page="/WEB-INF/footer/footer.jsp"></jsp:include>
	</footer>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
	<script type="text/javascript">
	//document.getElementById('datePicker').valueAsDate = new Date().toDateInputValue();
	var d = new Date();
	var dateControl = document.querySelector('input[type="date"]');
	dateControl.value = moment(d).format('YYYY-MM-DD');
	</script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
	<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
</body>
</html>