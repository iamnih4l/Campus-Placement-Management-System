package ui;

import db.DBConnection;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.sql.*;

public class ApplicationManagement extends JFrame {

    JTable table;
    DefaultTableModel model;

    public ApplicationManagement() {
        setTitle("Applications Management");
        setSize(1000, 500);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLayout(new BorderLayout());

        String[] columns = {"ID", "Student", "Job (Role - Company)", "Application Date", "Status"};
        model = new DefaultTableModel(columns, 0);
        table = new JTable(model);
        loadApplications();

        add(new JScrollPane(table), BorderLayout.CENTER);

        JPanel btnPanel = new JPanel();
        JButton addBtn = new JButton("Add");
        JButton editBtn = new JButton("Edit");
        JButton deleteBtn = new JButton("Delete");

        btnPanel.add(addBtn);
        btnPanel.add(editBtn);
        btnPanel.add(deleteBtn);

        add(btnPanel, BorderLayout.SOUTH);

        addBtn.addActionListener(e -> new AddApplicationForm(this));
        editBtn.addActionListener(e -> editApplication());
        deleteBtn.addActionListener(e -> deleteApplication());

        setVisible(true);
    }

    public void loadApplications() {
        model.setRowCount(0);
        String query =
                "SELECT a.application_id, s.name AS student_name, s.usn, j.role, c.name AS company_name, a.application_date, a.status " +
                        "FROM applications a " +
                        "JOIN students s ON a.student_id = s.student_id " +
                        "JOIN jobs j ON a.job_id = j.job_id " +
                        "JOIN companies c ON j.company_id = c.company_id " +
                        "ORDER BY a.application_id";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(query);
             ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("application_id");
                String student = rs.getString("student_name") + " (" + rs.getString("usn") + ")";
                String job = rs.getString("role") + " - " + rs.getString("company_name");
                Date appDate = rs.getDate("application_date");
                String status = rs.getString("status");

                model.addRow(new Object[]{id, student, job, appDate != null ? appDate.toString() : "", status});
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void editApplication() {
        int row = table.getSelectedRow();
        if (row == -1) {
            JOptionPane.showMessageDialog(this, "Select an application to edit.");
            return;
        }
        int id = (int) model.getValueAt(row, 0);
        new EditApplicationForm(this, id);
    }

    private void deleteApplication() {
        int row = table.getSelectedRow();
        if (row == -1) {
            JOptionPane.showMessageDialog(this, "Select an application to delete.");
            return;
        }
        int confirm = JOptionPane.showConfirmDialog(this, "Delete selected application?", "Confirm", JOptionPane.YES_NO_OPTION);
        if (confirm != 0) return;

        int id = (int) model.getValueAt(row, 0);
        try (Connection con = DBConnection.getConnection()) {
            String q = "DELETE FROM applications WHERE application_id = ?";
            PreparedStatement pst = con.prepareStatement(q);
            pst.setInt(1, id);
            pst.executeUpdate();
            JOptionPane.showMessageDialog(this, "Application deleted.");
            loadApplications();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
