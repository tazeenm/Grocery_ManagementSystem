<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<%
		String status = (String)session.getAttribute("Admin");	
		if(status == null || !status.equals("1")){
			response.sendRedirect("adminLogin.jsp?status=2");
		}
	%>
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
    ResultSet rs = conn.createStatement().executeQuery("Select * from category");
    int id = Integer.parseInt(request.getParameter("id"));
    ResultSet rs1 = conn.createStatement().executeQuery("Select * from product_Details where product_id ="+id);
    rs1.next();
    String pname = rs1.getString("product_name");
    int cat1 = rs1.getInt("cat_id");
    String p_img = rs1.getString("prod_img");
    double p_price = rs1.getDouble("product_price");
    String p_desc = rs1.getString("product_desc");
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./css/sign_up.css">
<title>Add New Product</title>
</head>
<body>
	
	<div id="Sign-Up"> 
		<fieldset style="width:30%">
			<legend>Add a new Product</legend> 
				<table class="center" border="0"> <tr> 
					<form method="GET" action="UpdateProduct"> 
						<td>Product Name</td>
						<td> <input type="hidden" name="id" value = "<%=id %>"/>
						 <input type="text" name="pname" value="<%=pname%>"></td>
 						</tr> 
 						<tr> <td>Category</td>
 						<td> <select name="cat" >
					<%while(rs.next()){
						String cat = rs.getString("category_name");
						int catid = rs.getInt("category_id");
						if(catid==cat1){
							%><option selected="selected" value="<%=catid %>"> <%=cat %></option><%
							continue;	
						}
						%><option value="<%=catid %>"> <%=cat %></option>
					<%}%>
				</select></td> </tr>
 						<tr> <td>Price</td>
 						<td> <input type="number" name="price" step="0.01" value = "<%=p_price%>"></td> </tr>
 						<tr> <td>Product Image file name</td><td>
 						<input type="text" name="img" value = "<%=p_img%>"></td> </tr>
 						<tr> <td>Product Description </td>
 						<td><textarea name="desc"><%=p_desc%></textarea></td> </tr> 
						 <tr> <td><input type="Submit" value="Add product"/>
						<input type="reset" value="reset"/></td> </tr> 
					 </form> 
 				</table> 
 		</fieldset> 
	
	
 	</div>
	<a href="adminPage.jsp"><button>Back</button></a>
</body>
</html>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<%
		String status = (String)session.getAttribute("Admin");	
		if(status == null || !status.equals("1")){
			response.sendRedirect("adminLogin.jsp?status=2");
		}
	%>
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
    ResultSet rs = conn.createStatement().executeQuery("Select * from category");
    int id = Integer.parseInt(request.getParameter("id"));
    ResultSet rs1 = conn.createStatement().executeQuery("Select * from product_Details where product_id ="+id);
    rs1.next();
    String pname = rs1.getString("product_name");
    int cat1 = rs1.getInt("cat_id");
    String p_img = rs1.getString("prod_img");
    double p_price = rs1.getDouble("product_price");
    String p_desc = rs1.getString("product_desc");
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./css/sign_up.css">
<title>Add New Product</title>
</head>
<body>
	
	<div id="Sign-Up"> 
		<fieldset style="width:30%">
			<legend>Add a new Product</legend> 
				<table class="center" border="0"> <tr> 
					<form method="GET" action="UpdateProduct"> 
						<td>Product Name</td>
						<td> <input type="hidden" name="id" value = "<%=id %>"/>
						 <input type="text" name="pname" value="<%=pname%>"></td>
 						</tr> 
 						<tr> <td>Category</td>
 						<td> <select name="cat" >
					<%while(rs.next()){
						String cat = rs.getString("category_name");
						int catid = rs.getInt("category_id");
						if(catid==cat1){
							%><option selected="selected" value="<%=catid %>"> <%=cat %></option><%
							continue;	
						}
						%><option value="<%=catid %>"> <%=cat %></option>
					<%}%>
				</select></td> </tr>
 						<tr> <td>Price</td>
 						<td> <input type="number" name="price" step="0.01" value = "<%=p_price%>"></td> </tr>
 						<tr> <td>Product Image file name</td><td>
 						<input type="text" name="img" value = "<%=p_img%>"></td> </tr>
 						<tr> <td>Product Description </td>
 						<td><textarea name="desc"><%=p_desc%></textarea></td> </tr> 
						 <tr> <td><input type="Submit" value="Add product"/>
						<input type="reset" value="reset"/></td> </tr> 
					 </form> 
 				</table> 
 		</fieldset> 
	
	
 	</div>
	<a href="adminPage.jsp"><button>Back</button></a>
</body>
</html> --%>