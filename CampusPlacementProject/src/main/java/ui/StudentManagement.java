package ui;

import db.DBConnection;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.sql.*;

public class StudentManagement extends JFrame {

    JTable table;
    DefaultTableModel model;

    public StudentManagement() {

        setTitle("Student Management");
        setSize(800, 500);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLayout(new BorderLayout());

        // Table Columns
        String[] columns = {"ID", "Name", "USN", "Department", "CGPA", "Email"};
        model = new DefaultTableModel(columns, 0);
        table = new JTable(model);

        loadStudents();

        add(new JScrollPane(table), BorderLayout.CENTER);

        JPanel btnPanel = new JPanel();

        JButton addBtn = new JButton("Add");
        JButton editBtn = new JButton("Edit");
        JButton deleteBtn = new JButton("Delete");

        btnPanel.add(addBtn);
        btnPanel.add(editBtn);
        btnPanel.add(deleteBtn);

        add(btnPanel, BorderLayout.SOUTH);

        // Add button action
        addBtn.addActionListener(e -> new AddStudentForm(this));

        // Edit button action
        editBtn.addActionListener(e -> editStudent());

        // Delete button action
        deleteBtn.addActionListener(e -> deleteStudent());

        setVisible(true);
    }

    // Load students from DB
    public void loadStudents() {
        model.setRowCount(0);

        try (Connection con = DBConnection.getConnection()) {

            String query = "SELECT * FROM students";
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Object[] row = {
                        rs.getInt("student_id"),
                        rs.getString("name"),
                        rs.getString("usn"),
                        rs.getString("department"),
                        rs.getDouble("cgpa"),
                        rs.getString("email")
                };
                model.addRow(row);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Edit student
    private void editStudent() {
        int row = table.getSelectedRow();
        if (row == -1) {
            JOptionPane.showMessageDialog(this, "Select a student to edit.");
            return;
        }

        int id = (int) model.getValueAt(row, 0);
        new EditStudentForm(this, id);
    }

    // Delete student
    private void deleteStudent() {
        int row = table.getSelectedRow();
        if (row == -1) {
            JOptionPane.showMessageDialog(this, "Select a student to delete.");
            return;
        }

        int confirm = JOptionPane.showConfirmDialog(this, "Are you sure?", "Delete?", JOptionPane.YES_NO_OPTION);
        if (confirm != 0) return;

        int id = (int) model.getValueAt(row, 0);

        try (Connection con = DBConnection.getConnection()) {

            String query = "DELETE FROM students WHERE student_id = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, id);
            pst.executeUpdate();

            JOptionPane.showMessageDialog(this, "Student deleted!");
            loadStudents();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

