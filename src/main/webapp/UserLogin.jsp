<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Application - by Amrik Bhadra</title>
    <link rel="stylesheet" href="style.css">
         <link rel="shortcut icon" href="images/clapperboard.png" type="image/x-icon">
    
</head>
<body>
    <div class="home-main-container">        
        <div class="overlay-container">
            <div class="menu-container">
                <h1 class="menu-title">
                    Login<span>Form</span>
                </h1>
                
                <div class="registration-form-container">
                    <form action="LoginServlet" method="post">
                        <input type="text" name="email" id="email" placeholder="Email">
                        <input type="password" name="password" id="password" placeholder="Password">
                        <button class="submit-btn">Submit</button>
                    </form>

                    <div class="login-container-btn">
                        <p>Don't have an account?</p>
                        <a href="select_user.html">Register</a>
                    </div>
                </div>

                <!-- <p style="color: #fff;">
                    Registered successfully!
                </p> -->
            </div>
        </div>
    </div>
</body>
</html>


