<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Movie record</title>
    <link rel="stylesheet" href="style.css">
         <link rel="shortcut icon" href="images/clapperboard.png" type="image/x-icon">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <div class="home-main-container">        
        <div class="overlay-container">
            <div class="menu-container">
                <h1 class="menu-title">
                    Delete<span>Data</span>
                </h1>
                <div class="update-form-container">
                    <form action="MyDeleteServlet" method="post">

                        <!-- enter movie id whose record to be updated  -->
                        <input type="text" name="movie_id" id="movie_id" placeholder="Movie ID" required>
                        


                        <button class="button-17 updateBtn" role="button" value="update" name="updateBtn">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>