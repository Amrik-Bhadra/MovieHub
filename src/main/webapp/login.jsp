<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Application - by Amrik Bhadra</title>
    <link rel="stylesheet" href="style.css">
    <style>
     	.password-container {
            position: relative;
            display: flex;
            align-items: center;
        }
        .password-container input {
            padding-right: 30px; 
        }
        .password-container .toggle-password {
            position: absolute;
            right: 10px;
            cursor: pointer;
        }
     </style>
</head>
<body>
    <div class="home-main-container">        
        <div class="overlay-container">
            <div class="menu-container">
                <h1 class="menu-title">
                    Login Form
                </h1>
                
                <div class="registration-form-container">
                    <form action="LoginServlet" method="post">
                        <input type="text" name="email" id="email" placeholder="Email" required>
						<div class="password-container">
				            <input type="password" name="password" id="password" placeholder="Password">
				            <i class="fa fa-eye toggle-password" id="togglePassword"></i>
				        </div>
                        <button class="submit-btn">Submit</button>
                    </form>
                    
                    <p><a  href="forget password" style="color: white">Forget Password?</a></p>

                    <div class="login-container-btn">
                        <p>Don't have an account?</p>
                        <a href="select_user.html">Register</a>
                    </div>

                    <% 
                        String error = request.getParameter("error");
                        if (error != null) {
                            if (error.equals("invalid")) {
                    %>
                    <p style="color: #fff; background-color: red; padding: 0.1rem 0.3rem; border-radius:10px;">
                        Invalid email or password. Please try again.
                    </p>
                    <% 
                            } else if (error.equals("exception")) {
                    %>
                    <p style="color: #fff; background-color: red; padding: 0.1rem 0.3rem; border-radius:10px;">
                        An error occurred during login. Please try again later.
                    </p>
                    <% 
                            }
                        } 
                    %>
                </div>
            </div>
        </div>
    </div>
    
    <script>
    document.getElementById('togglePassword').addEventListener('click', function () {
        var passwordField = document.getElementById('password');
        var icon = this;

        if (passwordField.type === 'password') {
            passwordField.type = 'text';
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        } else {
            passwordField.type = 'password';
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        }
    });
    </script>
</body>
</html>
