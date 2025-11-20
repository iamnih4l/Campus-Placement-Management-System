package ui;

import db.DBConnection;

import javax.swing.*;
import java.awt.*;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

public class AddApplicationForm extends JFrame {

    private ArrayList<Integer> studentIds = new ArrayList<>();
    private ArrayList<Integer> jobIds = new ArrayList<>();

    public AddApplicationForm(ApplicationManagement parent) {
        setTitle("Add Application");
        setSize(500, 350);
        setLocationRelativeTo(null);
        setLayout(null);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        JLabel studentLabel = new JLabel("Student:");
        studentLabel.setBounds(30, 30, 120, 30);
        add(studentLabel);

        JComboBox<String> studentBox = new JComboBox<>();
        studentBox.setBounds(160, 30, 280, 30);
        add(studentBox);

        JLabel jobLabel = new JLabel("Job:");
        jobLabel.setBounds(30, 80, 120, 30);
        add(jobLabel);

        JComboBox<String> jobBox = new JComboBox<>();
        jobBox.setBounds(160, 80, 280, 30);
        add(jobBox);

        JLabel dateLabel = new JLabel("Application Date (YYYY-MM-DD):");
        dateLabel.setBounds(30, 130, 220, 30);
        add(dateLabel);

        JTextField dateField = new JTextField(LocalDate.now().toString());
        dateField.setBounds(260, 130, 180, 30);
        add(dateField);

        JLabel statusLabel = new JLabel("Status:");
        statusLabel.setBounds(30, 180, 120, 30);
        add(statusLabel);

        String[] statuses = {"Applied", "Shortlisted", "Rejected", "Withdrawn"};
        JComboBox<String> statusBox = new JComboBox<>(statuses);
        statusBox.setBounds(160, 180, 280, 30);
        add(statusBox);

        JButton saveBtn = new JButton("Save");
        saveBtn.setBounds(180, 240, 120, 35);
        add(saveBtn);

        // Load dropdowns
        loadStudents(studentBox);
        loadJobs(jobBox);

        saveBtn.addActionListener(e -> {
            int sIndex = studentBox.getSelectedIndex();
            int jIndex = jobBox.getSelectedIndex();
            if (sIndex == -1 || jIndex == -1) {
                JOptionPane.showMessageDialog(this, "Select both student and job.");
                return;
            }
            int studentId = studentIds.get(sIndex);
            int jobId = jobIds.get(jIndex);
            String date = dateField.getText().trim();
            String status = (String) statusBox.getSelectedItem();

            try (Connection con = DBConnection.getConnection()) {
                String q = "INSERT INTO applications(student_id, job_id, application_date, status) VALUES (?, ?, ?, ?)";
                PreparedStatement pst = con.prepareStatement(q);
                pst.setInt(1, studentId);
                pst.setInt(2, jobId);
                pst.setDate(3, Date.valueOf(date));
                pst.setString(4, status);
                pst.executeUpdate();

                JOptionPane.showMessageDialog(this, "Application added.");
                parent.loadApplications();
                dispose();
            } catch (Exception ex) {
                ex.printStackTrace();
                JOptionPane.showMessageDialog(this, "Failed to save application: " + ex.getMessage());
            }
        });

        setVisible(true);
    }

    private void loadStudents(JComboBox<String> box) {
        box.removeAllItems();
        studentIds.clear();
        String q = "SELECT student_id, name, usn FROM students ORDER BY name";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(q);
             ResultSet rs = pst.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("student_id");
                String display = rs.getString("name") + " (" + rs.getString("usn") + ")";
                studentIds.add(id);
                box.addItem(display);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void loadJobs(JComboBox<String> box) {
        box.removeAllItems();
        jobIds.clear();
        String q = "SELECT j.job_id, j.role, c.name AS company_name FROM jobs j JOIN companies c ON j.company_id = c.company_id ORDER BY c.name, j.role";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(q);
             ResultSet rs = pst.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("job_id");
                String display = rs.getString("role") + " - " + rs.getString("company_name");
                jobIds.add(id);
                box.addItem(display);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
