package mypackage;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnectivity {
	static Connection conn = null;
	public static Connection getConnection() {
		try {
			String url = "jdbc:mysql://localhost:3306/movie_database";
			String username = "root";
			String password = "Bhd123@Amk";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, username, password);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return conn;
	}
}
