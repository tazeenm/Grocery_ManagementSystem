
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
<title>Categories</title>
<link rel="stylesheet" type="text/css" href="./css/categories.css">
</head>
<body>
		<ul class="nav">
			<li><a href="index.html" target="">Home</a></li>
			<li><a href="categories.jsp" target="">Categories</a></li>
			<li><a href="About Us.html" target="">About Us</a></li>
			<li><a href="ContactUs.html" target="">Contact Us</a></li>
		</ul>
		<form  method="GET" action="ProductList.jsp"  id="searchform"> 
	      <input  type="text" name="search"> 
	      <input  type="submit" name="submit" value="Search"> 
	    </form>

		<h1>Hello Again..</h1>
		<p>Choose from a wide range of fresh products.</p>
		<p>You can search for a particular item by category or type the name of the product in our search bar on the top left corner of the screen.</p>
		<p>Please choose a category from below :</p>
		<ul>
		<%
			String query = "SELECT * FROM category";
			ResultSet rs = conn.createStatement().executeQuery(query);
			while(rs.next()) {
				int id=rs.getInt("category_id");
		%>
		
			<li><a href="ProductList.jsp?id=<%=id %>" target=""><%=rs.getString("category_name") %></a></li>
			<%} %>				
		</ul>
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
<title>Categories</title>
<link rel="stylesheet" type="text/css" href="./css/categories.css">
</head>
<body>
		<ul class="nav">
			<li><a href="index.html" target="">Home</a></li>
			<li><a href="categories.jsp" target="">Categories</a></li>
			<li><a href="About Us.html" target="">About Us</a></li>
			<li><a href="ContactUs.html" target="">Contact Us</a></li>
		</ul>
		<form  method="GET" action="ProductList.jsp"  id="searchform"> 
	      <input  type="text" name="search"> 
	      <input  type="submit" name="submit" value="Search"> 
	    </form>

		<h1>Hello Again..</h1>
		<p>Choose from a wide range of fresh products.</p>
		<p>You can search for a particular item by category or type the name of the product in our search bar on the top left corner of the screen.</p>
		<p>Please choose a category from below :</p>
		<ul>
		<%
			String query = "SELECT * FROM category";
			ResultSet rs = conn.createStatement().executeQuery(query);
			while(rs.next()) {
				int id=rs.getInt("category_id");
		%>
		
			<li><a href="ProductList.jsp?id=<%=id %>" target=""><%=rs.getString("category_name") %></a></li>
			<%} %>				
		</ul>
</body>
</html> --%>