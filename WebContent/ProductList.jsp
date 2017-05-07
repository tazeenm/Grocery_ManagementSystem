<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<%
	String URL = "jdbc:mysql://localhost:3306/grocery_DB";
	String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	String USER = "tazeen";
	String PASS = "kitkat";
	Connection conn = null;
	try {
		Class.forName(JDBC_DRIVER);
		conn = DriverManager.getConnection(URL, USER, PASS);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/ProductList.css">
<title>Fruits and Vegetables</title>
</head>
<body>
	<ul class="nav">
		<li><a href="index.html" target="">Home</a></li>
		<li><a href="categories.jsp" target="">Categories</a></li>
		<li><a href="About Us.html" target="">About Us</a></li>
		<li><a href="ContactUs.html" target="">Contact Us</a></li>
	</ul>
	<form method="GET" action="ProductList.jsp" id="searchform">
		<input type="text" name="search"> <input type="submit"
			name="submit" value="Search">
	</form>
	<%
		String query = "SELECT * FROM product_details WHERE ";
		if (request.getParameter("id") != null) {
			int catId = Integer.parseInt(request.getParameter("id"));
			query += "cat_id=" + catId;
		} else if (request.getParameter("search") != null) {
			String searchString = request.getParameter("search");
			query += "product_name LIKE '%" + searchString + "%'";
		}
		System.out.println("Query: " + query);
		ResultSet rs = conn.createStatement().executeQuery(query);
	%>
	<ul class="wrapper">
		<%
			while (rs.next()) {
				int id = rs.getInt("product_id");
		%>
		<li class="box"><a href="ProductInfo.jsp?id=<%=id%>"><img
				src="./Images/<%=rs.getString("prod_img")%>"
				alt="<%=rs.getString("product_name")%>"
				style="width: 150px; height: 150px;"> <%=rs.getString("product_name")%></a></li>
		<%
			}
		%>
	</ul>
</body>
</html>

<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<%
	String URL = "jdbc:mysql://localhost:3306/grocery_DB";
	String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	String USER = "tazeen";
	String PASS = "kitkat";
	Connection conn = null;
	try {
		Class.forName(JDBC_DRIVER);
		conn = DriverManager.getConnection(URL, USER, PASS);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/ProductList.css">
<title>Fruits and Vegetables</title>
</head>
<body>
	<ul class="nav">
		<li><a href="index.html" target="">Home</a></li>
		<li><a href="categories.jsp" target="">Categories</a></li>
		<li><a href="About Us.html" target="">About Us</a></li>
		<li><a href="ContactUs.html" target="">Contact Us</a></li>
	</ul>
	<form method="GET" action="ProductList.jsp" id="searchform">
		<input type="text" name="search"> <input type="submit"
			name="submit" value="Search">
	</form>
	<%
		String query = "SELECT * FROM product_details WHERE ";
		if (request.getParameter("id") != null) {
			int catId = Integer.parseInt(request.getParameter("id"));
			query += "cat_id=" + catId;
		} else if (request.getParameter("search") != null) {
			String searchString = request.getParameter("search");
			query += "product_name LIKE '%" + searchString + "%'";
		}
		System.out.println("Query: " + query);
		ResultSet rs = conn.createStatement().executeQuery(query);
	%>
	<ul class="wrapper">
		<%
			while (rs.next()) {
				int id = rs.getInt("product_id");
		%>
		<li class="box"><a href="ProductInfo.jsp?id=<%=id%>"><img
				src="./Images/<%=rs.getString("prod_img")%>"
				alt="<%=rs.getString("product_name")%>"
				style="width: 150px; height: 150px;"> <%=rs.getString("product_name")%></a></li>
		<%
			}
		%>
	</ul>
</body>
</html> --%>