

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
 * Servlet implementation class AddProduct
 */
@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String URL = "jdbc:mysql://localhost:3306/grocery_DB";
    private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    private static final String USER = "tazeen";
    private static final String PASS = "kitkat";
    java.sql.Connection conn;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduct() {
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
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pname = request.getParameter("pname");
		String desc = request.getParameter("desc");
		String img = request.getParameter("img");
		//request.getParameter("") returns a string so we need to use parseInt to typecast it into int 
		int cat = Integer.parseInt(request.getParameter("cat"));
		double price = Double.parseDouble(request.getParameter("price"));
		System.out.println(pname+","+desc+","+img+","+cat+","+price);
		String sql = "INSERT INTO product_details (product_name, prod_img, product_desc, product_price, cat_id) VALUES (?, ?, ?, ?, ?)";
		try {
			//PreparedStatement-can have an sql query and can be executed any number of times(one instance created and reused)
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pname);
			pstmt.setString(2, img);
			pstmt.setString(3, desc);
			pstmt.setDouble(4, price);
			pstmt.setInt(5, cat);
			pstmt.executeUpdate();
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
