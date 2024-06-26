<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Search</title>
    <link rel="stylesheet" href="style.css">
         <link rel="shortcut icon" href="images/clapperboard.png" type="image/x-icon">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .menu-container{
            display: flex;
            
            align-items: center;
            flex-direction: column;
        }
        .movie-title{
            border-bottom: 3px solid red;
        }
        .movie-detail-container{
            width: 80%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 0.7rem 0;
        }
        .movie-detail-container .movie-detail-item{
            display: grid;
            grid-template-columns: 1fr 2fr;
            gap: 0 0.4rem; 
            width: 90%;
        }
        .movie-detail-container .movie-detail-item .data-box{
            font-size: 1.15rem;
            color: #fff;
        }
        .movie-detail-container .movie-detail-item h2{
            font-size: 1.15rem;
        }
        .movie-detail-container .movie-detail-item p{
            font-size: 1rem;
        }
        .back_home_btn{
            margin-top: 1rem;
            padding: 1rem;
            background-color: rgb(255, 59, 59);
            border-radius: 10px;
            color: #fff;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .back_home_btn:hover{
            background-color: #fff;
            color: red;
        }
        .movie-content-box{
            width: 85%;
            display: grid;
            grid-template-columns: 1fr 2fr;
            margin-top: 0.6rem;
        }
        .movie-content-box .content{
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .movie-image-container img{
            width: 13rem;
            border-radius: 10px;
            box-shadow: rgba(255, 255, 255, 0.6) 0px 10px 50px;
        }
    </style>
</head>
<body>

	<%
	   		ResultSet rs = (ResultSet) request.getAttribute("list2");
	   		int id = 0, year=0;
	   		String title = "", releaseDate = "", lang="", description = "";
	   		Double duration = 0.0, imdb = 0.0;
	   		if(rs != null && rs.next()){
	   			id = rs.getInt("mov_id");
	   			title = rs.getString("mov_title");
	   			year = rs.getInt("mov_year");
	   			duration = rs.getDouble("mov_time");
	   			lang = rs.getString("mov_lang");
	   			releaseDate = rs.getString("mov_dt_rel");
	   			imdb = rs.getDouble("imdb_rating");
	   			description = rs.getString("descr");
	   		
	      %>
	
    <div class="home-main-container">        
        <div class="overlay-container">
        	
        
            <div class="menu-container" style="gap: 1rem 0; width: 60%; height: 80%; overflow-y: auto;">
                <h1 class="menu-title movie-title">
                    <%= title %>
                </h1>
                <div class="movie-content-box">
                    <div class="movie-image-container content">
                    	<% String img_url = "images/"+id+".jpg"; %>
                        <img src=<%=img_url %> alt="hero-image-container">
                    </div>
                    <div class="movie-detail-container content">
                        <!-- movie id -->
                        <div class="movie-detail-item">
                            <div class="movie-subheading data-box"><h2>ID: </h2></div>
                            <div class="movie-data data-box"><p><%= id %></p></div>
                        </div>
    
                        <!-- movie year -->
                        <div class="movie-detail-item">
                            <div class="movie-subheading data-box"><h2>Year: </h2></div>
                            <div class="movie-data data-box"><p><%= year %></p></div>
                        </div>
    
                        <!-- movie duration -->
                        <div class="movie-detail-item">
                            <div class="movie-subheading data-box"><h2>Duration: </h2></div>
                            <div class="movie-data data-box"><p><span><%= duration %></span>hr(s)</p></div>
                        </div>
    
                        <!-- movie language -->
                        <div class="movie-detail-item">
                            <div class="movie-subheading data-box"><h2>Language: </h2></div>
                            <div class="movie-data data-box"><p><%= lang %></p></div>
                        </div>
    
                        <!-- movie date of release -->
                        <div class="movie-detail-item">
                            <div class="movie-subheading data-box"><h2>Release: </h2></div>
                            <div class="movie-data data-box"><p><%= releaseDate %></p></div>
                        </div>
    
                        <!-- movie description -->
                        <div class="movie-detail-item">
                            <div class="movie-subheading data-box"><h2>Description: </h2></div>
                            <div class="movie-data data-box"><p><%= description %></p></div>
                        </div>
                    </div>
                </div>
                <a href="userIndex.jsp" class="back_home_btn">Back Home</a>
            </div>
        </div>
    </div>
    
    <% }else{ %>
    <div class="home-main-container">        
        <div class="overlay-container">
        
            <div class="menu-container" style="gap: 1rem 0; width: 60%; height: 80%; overflow-y: auto; justify-content:center;">
                <h1 class="menu-title movie-title">
                    Movie Data Not Found!
                </h1>
                
                <a href="userIndex.jsp" class="back_home_btn">Back Home</a>
            </div>
        </div>
    </div>
    
    <%} %>
</body>
</html>


