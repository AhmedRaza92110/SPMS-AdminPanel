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
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


/**
 *
 * @author FC
 */
@WebServlet("/DeleteSlotServlet")
public class DeleteSlotServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver"); // Or "com.mysql.cj.jdbc.Driver"
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/parking_db", "root", "");

            String sql = "DELETE FROM slots WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);

            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                res.sendRedirect("dashboard.jsp");
            } else {
                res.getWriter().println("Slot not found or could not be deleted.");
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
