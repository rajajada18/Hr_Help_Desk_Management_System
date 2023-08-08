<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isErrorPage="false" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error Page</title>
</head>
<body>
	
	<center>
	
	<h3 style="margin-top: 20%;color: red;font-family: sans-serif;">	Sorry, something went wrong...	<span id="time"></span>	</h3>
	<% response.setHeader("Refresh", "6;/jsp/error2.jsp"); %>
	</center>
<script type="text/javascript">
function startTimer(duration, display) {
    var timer = duration, minutes, seconds;
    setInterval(function () {
        minutes = parseInt(timer / 60, 10)
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.textContent = minutes + ":" + seconds;

        if (--timer < 0) {
            timer = duration;
        }
    }, 1000);
}

window.onload = function () {
    var fiveMinutes = 6 ,
        display = document.querySelector('#time');
    startTimer(fiveMinutes, display);
};
</script>
</body>
</html>