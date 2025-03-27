<%@ page import="java.sql.*, java.net.URLEncoder" %>
<%
String issueId = request.getParameter("issueId");
String newStatus = request.getParameter("newStatus");

if (issueId == null || newStatus == null) {
    response.sendRedirect("sanitationreport.jsp?message=" + URLEncoder.encode("Invalid request!", "UTF-8"));
    return;
}

try {
   
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/communitycare", "root", "");

    
    String sql = "UPDATE sanitationreports SET status = ? WHERE id = ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, newStatus);
    pstmt.setInt(2, Integer.parseInt(issueId));
    int rowsUpdated = pstmt.executeUpdate();
    out.println("Rows Updated: " + rowsUpdated + "<br>");

    pstmt.close();
    conn.close();

    if (rowsUpdated > 0) {
        response.sendRedirect("sanitationreport.jsp?message=" + URLEncoder.encode("Status updated successfully!", "UTF-8"));
    } else {
        response.sendRedirect("sanitationreport.jsp?message=" + URLEncoder.encode("Failed to update status!", "UTF-8"));
    }
} catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("sanitationreport.jsp?message=" + URLEncoder.encode("Error: " + e.getMessage(),"UTF-8"));
}
%>