package mypackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public LoginServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailId = request.getParameter("email");
		String password = request.getParameter("password");
		
		try {
			if(UserDao.validUser(emailId, password)) {
				String userType = UserDao.getUserType(emailId);
				
				// Create a session and store user information
				HttpSession session = request.getSession();
				session.setAttribute("email", emailId);
				session.setAttribute("userType", userType);
				
				if(userType.equals("admin")) {
					response.sendRedirect("index.jsp");
				} else {
					response.sendRedirect("userIndex.jsp");
				}
			} else {
				response.sendRedirect("login.jsp?error=invalid");
			}
		} catch (SQLException | IOException e) {
			e.printStackTrace();
			response.sendRedirect("login.jsp?error=exception");
		}
	}
}
