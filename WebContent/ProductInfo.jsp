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
<link rel="stylesheet" type="text/css" href="./css/desc.css">
<title>Order Summary</title>
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
	    
	    <h1>Product Details</h1>
	    	    
	    <%
	    int prodId = Integer.parseInt(request.getParameter("id"));
	    String name = "SELECT * from product_details where product_id = " + prodId; 
	    
	    ResultSet rs = conn.createStatement().executeQuery(name);
	    while(rs.next()){
	    %>
	    <div align= "center">
	    	 <img src="./Images/<%=rs.getString("prod_img")%>" alt="<%=rs.getString("product_name") %>"style="width:250px; height:250px;"/>
	    </div>	    
	    <h3>Product Chosen : <%=rs.getString("product_name") %></h3>
	    <h3>Description : <%=rs.getString("product_desc") %></h3>
	    <h3>Price : Rs.<%=rs.getString("product_price") %></h3>
	    <form action="buynow.jsp" method="GET">
	    	<label>Quantity: <input type="number" name="quantity" min="1" max="100"/></label><br/>
	    	<input type="hidden" value="<%=rs.getInt("product_id") %>" name = "id"/>
	    	<input type="submit" value="Buy Now"/>
	    </form>
	    <%} %>
		
	    
	   
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
<link rel="stylesheet" type="text/css" href="./css/desc.css">
<title>Order Summary</title>
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
	    
	    <h1>Product Details</h1>
	    	    
	    <%
	    int prodId = Integer.parseInt(request.getParameter("id"));
	    String name = "SELECT * from product_details where product_id = " + prodId; 
	    
	    ResultSet rs = conn.createStatement().executeQuery(name);
	    while(rs.next()){
	    %>
	    <div align= "center">
	    	 <img src="./Images/<%=rs.getString("prod_img")%>" alt="<%=rs.getString("product_name") %>"style="width:250px; height:250px;"/>
	    </div>	    
	    <h3>Product Chosen : <%=rs.getString("product_name") %></h3>
	    <h3>Description : <%=rs.getString("product_desc") %></h3>
	    <h3>Price : Rs.<%=rs.getString("product_price") %></h3>
	    <form action="buynow.jsp" method="GET">
	    	<label>Quantity: <input type="number" name="quantity" min="1" max="100"/></label><br/>
	    	<input type="hidden" value="<%=rs.getInt("product_id") %>" name = "id"/>
	    	<input type="submit" value="Buy Now"/>
	    </form>
	    <%} %>
		
	    
	   
</body>
</html> --%>