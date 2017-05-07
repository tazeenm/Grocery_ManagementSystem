<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/grocery.css">
<title>Admin Page</title>
</head>
<body>

	<nav class="fixed-nav-bar-top">
	<ul class="nav">
		<li><a href="index.html" target="">Home</a></li>
		<li><a href="categories.jsp" target="">Categories</a></li>
		<li><a href="About Us.html" target="">About Us</a></li>
		<li><a href="ContactUs.html" target="">Contact Us</a></li>
	</ul>
	</nav>

	<form method="GET" action="ProductList.jsp" id="searchform">
		<input type="text" name="search"> <input type="submit"
			name="submit" value="Search">
	</form>
	<%
	//public Object getAttribute(String name)
	//This method returns the object bound with the specified name in this session, or null if no object is bound under the name.
		String status = (String)session.getAttribute("Admin");	
		if(status == null || !status.equals("1")){
			response.sendRedirect("adminLogin.jsp?status=2");
		}
	%>
	<div align="center" style="padding-top: 5%;">
	 <a href="adminPage.jsp?select=1"><button>Products</button></a><br>
		<br> <a href="adminPage.jsp?select=2"><button>Customers</button></a><br>
		<br> <a href="adminPage.jsp?select=3"><button>Orders</button></a><br>
		<br>
	</div>
	<%
		String select = request.getParameter("select");
		if(select != null){
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
		    if(select.equals("1"))	{
		    	String sql = "SELECT * from product_details";
		    	ResultSet rs = conn.createStatement().executeQuery(sql);
		    	%><table border="1" align="center">
		<tr align="center">
			<th>Product ID</th>
			<th>Product Name</th>
			<th>Price</th>
			<th>Delete</th>
			<th>Edit</th>
		</tr>
		<%while(rs.next())	{
		    			int id=rs.getInt("product_id");
		    			String name = rs.getString("product_name");
		    			double price = rs.getDouble("product_price");
		    		%>
		<tr>
			<td><%=id %></td>
			<td><%=name %></td>
			<td><%=price %></td>
			<td><a href="DeleteItem?id=<%=id%>&type=1"><img
					src="./Images/deleteIcon.png" width="30px" height="30px" /></a>
			<td><a href="adminUpdateProduct.jsp?id=<%=id%>"><img
					src="./Images/editcon.png" width="30px" height="30px" /></a>
		</tr>
		<%}
		    			%>
	</table>
	<div align="center" margin="2px">
		<a href="adminAddProduct.jsp"><button>Add product</button></a>
	</div>
	<%
		    }else if(select.equals("2"))	{
		    	String sql = "SELECT * from customer_details";
		    	ResultSet rs = conn.createStatement().executeQuery(sql);
		    	%><table border="1" align="center">
		<tr align="center">
			<th>Customer ID</th>
			<th>Customer Name</th>
			<th>Phone Number</th>
			<th>Delete</th>
		</tr>
		<%while(rs.next())	{
		    			int id=rs.getInt("customer_id");
		    			String name = rs.getString("name");
		    			String phone = rs.getString("phone_no");
		    		%>
		<tr>
			<td><%=id %></td>
			<td><%=name %></td>
			<td><%=phone %></td>
			<td><a href="DeleteItem?id=<%=id%>&type=2"><img
					src="./Images/deleteIcon.png" width="30px" height="30px" /></a>
		</tr>
		<%}
		    			%>
	</table>
	<%
		    }else if(select.equals("3"))	{
		    	String sql = "SELECT order_no,quantity, customer_details.Name, product_details.product_name, product_price FROM order_details,product_details,customer_details WHERE order_details.prod_ID=product_details.product_id and order_details.cust_ID=customer_details.Customer_id";
		    	ResultSet rs = conn.createStatement().executeQuery(sql);
		    	%><table border="1" align="center">
		<tr align="center">
			<th>Order ID</th>
			<th>Customer Name</th>
			<th>Product Name</th>
			<th>Quantity</th>
			<th>Cost</th>
			<th>Delete</th>
		</tr>
		<%while(rs.next())	{
		    			int id=rs.getInt("order_no");
		    			String pname = rs.getString("product_name");
		    			double price = rs.getDouble("product_price");
		    			String cname = rs.getString("name");
		    			int quantity = rs.getInt("quantity");
		    			double total = price*quantity;
		    		%>
		<tr>
			<td><%=id %></td>
			<td><%=cname %></td>
			<td><%=pname %></td>
			<td><%=quantity %></td>
			<td><%=total %></td>
			<td><a href="DeleteItem?id=<%=id%>&type=3"><img
					src="./Images/deleteIcon.png" width="30px" height="" /></a>
		</tr>
		<%}
		    			%>
	</table>
	<%
		    }
	%>
	<%}%>
	<div align="center">
		<a href="adminLogout"><button>Logout</button></a>
	</div>

</body>
</html>

