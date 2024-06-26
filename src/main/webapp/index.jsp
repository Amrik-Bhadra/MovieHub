<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Application - by Amrik Bhadra</title>
    <link rel="stylesheet" href="style.css">
        <link rel="shortcut icon" href="images/clapperboard.png" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
		.search-container{
		  display: flex;
		  align-items: center;
		  margin-top: 20px;
		}
		.search-container form{
		  display: flex;
		  align-items: center;
		}
		
		.search-box {
		  flex-grow: 1;
		  padding: 10px;
		  border: none;
		  border-radius: 5px 0 0 5px;
		  font-size: 16px;
		  outline: none;
		  font-size: 0.9rem;
		  width: 100%;
		  height: 100%;
		}
		.search-box::placeholder{
		  font-size:  0.85rem;
		  font-weight: 400;
		  color: #a9a9a9;
		}
		.search-icon-box {
		  background: #fff;
		  padding: 9px;
		  border-radius: 0 5px 5px 0;
		  color: red;
		  
		  height: 100%;
		}
		
		.logout-btn{
			color: white; 
			margin-top: 1rem; 
			font-weight:600; 
			text-decoration:underline;
		}
		.logout-btn:hover{
			color: red;
		}
		.top-left-container {
		    position: absolute;
		    top: 20px;
		    right: 20px;
		    display: flex;
		    align-items: center;
		    gap: 10px;
		}
		
		.avatar-box {
		    width: 50px;
		    height: 50px;
		    display: flex;
		    align-items: center;
		}
		
		.avatar {
		    width: 100%;
		    height: 100%;
		    border-radius: 50%;
		    object-fit: cover;
		}
		
		.logout-btn {
		    padding: 8px 12px;
		    background-color: #ff4b5c;
		    color: #fff;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		    font-size: 14px;
		}
		
		.logout-btn:hover {
		    background-color: #ff6b7c;
		}
		.top-left-container {
		    position: absolute;
		    top: 20px;
		    right: 20px;
		    display: flex;
		    align-items: center;
		    gap: 10px;
		}
		
		.avatar-box {
		    width: 50px;
		    height: 50px;
		    display: flex;
		    align-items: center;
		}
		
		.avatar {
		    width: 100%;
		    height: 100%;
		    border-radius: 50%;
		    object-fit: cover;
		}
		
		.logout-btn {
		    padding: 8px 12px;
		    background-color: #ff4b5c;
		    color: #fff;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		    font-size: 14px;
		}
		
		.logout-btn:hover {
		    background-color: #ff6b7c;
		}
	</style> 
</head>
<body>
    <div class="home-main-container">        
        <div class="overlay-container">
            <div class="top-left-container">
                <div class="avatar-box">
                    <img src="images/avatar.jpg" alt="User Avatar" class="avatar">
                </div>
                <form action="LogoutServlet" method="post">
                    <button class="logout-btn">Logout</button>
                </form>
            </div>
            <div class="menu-container">
                <h1 class="menu-title">
                    Movie HUB
                </h1>
                <div class="menu-btn-container">
                    <form action="AdminServlet" method="post">
                    	<div class="menu-btn-box1 menu-btn-box">
	                        <button class="button-17" role="button" value="1" name="btn">Insert</button>
	                        <button class="button-17" role="button" value="2" name="btn">Update</button>
	                        <button class="button-17" role="button" value="3" name="btn">Delete</button>
	                        <button class="button-17" role="button" value="4" name="btn">Show</button>
	                        
	                        <!--  here i want to insert a paragraph tag which displays the message "Data inserted successfully" -->
	                        <p style="color: white; font-weight: 600">${msg}</p>
	                    </div>
                    </form>
                    
                    
                </div>
            </div>
        </div>
    </div>
</body>
</html>
