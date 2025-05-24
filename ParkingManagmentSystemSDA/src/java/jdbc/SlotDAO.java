/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jdbc;

import java.sql.*;
import java.util.*;

public class SlotDAO {
    public List<Slot> getAllSlots() {
        List<Slot> list = new ArrayList<>();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/parking_db", "root", "");

            String sql = "SELECT * FROM slots";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Slot s = new Slot(
                    rs.getInt("id"),
                    rs.getString("slot_name"),
                    rs.getString("status")
                );
                list.add(s);
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}

