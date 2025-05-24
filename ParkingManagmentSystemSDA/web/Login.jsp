
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Login - Parking System</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', sans-serif;
    }

    body {
      height: 100vh;
      background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
    }

    .login-container {
      background: rgba(255, 255, 255, 0.05);
      padding: 3rem 2.5rem;
      border-radius: 15px;
      box-shadow: 0 0 20px rgba(0, 255, 208, 0.3);
      width: 100%;
      max-width: 400px;
      text-align: center;
    }

    .login-container h2 {
      margin-bottom: 2rem;
      color: #00ffd0;
    }

    .login-container input[type="text"],
    .login-container input[type="password"] {
      width: 100%;
      padding: 0.8rem;
      margin: 0.5rem 0 1.2rem;
      border: none;
      border-radius: 10px;
      background-color: rgba(255, 255, 255, 0.1);
      color: white;
      outline: none;
      font-size: 1rem;
    }

    .login-container input[type="submit"] {
      width: 100%;
      padding: 0.8rem;
      border: none;
      border-radius: 10px;
      background-color: #00ffd0;
      color: #111;
      font-weight: bold;
      font-size: 1rem;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .login-container input[type="submit"]:hover {
      background-color: #00c0a3;
    }

    .error-message {
      margin-top: 1rem;
      color: #ff4c4c;
      font-weight: bold;
      background-color: rgba(255, 0, 0, 0.1);
      padding: 0.5rem;
      border-radius: 8px;
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
  <div class="login-container">
    <h2>Admin Login</h2>
    <form action="LoginServlet" method="post">
      <input type="text" name="username" placeholder="Username" required />
      <input type="password" name="password" placeholder="Password" required />
      <input type="submit" value="Login" />
    </form>
    <% if (request.getParameter("error") != null) { %>
      <div class="error-message">Invalid credentials</div>
    <% } %>
  </div>

  <footer>
    &copy; 2025 Parking Management System - All rights reserved.
  </footer>
</body>
</html>

