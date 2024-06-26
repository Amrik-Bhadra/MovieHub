package mypackage;

public class Movie {
	// data members of Movie class
		public int movieID, movieYear;
		double time, imdb;
		public String movieTitle, releaseDate, movieLanguage, description;
		
		// Parameterised constructor to assign values
		public Movie(int movieID, int movieYear,double time, String movieTitle, String releaseDate, String movieLanguage, double imdb, String description){
			this.movieID = movieID;
			this.movieYear = movieYear;
			this.time = time;
			this.movieTitle = movieTitle;
			this.releaseDate = releaseDate;
			this.movieLanguage = movieLanguage;
			this.imdb= imdb;
			this.description = description;
		}
		
		// member methods
		public int getMovieID() {
			return movieID;
		}
		public int getMovieYear() {
			return movieYear;
		}
		public double getMovieTime() {
			return time;
		}
		public String getMovieTitle() {
			return movieTitle;
		}
		public String getMovieReleaseDate() {
			return releaseDate;
		}
		public String getMovieLanguage() {
			return movieLanguage;
		}
		public String getMovieDescription() {
			return description;
		}
		public double getMovieImdb() {
			return imdb;
		}
}
