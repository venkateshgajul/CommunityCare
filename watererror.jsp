<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Issue Registration Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .error-container {
            max-width: 650px;
            width: 100%;
            background-color: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            border-top: 5px solid #d32f2f;
        }
        .error-title {
            color: #d32f2f;
            margin-bottom: 20px;
        }
        .error-message {
            background-color: #ffebee;
            padding: 15px;
            border-radius: 4px;
            margin: 20px 0;
            text-align: left;
        }
        .btn {
            display: inline-block;
            background-color: #1976d2;
            color: white;
            padding: 12px 25px;
            text-decoration: none;
            border-radius: 4px;
            margin-top: 20px;
            transition: background-color 0.3s;
            font-size: 16px;
        }
        .btn:hover {
            background-color: #1565c0;
        }
        .error-details {
            margin-top: 20px;
            text-align: left;
            font-size: 14px;
            color: #757575;
        }
        .btn-secondary {
            background-color: #757575;
            margin-left: 10px;
        }
        .btn-secondary:hover {
            background-color: #616161;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1 class="error-title">Error Registering Issue</h1>
        
        <div class="error-message">
            <% if(request.getParameter("message") != null) { %>
                <p><strong>Error:</strong> <%= request.getParameter("message") %></p>
            <% } else { %>
                <p><strong>Error:</strong> An unexpected error occurred while processing your request.</p>
            <% } %>
        </div>
        
        <p>Please try again or contact support if the problem persists.</p>
        
        <% if(exception != null) { %>
            <div class="error-details">
                <p><strong>Technical Details:</strong></p>
                <p><%= exception.getMessage() %></p>
            </div>
        <% } %>
        
        <div>
            <a href="water-issue-form.html" class="btn">Try Again</a>
            <a href="main.html" class="btn btn-secondary">Return to Home</a>
        </div>
    </div>
</body>
</html>