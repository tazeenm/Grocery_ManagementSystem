

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
 * Servlet implementation class DeleteItem
 */
@WebServlet("/DeleteItem")
public class DeleteItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String URL = "jdbc:mysql://localhost:3306/Grocery_DB";
    private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    private static final String USER = "tazeen";
    private static final String PASS = "kitkat";
    java.sql.Connection conn;
   
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteItem() {
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
		String type = request.getParameter("type");
		if(type.equals("1")) {
				String query = "DELETE FROM product_details WHERE product_details.product_id=?";
				try {
					PreparedStatement pt = conn.prepareStatement(query);
					pt.setInt(1, id);
					pt.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		else if(type.equals("2")) {
			String query = "DELETE FROM customer_details WHERE customer_details.Customer_ID = ?";
			try {
				PreparedStatement pt = conn.prepareStatement(query);
				pt.setInt(1, id);
				pt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		else if(type.equals("3")) {
			String query = "DELETE FROM order_details WHERE order_details.order_no = ?";
			try {
				PreparedStatement pt = conn.prepareStatement(query);
				pt.setInt(1, id);
				pt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		response.sendRedirect("adminPage.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
