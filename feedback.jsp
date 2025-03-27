<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String feedback = request.getParameter("message");
    String ratingStr = request.getParameter("rating");
    

    Connection con = null;
    PreparedStatement ps = null;

    try {
        // Validate Inputs
        if (name == null || email == null || feedback == null || ratingStr == null || 
            name.trim().isEmpty() || email.trim().isEmpty() || feedback.trim().isEmpty()) {
            throw new Exception("All fields are required.");
        }

        int rating = Integer.parseInt(ratingStr); // Convert rating to int

        if (rating < 1 || rating > 5) {
            throw new Exception("Rating must be between 1 and 5.");
        }

        // Load MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/communitycare", "root", "");

        // Insert Query
        String query = "INSERT INTO feedback (name, email, feedback, rating) VALUES (?, ?, ?, ?)";
        ps = con.prepareStatement(query);
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, feedback);
        ps.setInt(4, rating);

        int i = ps.executeUpdate();

        if (i > 0) {
            out.println("<script>alert('Thank you for your feedback!'); window.location.href='main.html';</script>");
        } else {
            out.println("<script>alert('Failed to submit feedback.'); window.location.href='main.html';</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('Error: " + e.getMessage() + "'); window.location.href='main.html';</script>");
    } finally {
        try {
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
