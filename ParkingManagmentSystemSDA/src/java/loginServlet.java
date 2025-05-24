/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author FC
 */

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;



import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Load JDBC Driver
            Class.forName("com.mysql.jdbc.Driver");
            // Connect to database
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/parking_db", "root", "");

            // SQL query to check credentials
            String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);

            rs = ps.executeQuery();

            if (rs.next()) {
                // login success
                HttpSession session = request.getSession();
                session.setAttribute("admin", user);
                response.sendRedirect("dashboard.jsp");
            } else {
                // login failed
                response.sendRedirect("login.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Database Error: " + e.getMessage());
        } finally {
            // Cleanup
            try { if (rs != null) rs.close(); } catch (Exception ignored) {}
            try { if (ps != null) ps.close(); } catch (Exception ignored) {}
            try { if (conn != null) conn.close(); } catch (Exception ignored) {}
        }
    }
}
