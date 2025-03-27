<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, java.net.URLEncoder" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FeedbackData</title>
    <link rel="icon" href="https://yt3.ggpht.com/a/AGF-l78km1YyNXmF0r3-0CycCA0HLA_i6zYn_8NZEg=s900-c-k-c0xffffffff-no-rj-mo" type="image/gif" sizes="16x16">
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;	
            margin: 0;
            padding: 0;
            color: #333;
            background: rgb(44, 62, 80, 0.2);
        }
        /* Center Align the Controls */
h2 {
    text-align: center;
    font-size: 28px;  /* Slightly larger */
    font-weight: bold;
    margin-bottom: 20px;
    color: #333;
    position: relative;
    display: inline-block;
    padding-bottom: 10px;
    text-transform: uppercase;
    letter-spacing: 2px;
}

/* Animated Underline */
h2::after {
    content: "";
    position: absolute;
    left: 50%;
    bottom: 0;
    width: 0%;
    height: 4px;
    background: linear-gradient(90deg, #87CEFA, #1E90FF); /* Gradient Color */
    box-shadow: 0px 0px 8px rgba(255, 87, 51, 0.8); /* Glow Effect */
    border-radius: 5px;
    transform: translateX(-50%);
    animation: underlineAnimation 2s infinite alternate ease-in-out;
}

/* Keyframes for Automatic Animation */
@keyframes underlineAnimation {
    0% {
        width: 0%;
    }
    100% {
        width: 100%;
    }
}


#downloadPDF {
    display: inline-block;
    margin: 10px 5px;
    padding: 10px 15px;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 600;
    transition: all 0.3s ease-in-out;
    background: #007bff;
    color: white;
    border: none;
    cursor: pointer;
    
    /* Align Left */
    position: absolute;
    left: 20px;
}

#downloadPDF:hover {
    background: #0056b3;
    transform: scale(1.05);
}


/* Align the Sorting Controls */
#fullPage {
    text-align: center;
}

        
        .container {
            width: 80%;
            margin: 50px auto;
            background: whitesmoke;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
        }
        /* Table Styling */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    background: white;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
}


/* Table Header */
/* Table Header */
th {
    background: rgb(44, 62, 80); /* Dark Blue */
    color: white;
    font-weight: 600;
    padding: 14px;
    text-transform: uppercase;
    letter-spacing: 1px;
    border-left: 2px solid #ffffff1a;
}


/* Table Body */
td {
    padding: 12px;
    border-bottom: 1px solid #ddd;
    transition: all 0.3s ease-in-out;
}

/* Alternate Row Styling */
tr:nth-child(even) {
    background: #f8f9fa;
}

/* Hover Effect */
tr:hover {
    background: #e9f5ff;
    transform: scale(1.02);
    transition: 0.3s ease-in-out;
}

/* Image Styling */
td img {
    width: 70px;
    height: 70px;
    object-fit: cover;
    border-radius: 8px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease-in-out;
}

td img:hover {
    transform: scale(1.1);
}

/* Status Update Section */
.status-update {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px; /* Space between dropdown and button */
}

/* Dropdown Styling */
select {
    padding: 8px;
    border-radius: 8px;
    border: 1px solid #ccc;
    font-size: 14px;
    background: #fff;
    cursor: pointer;
}

/* Button Styling */
button {
    background: #28a745;
    color: white;
    padding: 8px 12px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-weight: 600;
    transition: all 0.3s ease-in-out;
}

button:hover {
    background: #218838;
    transform: scale(1.05);
}
#logout {
    display: inline-block;
    margin: 10px 5px;
    padding: 10px 15px;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 600;
    transition: all 0.3s ease-in-out;
    background: #dc3545;
    color: white;
    border: none;
    cursor: pointer;
    
    /* Position it on the right */
    position: absolute;
    right: 20px;
}

#logout:hover {
    background: #c82333;
    transform: scale(1.05);
}


        
    </style>
</head>
<body>
<div id="fullPage">
    <h2>FEEDBACK DATA REPORTS</h2>

    
    <button id="downloadPDF">Download PDF</button>
<button id="logout" onclick="logout()">Back to Dashboard</button>
    <div class="container">
        <table id="responseTable">
            <thead>
                <tr>
                    
                    <th>Name</th>
                    <th>Email</th>
                    <th>Message</th>
                     <th>Rating</th>
                   
                </tr>
            </thead>
            <tbody>
                <% 
                   Connection conn = null; 
                   Statement stmt = null; 
                   ResultSet rs = null;
                   try {
                       Class.forName("com.mysql.cj.jdbc.Driver");
                       conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/communitycare", "root", "");
                       stmt = conn.createStatement();
                       rs = stmt.executeQuery("SELECT * FROM feedback");
                       while (rs.next()) { %>
                <tr>
                
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("feedback") %></td>
                     <td><%= rs.getString("rating") %></td>
                    
                    
                </tr>
                <% } 
                   } catch (Exception e) { e.printStackTrace();
                   } finally { 
                       if (rs != null) rs.close(); 
                       if (stmt != null) stmt.close(); 
                       if (conn != null) conn.close(); 
                   }
                %>
            </tbody>
        </table>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>

<script>




// ✅ Full-Page PDF Export  
document.getElementById('downloadPDF').addEventListener('click', () => {
    document.getElementById('downloadPDF').style.display = 'none';  
     

    const fullPageContent = document.getElementById('fullPage');  
    const opt = {
        margin: [0.5, 0.5, 0.5, 0.5],  
        filename: 'Feedback_Data_Report.pdf', 
        image: { type: 'jpeg', quality: 0.98 }, 
        html2canvas: { scale: 2, dpi: 192, letterRendering: true }, 
        jsPDF: { unit: 'in', format: 'a2', orientation: 'portrait' }  
    };

    html2pdf().from(fullPageContent).set(opt).save().then(() => {
        document.getElementById('downloadPDF').style.display = 'block';  
       
    });
});
function logout() {
    window.location.href = "admin.html"; // Redirect to dashboard after logout
}
</script>
</script>



</body>
</html>
