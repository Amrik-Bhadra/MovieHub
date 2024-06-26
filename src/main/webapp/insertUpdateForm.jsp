<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert Movie record</title>
    <link rel="stylesheet" href="style.css">
         <link rel="shortcut icon" href="images/clapperboard.png" type="image/x-icon">
    
    <style>
    	.movie-input-box{
            width: 70%;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 0 1rem;
        }
        .movie-input-box textarea{
            width: 100%;
            height: 5rem;
            border-radius: 6px;
            padding: 0.8rem;
            border: none;
            outline: none;
            border-radius: 5px;
            color: #3c4043;
            overflow-y: auto;
            resize: none;
        }
        .movie-input-box textarea::placeholder{
            color: #333;
            font-weight: 500;
            font-size: 0.75rem;
        }
        #movie_lang {
            width: 100%;
            border-radius: 6px;
            padding: 0.8rem;
            border: none;
            outline: none;
            border-radius: 5px;
            color: #3c4043;
        }
        #movie_lang::placeholder{
            color: #333;
            font-weight: 500;
            font-size: 0.75rem;
        }

        #movie_lang option {
            padding: 0.5rem;
        }
    </style>
</head>
<body>
    <div class="home-main-container">        
        <div class="overlay-container">
            <div class="menu-container">
                <h1 class="menu-title">
                    Insert to <span>Update Data</span>
                </h1>
                <div class="insert-form-container">
                    <form action="InsertUpdateFormServlet" method="post">
                    	<input type="hidden" name="updateCheckBoxString" value="${checkBoxString}">
                    	<input type="text" name="movie_id" id="movie_id" placeholder="Movie ID" required>
                       	<%
                       		String[] updateAttributes = request.getParameterValues("updateCheckBox");
                       	if(updateAttributes != null){
                       		for(String attribute : updateAttributes){
                       			if(attribute.equalsIgnoreCase("title")){
                       	%>
                       				<input type="text" name="movie_title" id="movie_title" placeholder="Movie Title" required>
                       	<%
                       			}else if(attribute.equalsIgnoreCase("year")){
                       	%>
                       				<input type="text" name="movie_year" id="movie_year" placeholder="Year" required>

                       	<%
                       			}else if(attribute.equalsIgnoreCase("time")){
                       	%>
                       				<input type="text" name="movie_time" id="movie_time" placeholder="Duration" required>

                       	<%
                       		}else if(attribute.equalsIgnoreCase("language")){
                               	%>
                   				<!-- movie_language input -->
	                            <div class="movie-input-box">
                           
		                            <!-- movie_language input -->
		                            <select name="movie_lang" id="movie_lang">
		                                <option value="">Select Language</option>
		                                <option value="hindi">Hindi</option>
		                                <option value="english">English</option>
		                                <option value="marathi">Marathi</option>
		                                <option value="tamil">Tamil</option>
		                                <option value="telegu">Telegu</option>
		                                <option value="bengali">Bengali</option>
		                                <option value="gujrati">Gujrati</option>
		                                <option value="punjabi">Punjabi</option>
		                            </select>
                        		</div>

                   	<%
                       		}else{
                   		%>
                   		<input type="text" name="movie_release_date" id="movie_release_date" placeholder="Release" required>
                   		<%
                   			}
                       	}}else{
                       		%>
                       		<p>No update attributes received!</p>
                       		<%
                       	}
                       	%>
                        <button class="button-17 insertBtn" role="button" value="insert" name="insertBtn">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
