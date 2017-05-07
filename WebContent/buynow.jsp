<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.sql.*" %>
    
     <%
    String URL = "jdbc:mysql://localhost:3306/grocery_DB";
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String USER = "tazeen";
    String PASS = "kitkat";
    Connection conn=null;
    try {
    	Class.forName(JDBC_DRIVER);
		conn = DriverManager.getConnection(URL,USER,PASS);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} 
 %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shipment</title>
<link rel="stylesheet" type="text/css" href="./css/sign_up.css">
</head>
<body>

<ul class="nav">
			<li><a href="index.html" target="">Home</a></li>
			<li><a href="categories.jsp" target="">Categories</a></li>
			<li><a href="About Us.html" target="">About Us</a></li>
			<li><a href="ContactUs.html" target="">Contact Us</a></li>
		</ul>

	<div id="Sign-Up"> 
		<fieldset style="width:30%">
			<legend>Create an account</legend> 
			<form method="GET" action="groceryServlet"> 
				<table class="center" border="0"> <tr> 
						<td>Name</td>
						<td> <input type="text" name="name" placeholder="name"></td>
 						</tr> 
 						<tr> <td>Email</td>
 						<td> <input type="email" name="email" placeholder="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" /></td> </tr>
 						<tr> <td>Phone Number</td><td>
 						<input type="tel" name="phone" placeholder="phone" pattern="[0-9]{10}"></td> </tr> 
 						<tr> <td>Address</td><td>
 						<input type="text" name="address" placeholder="address"></td> </tr> 
 						
 						<input type="hidden" value="<%= request.getParameter("id") %>" name="id"/>
						<input type="hidden" value="<%= request.getParameter("quantity") %>" name="quantity"/>
						
						 <tr> <td><a href = "groceryServlet.java" target = ""><input id="button" type="submit" name="submit" value="Buy Now"></a></td> </tr> 					 
 				</table> 
 	 		</form> 
 		</fieldset> 
 	</div> 
   </body>
</html>

<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.sql.*" %>
    
     <%
    String URL = "jdbc:mysql://localhost:3306/grocery_DB";
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String USER = "tazeen";
    String PASS = "kitkat";
    Connection conn=null;
    try {
    	Class.forName(JDBC_DRIVER);
		conn = DriverManager.getConnection(URL,USER,PASS);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} 
 %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shipment</title>
<link rel="stylesheet" type="text/css" href="./css/sign_up.css">
</head>
<body>

<ul class="nav">
			<li><a href="index.html" target="">Home</a></li>
			<li><a href="categories.jsp" target="">Categories</a></li>
			<li><a href="About Us.html" target="">About Us</a></li>
			<li><a href="ContactUs.html" target="">Contact Us</a></li>
		</ul>

	<div id="Sign-Up"> 
		<fieldset style="width:30%">
			<legend>Create an account</legend> 
			<form method="GET" action="groceryServlet"> 
				<table class="center" border="0"> <tr> 
						<td>Name</td>
						<td> <input type="text" name="name" placeholder="name"></td>
 						</tr> 
 						<tr> <td>Email</td>
 						<td> <input type="email" name="email" placeholder="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" /></td> </tr>
 						<tr> <td>Phone Number</td><td>
 						<input type="tel" name="phone" placeholder="phone" pattern="[0-9]{10}"></td> </tr> 
 						<tr> <td>Address</td><td>
 						<input type="text" name="address" placeholder="address"></td> </tr> 
 						
 						<input type="hidden" value="<%= request.getParameter("id") %>" name="id"/>
						<input type="hidden" value="<%= request.getParameter("quantity") %>" name="quantity"/>
						
						 <tr> <td><a href = "groceryServlet.java" target = ""><input id="button" type="submit" name="submit" value="Buy Now"></a></td> </tr> 					 
 				</table> 
 	 		</form> 
 		</fieldset> 
 	</div> 
   </body>
</html> --%>