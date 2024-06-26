<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="style.css" />
         <link rel="shortcut icon" href="images/clapperboard.png" type="image/x-icon">
    
    <style>
    	.menu-container{
    		width: 90%;
    		padding: 2rem;
    	}
    	.menu-btn-container-display{
    		width: 100%;
    	}
    </style>
  </head>
  <body>
    <div class="home-main-container">
      <div class="overlay-container">
        <div class="menu-container-display menu-container">
          <h1 class="menu-title">Available Data </h1>
          <div class="menu-btn-container menu-btn-container-display">
            <%
                        // Get the ResultSet object from the request scope
                        ResultSet rs = (ResultSet) request.getAttribute("list");
                        
                        // Check if there are any results
                        if (rs != null && rs.next()) {
                            // Get the column names (assuming you know them)
                            int columnCount = rs.getMetaData().getColumnCount();
                            String[] columnNames = new String[columnCount];
                            for (int i = 1; i <= columnCount; i++) {
                                columnNames[i - 1] = rs.getMetaData().getColumnName(i);
                            }
                    %>
            <table>
              <thead>
                <tr>
                    <% 
                    // Display table header row
                    for (String columnName : columnNames) {
                %>
                    <th><%= columnName %></th>
                <%
                    }
                %>
                </tr>
              </thead>
              <tbody>
                <%
                                        // Loop through each record in the ResultSet
                                        do {
                                    %>
                                            <tr>
                                                <% 
                                                    // Display data for each column in the current row
                                                    for (int i = 1; i <= columnCount; i++) {
                                                        String data = rs.getString(i);
                                                %>
                                                    <th><%= data %></th>
                                                <%
                                                    }
                                                %>
                                            </tr>
                                    <%
                                        } while (rs.next());
                                    %>
              </tbody>
            </table>
            <%
                        } else {
                            // No data found message
                            out.println("<p>No data found!</p>");
                        }
                    %>
          </div>
          
          <a href="index.jsp" style="color: #fff; border-bottom: 2px solid red; font-size:1.3rem">Home</a>
          
        </div>
      </div>
    </div>
  </body>
</html>

