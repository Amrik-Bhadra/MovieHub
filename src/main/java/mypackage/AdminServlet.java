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

public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				String buttonValue = request.getParameter("btn");
				int value = Integer.parseInt(buttonValue);
				String ans = "";
				if(value == 1) {
					response.sendRedirect("insertForm.jsp");
				}
				else if(value == 2) {
					response.sendRedirect("updateForm.jsp");
				}
				else if(value == 3) {
					response.sendRedirect("deleteForm.jsp");
				}
				else {
					ResultSet rs = null;
					try {
						rs = MOVIES_DAO.showData();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					 	request.setAttribute("list", rs);

				        RequestDispatcher requestDispatcher = request.getRequestDispatcher("displayData.jsp");
				        requestDispatcher.forward(request, response);
//				        response.sendRedirect("");
				}
				
				response.getWriter().append(ans);
	}

}
