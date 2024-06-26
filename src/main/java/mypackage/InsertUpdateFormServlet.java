package mypackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class InsertUpdateFormServlet
 */
public class InsertUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String updateQuery = "";
 
    public InsertUpdateFormServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int movieYear = 0;
		double movieTime = 0.0;
		
		String movieTitle = request.getParameter("movie_title");
		
		if(request.getParameter("movie_year") != null) {			
			movieYear = Integer.parseInt(request.getParameter("movie_year"));
		}
		
		if(request.getParameter("movie_time") != null) {			
			movieTime = Double.parseDouble(request.getParameter("movie_time"));
		}
		
		String movieLanguage = request.getParameter("movie_lang");
		String releaseDate = request.getParameter("movie_release_date");
		
		String msg = "";
		
		updateQuery = Query.updateMovieQuery;
		
		String updateCheckBoxString = request.getParameter("updateCheckBoxString");
		String[] updateCheckBox = updateCheckBoxString.split(",");
		String movID = request.getParameter("movie_id");
		System.out.println(movID);
		int movieID = Integer.parseInt(movID);
		

	    
		for(int i=0; i<updateCheckBox.length-1; i++) {
			if(updateCheckBox[i].equalsIgnoreCase("title")) {
				updateQuery += "mov_title = ?, ";
			}else if(updateCheckBox[i].equalsIgnoreCase("year")) {
				updateQuery += "mov_year = ?, ";
			}else if(updateCheckBox[i].equalsIgnoreCase("time")) {
				updateQuery += "mov_time = ?, ";
			}else if(updateCheckBox[i].equalsIgnoreCase("language")) {
				updateQuery += "mov_lang = ?, ";
			}else {
				updateQuery += "mov_dt_rel = ?, ";
			}
		}
		System.out.println(updateQuery);
		
		int lastIndex = updateCheckBox.length-1;
		if(updateCheckBox[lastIndex].equalsIgnoreCase("title")) {
			updateQuery += "mov_title = ? WHERE mov_id = ?";
		}else if(updateCheckBox[lastIndex].equalsIgnoreCase("year")) {
			updateQuery += "mov_year = ? WHERE mov_id = ?";
		}else if(updateCheckBox[lastIndex].equalsIgnoreCase("time")) {
			updateQuery += "mov_time = ? WHERE mov_id = ?";
		}else if(updateCheckBox[lastIndex].equalsIgnoreCase("language")) {
			updateQuery += "mov_lang = ? WHERE mov_id = ?";
		}else {
			updateQuery += "mov_dt_rel = TO_DATE(?, 'YYYY-MM-DD') WHERE mov_id = ?";
		}
		
		
		try {
			int rowsAffected = MOVIES_DAO.updateRecord(updateQuery, updateCheckBox, movieID, movieTitle, movieYear, movieTime, movieLanguage, releaseDate);
			if(rowsAffected > 0) msg = "Data updated successfully";
			else msg = "Invalid Movie ID";
		}catch(Exception e) {
			msg = e.getMessage();
		}
		
		request.setAttribute("msg", msg);

	    // Forward the request and response to index.jsp
	    request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