<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/grocery.css">
<title>Admin Page</title>
</head>
<body>

	<nav class="fixed-nav-bar-top">
		<ul class="nav">
			<li><a href="index.html" target="">Home</a></li>
			<li><a href="categories.jsp" target="">Categories</a></li>
			<li><a href="About Us.html" target="">About Us</a></li>
			<li><a href="ContactUs.html" target="">Contact Us</a></li>
		</ul>
		</nav>
		
		<form  method="GET" action="ProductList.jsp"  id="searchform"> 
	      <input  type="text" name="search"> 
	      <input  type="submit" name="submit" value="Search"> 
	    </form>
	<%
	//public Object getAttribute(String name)
	//This method returns the object bound with the specified name in this session, or null if no object is bound under the name.
		String status = (String)session.getAttribute("Admin");	
		if(status == null || !status.equals("1")){
			response.sendRedirect("adminLogin.jsp?status=2");
		}
	%>
		<div align="center" >
		<a href="adminPage.jsp?select=1"><button>Products</button></a>
		<a href="adminPage.jsp?select=2"><button>Customers</button></a>
		<a href="adminPage.jsp?select=3"><button>Orders</button></a>
		</div>
	<%
		String select = request.getParameter("select");
		if(select != null){
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
		    if(select.equals("1"))	{
		    	String sql = "SELECT * from product_details";
		    	ResultSet rs = conn.createStatement().executeQuery(sql);
		    	%><table border="1" align="center">
		    		<tr align="center">
		    			<th>Product ID</th>
		    			<th>Product Name</th>
		    			<th>Price</th>
		    			<th>Delete</th>
		    			<th>Edit</th>
		    		</tr>
		    		<%while(rs.next())	{
		    			int id=rs.getInt("product_id");
		    			String name = rs.getString("product_name");
		    			double price = rs.getDouble("product_price");
		    		%>
		    			<tr>
		    				<td><%=id %></td>
		    				<td><%=name %></td>
		    				<td><%=price %></td>
		    				<td><a href="DeleteItem?id=<%=id%>&type=1"><img src="./Images/deleteIcon.png"  width="30px" height="30px"/></a>
		    				<td><a href="adminUpdateProduct.jsp?id=<%=id%>"><img src="./Images/editcon.png" width="30px" height="30px"/></a>
		    			</tr><%}
		    			%>
		    	</table>
		    	<div align="center" margin="2px">
		    	<a href="adminAddProduct.jsp" ><button>Add product</button></a>
		    	</div>
		    	<%
		    }else if(select.equals("2"))	{
		    	String sql = "SELECT * from customer_details";
		    	ResultSet rs = conn.createStatement().executeQuery(sql);
		    	%><table border="1" align="center" >
		    		<tr align="center">
		    			<th>Customer ID</th>
		    			<th>Customer Name</th>
		    			<th>Phone Number</th>
		    			<th>Delete</th>
				    </tr>
		    		<%while(rs.next())	{
		    			int id=rs.getInt("customer_id");
		    			String name = rs.getString("name");
		    			String phone = rs.getString("phone_no");
		    		%>
		    			<tr>
		    				<td><%=id %></td>
		    				<td><%=name %></td>
		    				<td><%=phone %></td>
		    				<td><a href="DeleteItem?id=<%=id%>&type=2"><img src="./Images/deleteIcon.png" width="30px" height="30px"/></a>
		    			</tr><%}
		    			%>
		    	</table><%
		    }else if(select.equals("3"))	{
		    	String sql = "SELECT order_no,quantity, customer_details.Name, product_details.product_name, product_price FROM order_details,product_details,customer_details WHERE order_details.prod_ID=product_details.product_id and order_details.cust_ID=customer_details.Customer_id";
		    	ResultSet rs = conn.createStatement().executeQuery(sql);
		    	%><table border="1" align="center">
		    		<tr align="center">
		    			<th>Order ID</th>
		    			<th>Customer Name</th>
		    			<th>Product Name</th>
		    			<th>Quantity</th>
		    			<th>Cost</th>
		    			<th>Delete</th>
		    		</tr>
		    		<%while(rs.next())	{
		    			int id=rs.getInt("order_no");
		    			String pname = rs.getString("product_name");
		    			double price = rs.getDouble("product_price");
		    			String cname = rs.getString("name");
		    			int quantity = rs.getInt("quantity");
		    			double total = price*quantity;
		    		%>
		    			<tr>
		    				<td><%=id %></td>
		    				<td><%=cname %></td>
		    				<td><%=pname %></td>
		    				<td><%=quantity %></td>
		    				<td><%=total %></td>
		    				<td><a href="DeleteItem?id=<%=id%>&type=3"><img src="./Images/deleteIcon.png" width="30px" height=""/></a>
		    			</tr><%}
		    			%>
		    	</table><%
		    }
	%>
	<%}%>
	<div align="center">
	<a href="adminLogout"><button>Logout</button></a>
	</div>
	
</body>
</html> --%>