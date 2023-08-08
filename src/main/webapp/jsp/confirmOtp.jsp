<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

#otpdiv{
    background: #141E30;  /* fallback for old browsers */
    background: -webkit-linear-gradient(to right, #243B55, #141E30);  /* Chrome 10-25, Safari 5.1-6 */
    background: linear-gradient(to right, #243B55, #141E30); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */


}
#otpdiv h3{
    background: #2C3E50;  /* fallback for old browsers */
    background: -webkit-linear-gradient(to right, #4CA1AF, #2C3E50);  /* Chrome 10-25, Safari 5.1-6 */
    background: linear-gradient(to right, #4CA1AF, #2C3E50); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

}

#otpdiv form #text{
    height: 5vh;
    
}
body{
    background: #808080;  /* fallback for old browsers */
    background: -webkit-linear-gradient(to right, #3fada8, #808080);  /* Chrome 10-25, Safari 5.1-6 */
    background: linear-gradient(to right, #3fada8, #808080); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

}

#submit{
    transition: all 0.8s;
    margin-right: 20vh;
    width: 20%;
}


#submit:hover{
background: #3b4350;
color: lightgray;
}


</style>
</head>
<body>
<jsp:include page="/WEB-INF/header/RegisterHeader.jsp"></jsp:include>

<section>
    <div id="otpdiv" style="margin: 20vh 50vh;padding-bottom: 20vh; ">
        
        <h3 style="color: lightgreen;margin: auto;text-align: center;padding-top: 3vh;padding-bottom: 3vh;">OTP Confirmation Page</h3>
        <hr style="padding-bottom: 10vh;height: 2px">
    
    <form style="text-align: center;" action="checkOtp" method="post">
        <input type="text" placeholder="Enter your OTP here" style="width: 20vw;text-align: center;background: lightgray;font-weight: 600;" id="text" name="otp">
        <pre style="font-weight: 400;color: rgb(18, 243, 18);padding-top: 5px;"> <span style="color: red;">* </span>We have sent you a otp to <%-- <!--<%gmail%> > -->  --%>         
            kindly enter otp and click on enter</pre>
            <marquee style="color: whitesmoke;">Check spam or promotional also incase of otp is not there in <b>Inbox</b></marquee>
            <input id="submit" type="submit" style="justify-content: right;text-align: center;font-weight: 500;height: 5vh;">
            <br><br>
            <p style="color: red;font-weight: 500;">${incorrectOtp}</p>
    </form>
</div>
</section>
</body>
</html>