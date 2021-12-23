<%@ page import="java.util.Objects" %>
<%@ page import="java.util.regex.Pattern" %>
<a href='registration.jsp'> registration</a>--
<a href='login.jsp'> login</a>
<center>
<%
if(session.getAttribute("isAutoRise")!=null){
	out.write("you already registration");
}else{
boolean isShowForm = true;
String login = request.getParameter("login");
String name = request.getParameter("name");
String password = request.getParameter("password");
String rePassword = request.getParameter("re-password");
String email = request.getParameter("email");
final Pattern EMAIL = Pattern.compile("^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$");
final Pattern PASSWORD = Pattern.compile("^(?=.*[0-9].*)(?=.*[A-Z].*)[0-9a-zA-Z]{4,}$");
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
	if(!login.contains(login.substring(0,1).toUpperCase())){
		isError = true;
		errorText += "<li> login with a capital letter </li>";
	}
	if(login.contains(" ")){
		isError = true;
		errorText += "<li> login with space </li>";
	}
	if(name.length() < 1){
		isError = true;
		errorText += "<li> name is empty </li>";
	}
	if(!name.contains(name.substring(0,1).toUpperCase())){
		isError = true;
		errorText += "<li> name with a capital letter </li>";
	}
	if (!PASSWORD.matcher(password).matches()) {
		isError = true;
		errorText += "<li> Invalid password: Password length at least 8 characters,<br>with at least one capital letter<br> and at least one number<br>without using special characters </li>";
		}
	if(!password.equals(rePassword)){
	isError = true;
		errorText += "<li> password and re-password do not match</li>";	
	}
	if (!EMAIL.matcher(email).matches()) {
		isError = true;
		errorText += "<li> Invalid email </li>";
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
	out.write("</br>registration success");
	isShowForm = false;
	}
}



if(isShowForm){
	%><center>
<table><tr><td>
<form action='' method='post'>
<table>
<tr><td>login</td><td><input type='text' name='login' value='<%=(login==null?"":login)%>' /></td></tr>
<tr><td>name</td><td><input type='text' name='name' value='<%=(name==null?"":name)%>'/></td></tr>
<tr><td>password</td><td><input type='password' name='password' value='<%=(password==null?"":password)%>'/></td></tr>
<tr><td>re-password</td><td><input type='password' name='re-password' value='<%=(rePassword==null?"":rePassword)%>'/></td></tr>
<tr><td>email</td><td><input type='text' name='email' value='<%=(email==null?"":email)%>'/></td></tr>
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
}
//out.write(result);
//out.write("<br>attempts: " + number);
%>