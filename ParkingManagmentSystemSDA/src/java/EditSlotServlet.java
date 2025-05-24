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
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

@WebServlet("/EditSlotServlet") // This replaces the web.xml mapping
public class EditSlotServlet extends HttpServlet {
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String slotId = request.getParameter("slot_id");
    String slotName = request.getParameter("slot_name");
    String status = request.getParameter("status");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parking_db", "root", "");
        PreparedStatement ps = con.prepareStatement(
            "UPDATE slots SET slot_name = ?, STATUS = ? WHERE id = ?"
        );
        ps.setString(1, slotName);
        ps.setString(2, status);
        ps.setString(3, slotId);

        int rowsUpdated = ps.executeUpdate();
        con.close();

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html lang='en'>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
        out.println("<title>Update Slot</title>");
        out.println("<style>");
        out.println("  body {");
        out.println("    background: linear-gradient(135deg, #1f4037, #99f2c8);");
        out.println("    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;");
        out.println("    color: #004d40;");
        out.println("    display: flex;");
        out.println("    justify-content: center;");
        out.println("    align-items: center;");
        out.println("    height: 100vh;");
        out.println("    margin: 0;");
        out.println("  }");
        out.println("  .container {");
        out.println("    background: #e0f2f1;");
        out.println("    padding: 2rem 3rem;");
        out.println("    border-radius: 15px;");
        out.println("    box-shadow: 0 8px 16px rgba(0, 77, 64, 0.3);");
        out.println("    text-align: center;");
        out.println("    max-width: 400px;");
        out.println("  }");
        out.println("  h3 {");
        out.println("    margin-bottom: 1rem;");
        out.println("    font-weight: 700;");
        out.println("  }");
        out.println("  .success { color: #00796b; }");
        out.println("  .fail { color: #c62828; }");
        out.println("  a {");
        out.println("    display: inline-block;");
        out.println("    margin-top: 1rem;");
        out.println("    padding: 0.5rem 1rem;");
        out.println("    background-color: #004d40;");
        out.println("    color: #e0f2f1;");
        out.println("    text-decoration: none;");
        out.println("    border-radius: 8px;");
        out.println("    font-weight: 600;");
        out.println("    transition: background-color 0.3s ease;");
        out.println("  }");
        out.println("  a:hover { background-color: #00695c; }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div class='container'>");

        if (rowsUpdated > 0) {
            out.println("<h3 class='success'> Slot updated successfully!</h3>");
        } else {
            out.println("<h3 class='fail'> Slot update failed. Try again.</h3>");
        }

        out.println("<a href='dashboard.jsp'> Back to Dashboard</a>");
        out.println("</div>");
        out.println("</body>");
        out.println("</html>");

    } catch (Exception e) {
        throw new ServletException("DB Error: " + e.getMessage());
    }
}

}