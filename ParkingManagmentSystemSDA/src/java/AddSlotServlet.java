/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author FC
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/AddSlotServlet")
public class AddSlotServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String name = req.getParameter("slot_name");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver"); // or "com.mysql.cj.jdbc.Driver" for newer versions
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/parking_db", "root", "");

            String sql = "INSERT INTO slots (slot_name, status) VALUES (?, ?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, "available");  // Or any default status you want

            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                res.sendRedirect("dashboard.jsp");
            } else {
                res.getWriter().println("Failed to add slot.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error: " + e.getMessage());
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}

