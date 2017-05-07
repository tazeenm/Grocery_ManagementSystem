<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/sign_up.css">
<title>Admin Login</title>
</head>
<body>
	<%
		String stat = (String)session.getAttribute("Admin");	
		if(stat != null && stat.equals("1")){
			response.sendRedirect("adminPage.jsp");
		}
		String status = request.getParameter("status");

		if(status != null && status.equals("1")){
			%>WRONG PASSWORD<%
		}else if(status != null && status.equals("2")){
			%>WRONG PASSWORD AGAIN!<%
		}
	%>
	<form action="AdminLog" method="GET">
	<div id="Sign-Up"> 
		<fieldset style="width:30%">
	<table class="center" border="0"> <tr> 
		<td><font color=white>Username: </font><input type="text" name="username"/><br/></td>
		</tr> 
		<tr> <td><font color=white>Password:</font><input type="password" name="password"/><br/></td> </tr>
		<tr><td><input type="submit" value="login"/></td></tr>
		</table>
	</form>
</body>
</html>

<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/sign_up.css">
<title>Admin Login</title>
</head>
<body>
	<%
		String stat = (String)session.getAttribute("Admin");	
		if(stat != null && stat.equals("1")){
			response.sendRedirect("adminPage.jsp");
		}
		String status = request.getParameter("status");

		if(status != null && status.equals("1")){
			%>WRONG PASSWORD<%
		}else if(status != null && status.equals("2")){
			%>WRONG PASSWORD AGAIN!<%
		}
	%>
	<form action="AdminLog" method="GET">
	<div id="Sign-Up"> 
		<fieldset style="width:30%">
	<table class="center" border="0"> <tr> 
		<td>Username: <input type="text" name="username"/><br/></td>
		</tr> 
		<tr> <td>Password: <input type="password" name="password"/><br/></td> </tr>
		<tr><td><input type="submit" value="login"/></td></tr>
		</table>
	</form>
</body>
</html> --%>