<%@ page import="java.util.Objects" %>
<a href='registration.jsp'> registration</a>--
<a href='login.jsp'> login</a>
<%
boolean isShowForm = true;
String login = request.getParameter("login");
String password = request.getParameter("password");
String rePassword = request.getParameter("re-password");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String address = request.getParameter("address");
String comment = request.getParameter("comment");
String agree = request.getParameter("agree");
String errorText = "<ul>";
errorText += "</ul>";
boolean isError = false;

if(!Objects.isNull(login)){
	if(login.length() < 1){
		isError = true;
		errorText += "<li> login is empty </li>";
	}
	if(password.length() < 1){
		isError = true;
		errorText += "<li> password is empty </li>";
	}
	if(rePassword.length() < 1){
		isError = true;
		errorText += "<li> re-password is empty </li>";
	}
	if(name.length() < 1){
		isError = true;
		errorText += "<li> name is empty </li>";
	}
	if(Objects.isNull(gender) || gender.length() < 1 ){
		isError = true;
		errorText += "<li> gender is empty </li>";
	}
	if(address.length() < 1){
		isError = true;
		errorText += "<li> address is empty </li>";
	}
	if(comment.length() < 1){
		isError = true;
		errorText += "<li> comment is empty </li>";
	}
	if(Objects.isNull(agree)){
		isError = true;
		errorText += "<li> agree is empty </li>";
	}
	if(!isError){
	out.write("registration success");
	isShowForm = false;
	}
}


if(isShowForm){
	%><center>
<table><tr><td>
<form action='' method='post'>
<table>
<tr><td>login</td><td><input type='text' name='login' value='<%=(login==null?"":login)%>' /></td></tr>
<tr><td>password</td><td><input type='password' name='password' value='<%=(password==null?"":password)%>'/></td></tr>
<tr><td>re-password</td><td><input type='password' name='re-password' value='<%=(rePassword==null?"":rePassword)%>'/></td></tr>
<tr><td>name</td><td><input type='text' name='name' value='<%=(name==null?"":name)%>'/></td></tr>
<tr><td>gender</td><td>M<input type='radio' name='gender' value='male' <%=(Objects.equals(gender, "male")?"checked":"")%>/>F<input type='radio' name='gender' value='female'  <%=(Objects.equals(gender, "female")?"checked":"")%> /></td></tr>
<tr><td>address</td><td><select  name='address' > 
<option value='DNR' <%=(Objects.equals(address, "DNR")?"selected":"")%>>DNR</option>
<option value='LNR' <%=(Objects.equals(address, "LNR")?"selected":"")%>>LNR</option>
<option value='Crimea' <%=(Objects.equals(address, "Crimea")?"selected":"")%>>Crimea</option>
</select>
</td></tr>
<tr><td>comment</td><td><textarea rows='10' cols='25' name='comment'><%=(comment==null?"":comment)%></textarea></td></tr>
<tr><td>i agree to instal amigobrowser</td><td><input type='checkbox' name='agree' /></td></tr>
<tr><td></td><td><input type='submit' value='SEND' /></td></tr>

<!--<tr><td>name</td><td><input type='text' name='name' /></td></tr>
	
	
	<input type='submit' value='SEND' />-->
</table>
</form>
</td><td><%out.write(errorText);%></td>
</tr></table>
	<%
}
//out.write(result);
//out.write("<br>attempts: " + number);
%>