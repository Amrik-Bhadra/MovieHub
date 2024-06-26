package mypackage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MOVIES_DAO {
//  function to insert data into the database
	public static void insertMovieData(Movie movie) throws SQLException{
		Connection conn = DatabaseConnectivity.getConnection();
		String insertMovieQuery = Query.insertMovieQuery;
		PreparedStatement pstmt = conn.prepareStatement(insertMovieQuery);
		pstmt.setInt(1, movie.getMovieID());
		pstmt.setString(2, movie.getMovieTitle());
		pstmt.setInt(3, movie.getMovieYear());
		pstmt.setDouble(4, movie.getMovieTime());
		pstmt.setString(5, movie.getMovieLanguage());
		pstmt.setString(6, movie.getMovieReleaseDate());
		pstmt.setDouble(7, movie.getMovieImdb());
		pstmt.setString(8, movie.getMovieDescription());
		System.out.println("\tData inserted successfully!");
		pstmt.executeUpdate();
		pstmt.close();
//		conn.close();
	}
	
	// function to delete data from the database
	public static int deleteMovieData(int movieID) throws SQLException{
		Connection conn = DatabaseConnectivity.getConnection();
		String deleteQuery = Query.deleteMovieQuery; // Assuming movie_id is the column name
		PreparedStatement pstmt = conn.prepareStatement(deleteQuery);
		pstmt.setInt(1, movieID);
		int rowsAffected = pstmt.executeUpdate();
        
		pstmt.close();
		conn.close();
		
		return rowsAffected;
	}
	
	// function to display all records in the database
	public static ResultSet showData() throws SQLException{
		Connection conn = DatabaseConnectivity.getConnection();
		String showQuery = Query.showMovieQuery;
		PreparedStatement pstmt = conn.prepareStatement(showQuery);
		ResultSet rs = pstmt.executeQuery();
//		pstmt.close();
//		conn.close();
		
		return rs;
	}
	
	
	// function to update record in database
	public static int updateRecord(String updateQuery, String updateCheckBox[], int movieID, String movieTitle, int movieYear, double movieTime, String movieLanguage, String releaseDate)throws SQLException{
		Connection conn = DatabaseConnectivity.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(updateQuery);
		int index = 1;
		
		// here written logic to form the query
		for(String str: updateCheckBox) {
			if(str.equalsIgnoreCase("title")) {
				pstmt.setString(index, movieTitle);
				index++;
			}else if(str.equalsIgnoreCase("year")) {
				pstmt.setInt(index, movieYear);
				index++;
			}else if(str.equalsIgnoreCase("time")) {
				pstmt.setDouble(index, movieTime);
				index++;
			}else if(str.equalsIgnoreCase("language")) {
				pstmt.setString(index, movieLanguage);
				index++;
			}else {
				pstmt.setString(index, releaseDate);
				index++;
			}
		}
		pstmt.setInt(index, movieID);
		
		
		int rowsAffected = pstmt.executeUpdate();
		pstmt.close();
//		conn.close();
		
		return rowsAffected;
		
	}
	
	public static ResultSet findMovie(String movieName) throws SQLException{
		System.out.println(movieName);
		Connection conn = DatabaseConnectivity.getConnection();
		String findMovieQuery = Query.searchMovieQuery;
		PreparedStatement pstmt = conn.prepareStatement(findMovieQuery);
		pstmt.setString(1, movieName);
		ResultSet rs = pstmt.executeQuery();
		return rs;
		
	}
}
