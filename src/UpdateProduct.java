

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateProduct
 */
@WebServlet("/UpdateProduct")
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static final String URL = "jdbc:mysql://localhost:3306/Grocery_DB";
	    private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	    private static final String USER = "tazeen";
	    private static final String PASS = "kitkat";
	    java.sql.Connection conn;
    
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProduct() {
        super();
        // TODO Auto-generated constructor stub
        try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(URL,USER,PASS);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
     
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int id = Integer.parseInt(request.getParameter("id"));
		String pname = request.getParameter("pname");
		String desc = request.getParameter("desc");
		String img = request.getParameter("img");
		int cat = Integer.parseInt(request.getParameter("cat"));
		double price = Double.parseDouble(request.getParameter("price"));
		
		String query = "UPDATE product_details SET product_name = ?, prod_img = ?, product_desc = ?, product_price = ?, cat_id = ? WHERE product_details.product_id = ?";
		try {
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1,pname);
			pst.setString(2, img);
			pst.setString(3, desc);
			pst.setDouble(4, price);
			pst.setInt(5, cat);
			pst.setInt(6, id);
			pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("adminPage.jsp?select=1");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
