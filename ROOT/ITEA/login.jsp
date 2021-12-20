<%@ page import="java.util.Objects" %>
<%

boolean isShowForm = true;


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
	}
//out.write("Login: " + login + "Password: " + password);
	result = String.format(res, color, access);
	
}
if(isShowForm){
	%>
	<form action='login.jsp'>
	<input type='text' name='login' />
	<input type='text' name='password' />
	<input type='submit' value='SEND' />
	</form>
	<%
}
out.write(result);
%>