package mypackage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;


public class SearchMovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SearchMovieServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String movieName = request.getParameter("searchMovieName").trim();
		System.out.println(movieName);
		ResultSet rs = null;
		try {
			rs = MOVIES_DAO.findMovie(movieName);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 	request.setAttribute("list2", rs);

	        RequestDispatcher requestDispatcher = request.getRequestDispatcher("movie_desc.jsp");
	        requestDispatcher.forward(request, response);
	}

}
