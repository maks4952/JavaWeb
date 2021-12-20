<%@ page import="java.util.Objects" %>
<%! private int number = 0;%>
<%! private long startBlockingTime;%>

<a href='registration.jsp'> registration</a>--
<a href='login.jsp'> login</a>
<%

boolean isShowForm = true;
long unlockingTime = 7000;

String login = request.getParameter("login");
String password = request.getParameter("password");
String result = "";
if(!Objects.isNull(login)){
	
	String res = "<font color='%s'>access %s</font>";
	String color = "red";
	String access = "denied";
	if( Objects.equals(login, "max") && Objects.equals(password, "123")){
		isShowForm = false;
		access = "allowed";
		color = "green";
		number = 0;
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


if(isShowForm){
	%>
	<form action='login.jsp' method='post'>
	<input type='text' name='login' />
	<input type='text' name='password' />
	<input type='submit' value='SEND' />
	</form>
	<%
}
out.write(result);
out.write("<br>attempts: " + number);
%>