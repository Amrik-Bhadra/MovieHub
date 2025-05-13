package mypackage;

public class User {
	private String userName;
	private String password;
	private String emailId;
	private String userType;
	
	public User(String username, String password, String emailId, String userType){
		this.userName = username;
		this.password = password;
		this.emailId = emailId;
		this.userType = userType;
	}
	
	 public String getUserName() {
		 return userName;
	 }
	 
	 public String getEmailId() {
		 return emailId;
	 }
	 
	 public String getPassword() {
		 return password;
	 }
	 
	 public String getUserType() {
		 return userType;
	 }
}
