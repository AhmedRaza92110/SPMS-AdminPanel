<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Edit Slot</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Segoe UI', sans-serif;
    }

    body {
      min-height: 100vh;
      background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
      padding: 2rem;
    }

    .form-container {
      background: rgba(255, 255, 255, 0.05);
      padding: 2.5rem;
      border-radius: 15px;
      box-shadow: 0 0 20px rgba(0, 255, 208, 0.25);
      width: 100%;
      max-width: 500px;
      text-align: center;
    }

    .form-container h2 {
      margin-bottom: 1.5rem;
      color: #00ffd0;
      font-size: 1.8rem;
    }

    .form-container input[type="text"],
    .form-container select {
      width: 100%;
      padding: 0.9rem;
      margin-bottom: 1.2rem;
      border: none;
      border-radius: 10px;
      background-color: rgba(255, 255, 255, 0.1);
      color: white;
      font-size: 1rem;
      outline: none;
    }

    .form-container select option {
      background: #203a43;
    }

    .form-container input[type="submit"] {
      width: 100%;
      padding: 0.9rem;
      border: none;
      border-radius: 10px;
      background-color: #00ffd0;
      color: #111;
      font-weight: bold;
      font-size: 1rem;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .form-container input[type="submit"]:hover {
      background-color: #00c0a3;
    }

    .back-link {
      display: inline-block;
      margin-top: 1.2rem;
      color: #00ffd0;
      text-decoration: none;
      font-size: 0.95rem;
    }

    .back-link:hover {
      text-decoration: underline;
    }

    footer {
      position: absolute;
      bottom: 1rem;
      width: 100%;
      text-align: center;
      color: #aaa;
      font-size: 0.9rem;
    }
  </style>
</head>
<body>

<%
    String slotId = request.getParameter("id");
    String slotName = "";
    String status = "";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parking_db", "root", "");
        PreparedStatement ps = con.prepareStatement("SELECT slot_name, STATUS FROM slots WHERE id = ?");
        ps.setString(1, slotId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            slotName = rs.getString("slot_name");
            status = rs.getString("status");
        }
        con.close();
    } catch (Exception e) {
        out.println("<p style='color: red;'>Error: " + e.getMessage() + "</p>");
    }
%>

<div class="form-container">
  <h2>Edit Parking Slot</h2>
  <form action="EditSlotServlet" method="post">
    <input type="hidden" name="slot_id" value="<%= slotId %>" />

    <input type="text" name="slot_name" placeholder="Slot Name" value="<%= slotName %>" required />

    <select name="status" required>
      <option value="Available" <%= "Available".equalsIgnoreCase(status) ? "selected" : "" %>>Available</option>
      <option value="Booked" <%= "Booked".equalsIgnoreCase(status) ? "selected" : "" %>>Occupied</option>
      <option value="Unavailable" <%= "Unavailable".equalsIgnoreCase(status) ? "selected" : "" %>>Unavailable</option>
    </select>

    <input type="submit" value="Update Slot" />
  </form>

  <a class="back-link" href="dashboard.jsp">← Back to Dashboard</a>
</div>

<footer>
  &copy; 2025 Parking Management System — All rights reserved.
</footer>
</body>
</html>
