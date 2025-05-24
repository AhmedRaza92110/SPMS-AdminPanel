<%-- 
    Document   : dashboard
    Created on : May 12, 2025, 9:29:40 PM
    Author     : FC
--%>

<%@ page import="java.util.*,jdbc.Slot,jdbc.SlotDAO" %>
<%
    
    if (session == null || session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    SlotDAO dao = new SlotDAO();
    List<Slot> list = dao.getAllSlots();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Admin Dashboard - Parking System</title>
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', sans-serif;
    }

    body {
      background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
      color: white;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    nav {
      background-color: #111;
      padding: 1rem 2rem;
      display: flex;
      justify-content: space-between;
      align-items: center;
      box-shadow: 0 2px 10px rgba(0,0,0,0.4);
    }

    nav h1 {
      color: #00ffd0;
      font-size: 1.5rem;
    }

    nav a {
      color: white;
      margin-left: 20px;
      text-decoration: none;
      font-weight: 500;
      transition: color 0.3s ease;
    }

    nav a:hover {
      color: #00ffd0;
    }

    main {
      flex: 1;
      padding: 2rem;
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    h2 {
      margin-bottom: 2rem;
      font-size: 2rem;
      color: #00ffd0;
    }

    .slot-table {
      width: 100%;
      max-width: 1000px;
      background: rgba(255, 255, 255, 0.05);
      border-radius: 15px;
      box-shadow: 0 0 20px rgba(0, 255, 208, 0.3);
      overflow: hidden;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      text-align: center;
    }

    th, td {
      padding: 1rem;
      border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    }

    th {
      background-color: #00ffd033;
      color: #00ffd0;
      text-transform: uppercase;
    }

    tr:hover {
      background-color: rgba(255, 255, 255, 0.05);
    }

    td a {
      color: #00ffd0;
      text-decoration: none;
      transition: color 0.2s ease;
    }

    td a:hover {
      color: #ffffff;
    }

    .footer {
      background: #111;
      text-align: center;
      padding: 1rem;
      color: #888;
      font-size: 0.9rem;
    }

    /* Animated Car Slots - Optional Visual Enhancements */
    .parking-lot {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
      gap: 20px;
      margin-top: 40px;
    }

    .car-slot {
      background: linear-gradient(to top right, #1f1f1f, #2a2a2a);
      border-radius: 15px;
      padding: 1rem;
      box-shadow: 0 10px 20px rgba(0,0,0,0.4);
      transition: transform 0.4s ease;
      position: relative;
    }

    .car-slot:hover {
      transform: translateY(-10px) scale(1.03);
    }

    .car-animation {
      position: absolute;
      top: -10px;
      right: 10px;
      width: 60px;
      height: 30px;
      background: linear-gradient(45deg, #00ffd0, #0ff);
      border-radius: 5px;
      transform: rotate(-10deg);
      animation: carBounce 2s infinite ease-in-out;
    }

    @keyframes carBounce {
      0%, 100% { transform: translateY(0) rotate(-10deg); }
      50% { transform: translateY(-8px) rotate(-10deg); }
    }

  </style>
</head>
<body>
  <nav>
    <h1>SPMS Admin Panel</h1>
    <div>
      <a href="add_slot.jsp">Add Slot</a>
      <a href="LogoutServlet">Logout</a>
    </div>
  </nav>

  <main>
    <h2>Welcome, Admin</h2>

    <div class="slot-table">
      <table>
        <tr>
          <th>ID</th>
          <th>Slot Name</th>
          <th>Status</th>
          <th>Action</th>
        </tr>
        <% for (Slot s : list) { %>
        <tr>
          <td><%= s.getId() %></td>
          <td><%= s.getSlotName() %></td>
          <td><%= s.getStatus() %></td>
          <td>
            <a href="edit_slot.jsp?id=<%= s.getId() %>">Edit</a> |
            <a href="DeleteSlotServlet?id=<%= s.getId() %>" onclick="return confirm('Are you sure you want to delete this slot?');">Delete</a>
          </td>
        </tr>
        <% } %>
      </table>
    </div>

    <div class="parking-lot">
      <% for (Slot s : list) { %>
        <div class="car-slot">
          <strong>Slot: <%= s.getSlotName() %></strong><br/>
          Status: <%= s.getStatus() %>
          <% if (s.getStatus().equals("Occupied")) { %>
            <div class="car-animation"></div>
          <% } %>
        </div>
      <% } %>
    </div>
  </main>

  <div class="footer">
    &copy; 2025 Smart Parking Management System - Built with Ahmed
  </div>
</body>
</html>

