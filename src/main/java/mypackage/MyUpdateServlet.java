package mypackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class MyUpdateServlet
 */
public class MyUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MyUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	     String[] updateCheckBox = request.getParameterValues("updateCheckBox");
    	
	     String checkBoxString = String.join(",", updateCheckBox);
	     request.setAttribute("checkBoxString", checkBoxString);
//	     request.setAttribute("movieId", movieId);
	     request.getRequestDispatcher("insertUpdateForm.jsp").forward(request, response);
	    
//	     System.out.println(checkBoxString);
}

}