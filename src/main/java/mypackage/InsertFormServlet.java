package mypackage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

public class InsertFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public InsertFormServlet() {
        super();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				int movieID = Integer.parseInt(request.getParameter("movie_id"));
				String movieTitle = request.getParameter("movie_title");
				int movieYear = Integer.parseInt(request.getParameter("movie_year"));
				double movieTime = Double.parseDouble(request.getParameter("movie_time"));
				String movieLanguage = request.getParameter("movie_lang");
				String releaseDate = request.getParameter("movie_release_date");
				String description = request.getParameter("description");
				double imdb = Double.parseDouble(request.getParameter("imdb_rating"));
						
				
				Movie mov = new Movie(movieID, movieYear, movieTime, movieTitle, releaseDate, movieLanguage, imdb, description);
				String msg = "";
				
				try {
					MOVIES_DAO.insertMovieData(mov);
					msg = "Data inserted successfully";
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
