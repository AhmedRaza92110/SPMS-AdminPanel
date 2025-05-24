<%-- 
    Document   : add_slot
    Created on : May 15, 2025, 6:54:55 PM
    Author     : FC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Add Parking Slot</title>
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
      max-width: 400px;
      text-align: center;
    }

    .form-container h2 {
      margin-bottom: 1.5rem;
      color: #00ffd0;
      font-size: 1.8rem;
    }

    .form-container input[type="text"] {
      width: 100%;
      padding: 0.9rem;
      margin-bottom: 1.5rem;
      border: none;
      border-radius: 10px;
      background-color: rgba(255, 255, 255, 0.1);
      color: white;
      font-size: 1rem;
      outline: none;
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
  <div class="form-container">
    <h2>Add Parking Slot</h2>
    <form action="AddSlotServlet" method="post">
      <input type="text" name="slot_name" placeholder="Enter Slot Name" required />
      <input type="submit" value="Add Slot" />
    </form>
  </div>

  <footer>
    &copy; 2025 Parking Management System — All rights reserved.
  </footer>
</body>
</html>


