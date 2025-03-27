<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Issue Status Result</title>
    <link rel="stylesheet" href="viewstatus.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"> 
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
</head>
<style>.body1 {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 80vh;
    padding: 20px;
}

.container {
    background: #fff;
    padding: 30px;
    width: 50%;
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}

/* Headings */
h1 {
    text-align: center;
    font-size: 28px;
    color: #333;
    margin-bottom: 15px;
}

h2 {
    font-size: 22px;
    color: #2a2a72;
    margin-bottom: 10px;
}

/* Issue Status Box */
.status-result {
    background: #f8f9fa;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
}

.status-item {
    font-size: 18px;
    margin: 10px 0;
}

.status-label {
    font-weight: bold;
    color: #333;
}

/* Status Colors */
.status-pending {
    color: #ff9800;
    font-weight: bold;
}

.status-processing {
    color: #1e88e5;
    font-weight: bold;
}

.status-resolved {
    color: #43a047;
    font-weight: bold;
}

/* Back Button */
.btn-back {
    display: inline-block;
    margin-top: 20px;
    padding: 10px 20px;
    font-size: 16px;
    font-weight: 500;
    color: white;
    background: #2a2a72;
    border-radius: 5px;
    text-decoration: none;
    transition: 0.3s;
}

.btn-back:hover {
    background: #ff6347;
}
</style>
<body>
    <header>
        <div class="topbar">
            <ul>
                <li>Report and Repair, with Community Care</li>  
            </ul>
        </div>
        <nav class="navbar">
            <div class="logo">
                <img src="images/logo.png" alt="logo"><text>CommunityCare</text>
            </div>
            <ul> 
                <li><a href="main.html"><i class="fa-solid fa-house"></i>  Home</a></li>
                <li><a href="forum.html"><i class="fa-solid fa-comment"></i>  Community Forum</a></li>
                <li><a href="aboutus.html"><i class="fa-solid fa-address-card"></i>  About us</a></li>
            </ul>
        </nav>
    </header>
    <div class="body1">
        <div class="container">
            <%
            // Check if CAPTCHA was validated
            String captchaValidated = request.getParameter("captchaValidated");
            if (captchaValidated == null || !captchaValidated.equals("true")) {
                // If CAPTCHA wasn't validated, redirect back to the form
                response.sendRedirect("viewstatus.html");
                return;
            }
            
            // Get form parameters
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String issueType = request.getParameter("issueType");
            
            // Database connection parameters
            String jdbcURL = "jdbc:mysql://localhost:3306/communitycare";
            String dbUser = "root";
            String dbPassword = "";
            
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            
            try {
                // Load the JDBC driver
                Class.forName("com.mysql.jdbc.Driver");
                
                // Establish connection
                conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
                
                // Prepare SQL query based on issue type
                String tableName = "";
                switch(issueType) {
                    case "waterIssue":
                        tableName = "waterreports";
                        break;
                    case "electricityIssue":
                        tableName = "electricityreports";
                        break;
                    case "damagedRoadIssue":
                        tableName = "roadreports";
                        break;
                    case "sanitationIssue":
                        tableName = "sanitationreports";
                        break;
                    default:
                        throw new Exception("Invalid issue type");
                }
                
                // Query to find the issue with matching email and phone
                String sql = "SELECT * FROM " + tableName + " WHERE email = ? AND phone = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, email);
                pstmt.setString(2, phone);
                
                rs = pstmt.executeQuery();
                
                if (rs.next()) {
                    // Issue found, display the details
                    %>
                    <h1>Issue Status</h1>
                    <div class="status-result">
                        <h2>Issue Details</h2>
                        <div class="status-item">
                            <span class="status-label">Issue ID:</span>
                            <%= rs.getString("id") %>
                        </div>
                        <div class="status-item">
                            <span class="status-label">Issue Type:</span>
                            <%= rs.getString("issue_type") %>
                        </div>
                        <div class="status-item">
                            <span class="status-label">Description:</span>
                            <%= rs.getString("description") %>
                        </div>
                        <div class="status-item">
                            <span class="status-label">Location:</span>
                            <%= rs.getString("location") %>
                        </div>
                        <div class="status-item">
                            <span class="status-label">Reported On:</span>
                            <%= rs.getTimestamp("created_at") %>
                        </div>
                        <div class="status-item">
                            <span class="status-label">Status:</span>
                            <% 
                            String status = rs.getString("status");
                            String statusClass = "";
                            
                            if (status.equalsIgnoreCase("pending")) {
                                statusClass = "status-pending";
                            } else if (status.equalsIgnoreCase("resolved")) {
                                statusClass = "status-resolved";
                            } else if (status.equalsIgnoreCase("processing")) {
                                statusClass = "status-processing";
                            }else if (status.equalsIgnoreCase("complete")) {
                                statusClass = "status-complete";
                            }
                            %>
                            <span class="<%= statusClass %>"><%= status %></span>
                        </div>
                        
                        <% if (rs.getString("status_notes") != null && !rs.getString("status_notes").isEmpty()) { %>
                        <div class="status-item">
                            <span class="status-label">Status Notes:</span>
                            <%= rs.getString("status_notes") %>
                        </div>
                        <% } %>
                        
                        <% if (rs.getString("resolution_date") != null) { %>
                        <div class="status-item">
                            <span class="status-label">Resolution Date:</span>
                            <%= rs.getTimestamp("resolution_date") %>
                        </div>
                        <% } %>
                    </div>
                    <p>
                        <a href="viewstatus.html" class="btn-back">Check Another Issue</a>
                    </p>
                    <%
                } else {
                    // No issue found with the provided email and phone
                    %>
                    <h1>Issue Status</h1>
                    <div class="status-result">
                        <p>No issue found with the provided email and phone number for the selected issue type.</p>
                        <p>Please check your information and try again.</p>
                    </div>
                    <p>
                        <a href="viewstatus.html" class="btn-back">Go Back</a>
                    </p>
                    <%
                }
                
            } catch (Exception e) {
                // Handle exceptions
                %>
                <h1>Error</h1>
                <div class="status-result">
                    <p>An error occurred while retrieving your issue status: <%= e.getMessage() %></p>
                </div>
                <p>
                    <a href="viewstatus.html" class="btn-back">Go Back</a>
                </p>
                <%
            } finally {
                // Close resources
                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                if (conn != null) try { conn.close(); } catch (SQLException e) {}
            }
            %>
        </div>
    </div>
</body>
</html>