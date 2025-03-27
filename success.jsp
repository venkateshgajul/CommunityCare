<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Issue Registration Success</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #2563eb;
            --primary-dark: #1d4ed8;
            --success: #059669;
            --success-light: #d1fae5;
            --gray-50: #f9fafb;
            --gray-100: #f3f4f6;
            --gray-200: #e5e7eb;
            --gray-700: #374151;
            --gray-800: #1f2937;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: var(--gray-800);
            background-color: var(--gray-100);
            background-image: linear-gradient(to bottom right, #f9fafb, #f3f4f6);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        
        .container {
            max-width: 650px;
            width: 100%;
            background-color: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.05), 0 5px 10px rgba(0,0,0,0.02);
            position: relative;
            overflow: hidden;
            animation: fadeIn 0.5s ease-out;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(to right, var(--success), #10b981);
        }
        
        h1 {
            color: var(--gray-800);
            font-size: 2.2rem;
            margin-bottom: 0.5rem;
            font-weight: 700;
            text-align: center;
            position: relative;
            padding-bottom: 15px;
        }
        
        h1::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 3px;
            background-color: var(--success);
            border-radius: 3px;
        }
        
        .success-icon {
            text-align: center;
            margin: 20px 0;
            color: var(--success);
            font-size: 3.5rem;
            animation: scaleIn 0.5s ease-out;
        }
        
        @keyframes scaleIn {
            from { transform: scale(0); }
            to { transform: scale(1); }
        }
        
        .message {
            font-size: 1.25rem;
            color: var(--success);
            font-weight: 600;
            margin: 20px 0;
            text-align: center;
            letter-spacing: 0.01em;
        }
        
        .issue-id-container {
            text-align: center;
            margin: 25px 0;
        }
        
        .issue-id {
            background-color: var(--success-light);
            color: var(--success);
            padding: 12px 20px;
            border-radius: 8px;
            display: inline-block;
            margin: 10px 0;
            font-weight: 600;
            letter-spacing: 0.05em;
            border: 1px dashed var(--success);
            box-shadow: 0 2px 5px rgba(5, 150, 105, 0.1);
        }
        
        p {
            color: var(--gray-700);
            margin-bottom: 15px;
            text-align: center;
            font-size: 1.05rem;
        }
        
        .info-text {
            background-color: var(--gray-50);
            padding: 15px;
            border-radius: 8px;
            margin: 20px 0;
            font-size: 0.95rem;
            border-left: 3px solid var(--primary);
        }
        
        .btn-container {
            text-align: center;
            margin-top: 30px;
        }
        
        .btn {
            display: inline-block;
            background-color: var(--primary);
            color: white;
            padding: 12px 24px;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(37, 99, 235, 0.1);
            border: none;
            cursor: pointer;
            font-size: 1rem;
        }
        
        .btn:hover {
            background-color: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 6px 8px rgba(37, 99, 235, 0.15);
        }
        
        .btn:active {
            transform: translateY(0);
        }
        
        .btn i {
            margin-right: 8px;
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 30px 20px;
            }
            
            h1 {
                font-size: 1.8rem;
            }
            
            .message {
                font-size: 1.1rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Success!</h1>
        
        <div class="success-icon">
            <i class="fas fa-check-circle"></i>
        </div>
        
        <p class="message">You have successfully registered the issue.</p>
    
        <div class="info-text">
            <p style="text-align: left; margin-bottom: 0;">Our team will review your issue and take appropriate action.Check Your Issue Status from the View Status Portal</p>
        </div>
        
        <div class="btn-container">
            <a href="main.html" class="btn"><i class="fas fa-home"></i> Return to Home</a>
        </div>
    </div>
</body>
</html>