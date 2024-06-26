package mypackage;

import jakarta.servlet.RequestDispatcher;
//import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String msg, username, password, emailId, confirmPassword, userType;

    public MyServlet() {
        super();
    
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			username = request.getParameter("username");
			emailId = request.getParameter("email");
			password = request.getParameter("password");
			confirmPassword = request.getParameter("confirm_password");
			userType = request.getParameter("userType");
			
			System.out.println(username+"\n"+emailId+"\n"+password+"\n"+confirmPassword+"\n"+userType);
			
			if(!password.equals(confirmPassword)) {
				msg = "0";
				response.sendRedirect("registration_form.jsp?msg="+msg+"&userType="+userType);
			}else {
				msg = "1";	
				User user = new User(username, password, emailId, userType);
				try {
					UserDao.insertQuery(user);
					msg = "1";
					if(userType.equalsIgnoreCase("admin")) {
						response.sendRedirect("index.jsp?msg="+msg+"&userType="+userType);
					}else {
						response.sendRedirect("userIndex.jsp?msg="+msg+"&userType="+userType);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					msg = "0";
					response.sendRedirect("registration_form.jsp?msg="+msg+"&userType="+userType);
				}
			}
			
			
			
	}

}
