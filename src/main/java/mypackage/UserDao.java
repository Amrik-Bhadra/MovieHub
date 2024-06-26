package mypackage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
	public static void insertQuery(User user)throws SQLException{
		Connection conn = DatabaseConnectivity.getConnection();
		String insertUserQuery = Query.insertUserQuery;
		PreparedStatement pstmt = conn.prepareStatement(insertUserQuery);
		pstmt.setString(1, User.getEmailId());
		pstmt.setString(2, User.getUserName());
		pstmt.setString(3,  User.getPassword());
		pstmt.setString(4,  User.getUserType());
		pstmt.executeUpdate();
		pstmt.close();
	}
	
	public static boolean validUser(String emailId, String password)throws SQLException {
		Connection conn = DatabaseConnectivity.getConnection();
		String findPasswordQuery = Query.findPasswordQuery;
		PreparedStatement pstmt = conn.prepareStatement(findPasswordQuery);
		 pstmt.setString(1, emailId);
		ResultSet rs = pstmt.executeQuery();
		
		String pswd = "";
		if (rs != null && rs.next()) { // Move the cursor to the first row
		    pswd = rs.getString(1); // Retrieve the value of the password attribute
		}
		if(pswd.equals(password)) {
			return true;
		}else {
			return false;
		}
	}
	
	public static String getUserType(String emailId) throws SQLException {
		Connection conn = DatabaseConnectivity.getConnection();
		String findUserTypeQuery = Query.findUserTypeQuery;
		PreparedStatement pstmt = conn.prepareStatement(findUserTypeQuery);
		pstmt.setString(1, emailId);
		ResultSet rs = pstmt.executeQuery();
		
		String userType = "";
		if (rs != null && rs.next()) { 
		    userType = rs.getString(1); 
		}
		
		return userType;
	}
}
