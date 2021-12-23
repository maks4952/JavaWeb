<%@ page import="java.util.Objects" %>
<%@ page import="lesson5.dao.LoginController" %>
<%! private int number = 0;%>
<%! private long startBlockingTime;%>

<head>
	<title></title>
	<meta charset="UTF-8" />
	<link href="style.css" rel="stylesheet" />
</head>
<body>
<a href='registration.jsp'> registration</a>--
<a href='login.jsp'> login</a>
<center>
<%
String logOut = request.getParameter("logOut");
if(logOut !=null){
	session.invalidate();
	session=request.getSession();
}
boolean isShowForm = true;
long unlockingTime = 7000;

String login = request.getParameter("login");
String password = request.getParameter("password");
String result = "";
if(!Objects.isNull(login)){
	
	String res = "<font color='%s'>access %s</font>";
	String color = "red";
	String access = "denied";
	String userName = new LoginController().login(login,password);
	if(userName != null){
		isShowForm = false;
		access = "allowed. Hello, " + userName;
		color = "green";
		number = 0;
		session.setAttribute("isAutoRise",true);
		
	}else {
		number++;	
	}
	
//out.write("Login: " + login + "Password: " + password);
	result = String.format(res, color, access);
	
}
if(number >= 3){
	if(number == 3){
		startBlockingTime = System.currentTimeMillis();	
	}
	unlockingTime += startBlockingTime;
	if(System.currentTimeMillis() < unlockingTime){
		isShowForm = false;
		result = "form is locked for:" + (unlockingTime - System.currentTimeMillis())/1000;
	}else{
		number = 0;
	}
	
}

if(session.getAttribute("isAutoRise")!=null){
	isShowForm = false;
	%>
	<!--<a href='login.jsp?logOut'><input type="button" value = "logOut"/></a> -->
	<form id="loginForm" action="" method="post">
	<input type = "hidden" name = "logOut"/> 
	<input type = "submit" value = "logOut"/>
	</form>
	<%
}

if(isShowForm){
	%>
	

<form id="loginForm" action="" method="post">

	<div class="field">
		<label>Enter your login:</label>
		<div class="input"><input type="text" name="login" value="" id="login" /></div>
	</div>

	<div class="field">
		<a href="#" id="forgot">Forgot your password?</a>
		<label>Enter your password:</label>
		<div class="input"><input type="password" name="password" value="" id="pass" /></div>
	</div>

	<div class="submit">
		<button type="submit">Enter</button>
		<label id="remember"><input name="" type="checkbox" value="" /> Remember me</label>
	</div>

</form>

</body>
</html>
	<%
}
out.write(result);
out.write("<br>attempts: " + number);
%>