package mypackage;

public class User {
	public static String userName;
	public static String password;
	public static String emailId;
	public static String userType;
	
	public User(String username, String password, String emailId, String userType){
		this.userName = username;
		this.password = password;
		this.emailId = emailId;
		this.userType = userType;
	}
	
	 public static String getUserName() {
		 return userName;
	 }
	 
	 public static String getEmailId() {
		 return emailId;
	 }
	 
	 public static String getPassword() {
		 return password;
	 }
	 
	 public static String getUserType() {
		 return userType;
	 }
}
