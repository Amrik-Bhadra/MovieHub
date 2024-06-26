package mypackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class MyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MyDeleteServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int movieID = Integer.parseInt(request.getParameter("movie_id"));
		System.out.println("Movie id in delete servlet: " + movieID);
		
		String msg = "";
		
		try {
			int rowsAffected = MOVIES_DAO.deleteMovieData(movieID);
			if(rowsAffected > 0) msg = "Data deleted successfully";
			else msg = "Invalid Movie ID";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			msg = e.getMessage();
			e.printStackTrace();
		}
		
		
		request.setAttribute("msg", msg);

	    // Forward the request and response to index.jsp
	    request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
