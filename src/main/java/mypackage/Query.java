package mypackage;

public class Query {
	public static String insertUserQuery = "INSERT INTO user(email, username, password, userType) values(?, ?, ?, ?);";
	public static String findPasswordQuery = "SELECT password FROM user WHERE email = ?;";
	public static String findUserTypeQuery = "SELECT userType FROM user WHERE email = ?;";
	
	
	// movie related queries
	
	// query to insert movie
	public static String insertMovieQuery = "INSERT INTO MOVIE (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, imdb_rating, descr)VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
	
	// query to delete movie
	public static String deleteMovieQuery = "DELETE FROM MOVIE WHERE mov_id = ?;";
	
	// query to show movies
	public static String showMovieQuery = "SELECT * FROM MOVIE;";
	
	// update query: it will get completed by using logic part
	public static String updateMovieQuery = "UPDATE MOVIE SET ";
	
	public static String searchMovieQuery = "SELECT * FROM MOVIE WHERE mov_title = ?";
}
