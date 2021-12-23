<%@ page import="java.util.Objects" %>
<%@ page import="lesson5.Registration" %>
<a href='registration.jsp'> registration</a>--
<a href='login.jsp'> login</a>
<%
if(session.getAttribute("isAutoRise")!=null){
	out.write("you already registration");
}else{
boolean isShowForm = true;

String errorText = "<ul>";
String login = request.getParameter("login");
String password = request.getParameter("password");
String rePassword = request.getParameter("re-password");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String address = request.getParameter("address");
String comment = request.getParameter("comment");
String agree = request.getParameter("agree");


if(!Objects.isNull(login) && !Objects.isNull(password)){
	Registration regist = new Registration();
	isShowForm = regist.registration1(login, password, rePassword, name, gender, address, comment, agree);
	errorText += regist.getError();
	errorText += "</ul>";
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
}
//out.write(result);
//out.write("<br>attempts: " + number);
%>