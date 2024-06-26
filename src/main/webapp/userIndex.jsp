<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search for movie</title>
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
			background-color: white;
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
            <div class="menu-container" style="gap: 1rem 0;">
                <h1 class="menu-title">
                    Movie HUB
                </h1>
                <div class="searchbox-image-container">
                    <img src="images/movie_search.png" alt="hero-image-container" style="width: 20rem;">
                </div>
                <p class="hero-para">Search For Any Movie Details With Ease</p>
                <div class="search-container">
                    <form action="SearchMovieServlet" method="post">
                    	<input type="text" class="search-box" name="searchMovieName" placeholder="Search for a movie...">
	                    <div class="search-icon-box">
	                        <i class="fa-solid fa-magnifying-glass"></i>
	                    </div>
                    </form>
                </div>
                
                
            </div>
        </div>
    </div>
</body>
</html>


