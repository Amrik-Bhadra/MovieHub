<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        .password-container {
            position: relative;
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        .password-container input {
            padding-right: 30px; 
        }
        .password-container .toggle-password {
            position: absolute;
            right: 10px;
            cursor: pointer;
        }
        .error-popup {
            display: none;
            color: red;
            font-size: 12px;
            margin-top: -10px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<%
    String userType = request.getParameter("userType");
    String msg = request.getParameter("msg");
  

    if (userType != null && userType.equalsIgnoreCase("admin")) {
%>
<div class="home-main-container">        
    <div class="overlay-container">
        <div class="menu-container">
            <h1 class="menu-title">
                Admin Registration
            </h1>
            
            <div class="registration-form-container">
                <span id="passwordError" style="color: red; display: none;">Password must contain at least 3 words and 2 letters.</span>
                <div id="emailError" class="error-popup" style="display: none; color: #fff; font-size: 0.9rem; font-weight: 500">Please enter a valid email address containing '@'</div>
                <form action="MyServlet" method="post" id="emailForm">
                    <input type="text" name="username" id="username" placeholder="Username">
                    <input type="text" name="email" id="email" placeholder="Email">
                    <input type="hidden" name="userType" id="userType" value="admin">
                   
                    <div class="password-container">
			            <input type="password" name="password" id="password" placeholder="Password" class="password-input">
			            <i class="fa fa-eye toggle-password" id="togglePassword"></i>
			        </div>

                    
                    
                    <div class="password-container">
			            <input type="password" name="confirm_password" id="confirm_password" placeholder="Confirm Password">
			            <i class="fa fa-eye toggle-password" id="toggleConfirmPassword"></i>
			        </div>
                    <button class="submit-btn">Submit</button>
                    <input type="reset" class="submit-btn" style="background-color: #333">
                </form>

                <div class="login-container-btn">
                    <p>Already have an account?</p>
                    <a href="UserLogin.jsp">Login</a>
                </div>
            </div>
            
            <%
				if(msg != null && msg.equalsIgnoreCase("1")){
			%>
            <p style="color: #fff; background-color: green; padding: 0.1rem 0.3rem; border-radius:10px;">
                registered successfully!
            </p>
            <%
				}else if(msg != null && msg.equalsIgnoreCase("0")){
            %>
            <p style="color: #fff; background-color: red; padding: 0.1rem 0.3rem; border-radius:10px;">
                Registration failed!
            </p>
            <%
				}
            %>
        </div>
    </div>
</div>
<%
    } else if (userType != null && userType.equalsIgnoreCase("user")) {
%>
<div class="home-main-container">        
    <div class="overlay-container">
    	
        <div class="menu-container">
            <h1 class="menu-title">
                User Registration
            </h1>
            
            <div class="registration-form-container">
                <span id="passwordError" style="color: red; display: none;">Password must contain at least 3 words and 2 letters.</span>
                <div id="emailError" class="error-popup" style="display: none; color: #fff; font-size: 0.9rem; font-weight: 500">Please enter a valid email address containing '@'</div>
                <form action="MyServlet" method="post" id="emailForm">
                    <input type="text" name="username" id="username" placeholder="Username">
                    <input type="text" name="email" id="email" placeholder="Email">
                    <input type="hidden" name="userType" id="userType" value="user">
                   
                    <div class="password-container">
			            <input type="password" name="password" id="password" placeholder="Password" class="password-input">
			            <i class="fa fa-eye toggle-password" id="togglePassword"></i>
			        </div>

                    
                    
                    <div class="password-container">
			            <input type="password" name="confirm_password" id="confirm_password" placeholder="Confirm Password">
			            <i class="fa fa-eye toggle-password" id="toggleConfirmPassword"></i>
			        </div>
                    <button class="submit-btn">Submit</button>
                </form>

                <div class="login-container-btn">
                    <p>Already have an account?</p>
                    <a href="UserLogin.jsp">Login</a>
                </div>
            </div>
            
            <%
				if(msg != null && msg.equalsIgnoreCase("1")){
			%>
            <p style="color: #fff; background-color: green; padding: 0.1rem 0.3rem; border-radius:10px;">
                registered successfully!
            </p>
            <%
				}else if(msg != null && msg.equalsIgnoreCase("0")){
            %>
            <p style="color: #fff; background-color: red; padding: 0.1rem 0.3rem; border-radius:10px;">
                Registration failed!
            </p>
            <%
				}
            %>
        </div>
    </div>
</div>
<%
    }
%>

	<script>
    document.getElementById('emailForm').addEventListener('submit', function(event) {
        var emailField = document.getElementById('email');
        var emailError = document.getElementById('emailError');
        var emailValue = emailField.value;
        
        var passwordField = document.getElementById('password');
        var passwordError = document.getElementById('passwordError');
        var passwordValue = passwordField.value;

        var confirmPasswordField = document.getElementById('confirm_password');
        var confirmPasswordValue = confirmPasswordField.value;

        // Validate email
        if (emailValue.indexOf('@') === -1) {
            event.preventDefault();
            emailError.style.display = 'block';
        } else {
            emailError.style.display = 'none';
        }
        
        // Validate password
        var passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{4,}$/;
        if (!passwordRegex.test(passwordValue)) {
            event.preventDefault();
            passwordError.style.display = 'block';
        } else {
            passwordError.style.display = 'none';
        }

        // Validate confirm password
        if (passwordValue !== confirmPasswordValue) {
            event.preventDefault();
            alert('Passwords do not match.');
        }
    });

    // Hide email error message on input
    document.getElementById('email').addEventListener('input', function() {
        var emailError = document.getElementById('emailError');
        emailError.style.display = 'none';
    });

    // Password visibility toggle
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

    document.getElementById('toggleConfirmPassword').addEventListener('click', function () {
        var confirmPasswordField = document.getElementById('confirm_password');
        var icon = this;

        if (confirmPasswordField.type === 'password') {
            confirmPasswordField.type = 'text';
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        } else {
            confirmPasswordField.type = 'password';
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        }
    });
</script>
	
    
</body>
</html>