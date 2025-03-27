<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="java.net.URLEncoder" %>

<%
    // Database configuration
    String dbURL = "jdbc:mysql://localhost:3306/communitycare";
    String dbUser = "root";
    String dbPassword = "";

    // Get form data
    String issueType = request.getParameter("issueType");
    String description = request.getParameter("description");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String location = request.getParameter("location");
    String landmark = request.getParameter("nearbyPlace");
    String imageUrl = request.getParameter("imageUrl");

    try {
        // Load JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Create connection
        try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword)) {
            // Check if email exists in 'register' table
            String checkQuery = "SELECT * FROM register WHERE email = ?";
            try (PreparedStatement checkStmt = conn.prepareStatement(checkQuery)) {
                checkStmt.setString(1, email);
                ResultSet rs = checkStmt.executeQuery();

                if (!rs.next()) {
                    // Email not found, redirect to error page
                    response.sendRedirect("watererror.jsp?message=" + URLEncoder.encode("Email not registered!", "UTF-8"));
                } else {
                    // Email exists, proceed with inserting issue report
                    String sql = "INSERT INTO waterreports (issue_type, description, name, email, phone, location, nearby_place, image_url) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                        pstmt.setString(1, issueType);
                        pstmt.setString(2, description);
                        pstmt.setString(3, name);
                        pstmt.setString(4, email);
                        pstmt.setString(5, phone);
                        pstmt.setString(6, location);
                        pstmt.setString(7, landmark);
                        pstmt.setString(8, imageUrl);

                        // Execute query
                        int rowsAffected = pstmt.executeUpdate();
                        if (rowsAffected > 0) {
                            response.sendRedirect("success.jsp");
                        } else {
                            response.sendRedirect("watererror.jsp?message=" + URLEncoder.encode("Failed to report issue.", "UTF-8"));
                        }
                    }
                }
            }
        }
    } catch (Exception e) {
        // Handle errors
        e.printStackTrace();
        response.sendRedirect("watererror.jsp?message=" + URLEncoder.encode(e.getMessage(), "UTF-8"));
    }
%>
