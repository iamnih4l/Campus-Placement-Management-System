package ui;

import db.DBConnection;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.sql.*;

public class InterviewManagement extends JFrame {

    JTable table;
    DefaultTableModel model;

    public InterviewManagement() {

        setTitle("Interview Management");
        setSize(1000, 500);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLayout(new BorderLayout());

        String[] cols = {"ID", "Student", "Job", "Interview Date", "Mode", "Result"};
        model = new DefaultTableModel(cols, 0);
        table = new JTable(model);

        loadInterviews();

        add(new JScrollPane(table), BorderLayout.CENTER);

        JPanel p = new JPanel();
        JButton addBtn = new JButton("Add");
        JButton editBtn = new JButton("Edit");
        JButton deleteBtn = new JButton("Delete");

        p.add(addBtn);
        p.add(editBtn);
        p.add(deleteBtn);
        add(p, BorderLayout.SOUTH);

        addBtn.addActionListener(e -> new AddInterviewForm(this));
        editBtn.addActionListener(e -> editInterview());
        deleteBtn.addActionListener(e -> deleteInterview());

        setVisible(true);
    }

    public void loadInterviews() {
        model.setRowCount(0);

        String q =
                "SELECT i.interview_id, " +
                        "s.name AS student_name, s.usn, " +
                        "j.role, c.name AS company_name, " +
                        "i.interview_date, i.mode, i.result " +
                        "FROM interviews i " +
                        "JOIN applications a ON i.application_id = a.application_id " +
                        "JOIN students s ON a.student_id = s.student_id " +
                        "JOIN jobs j ON a.job_id = j.job_id " +
                        "JOIN companies c ON j.company_id = c.company_id";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(q);
             ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
                model.addRow(new Object[]{
                        rs.getInt("interview_id"),
                        rs.getString("student_name") + " (" + rs.getString("usn") + ")",
                        rs.getString("role") + " - " + rs.getString("company_name"),
                        rs.getDate("interview_date"),
                        rs.getString("mode"),
                        rs.getString("result")
                });
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void editInterview() {
        int row = table.getSelectedRow();

        if (row == -1) {
            JOptionPane.showMessageDialog(this, "Select an interview to edit.");
            return;
        }

        int id = (int) model.getValueAt(row, 0);
        new EditInterviewForm(this, id);
    }

    private void deleteInterview() {
        int row = table.getSelectedRow();

        if (row == -1) {
            JOptionPane.showMessageDialog(this, "Select an interview.");
            return;
        }

        int confirm = JOptionPane.showConfirmDialog(this, "Delete interview?", "Confirm", JOptionPane.YES_NO_OPTION);
        if (confirm != 0) return;

        int id = (int) model.getValueAt(row, 0);

        try (Connection con = DBConnection.getConnection()) {

            String q = "DELETE FROM interviews WHERE interview_id = ?";
            PreparedStatement pst = con.prepareStatement(q);
            pst.setInt(1, id);
            pst.executeUpdate();

            JOptionPane.showMessageDialog(this, "Interview deleted!");
            loadInterviews();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
