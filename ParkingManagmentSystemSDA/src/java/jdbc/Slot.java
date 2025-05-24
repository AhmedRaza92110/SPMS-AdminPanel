/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jdbc;

/**
 *
 * @author FC
 */
public class Slot {
    private int id;
    private String slotName;
    private String status;

    // Constructor
    public Slot(int id, String slotName, String status) {
        this.id = id;
        this.slotName = slotName;
        this.status = status;
    }

    // Getters
    public int getId() { return id; }
    public String getSlotName() { return slotName; }
    public String getStatus() { return status; }
}
