package ui;

import db.DBConnection;

import javax.swing.*;
import java.sql.*;

public class EditStudentForm extends JFrame {

    public EditStudentForm(StudentManagement parent, int studentId) {

        setTitle("Edit Student");
        setSize(400, 350);
        setLayout(null);
        setLocationRelativeTo(null);

        JLabel nameLabel = new JLabel("Name:");
        nameLabel.setBounds(30, 30, 120, 30);
        add(nameLabel);

        JTextField nameField = new JTextField();
        nameField.setBounds(150, 30, 200, 30);
        add(nameField);

        JLabel usnLabel = new JLabel("USN:");
        usnLabel.setBounds(30, 80, 120, 30);
        add(usnLabel);

        JTextField usnField = new JTextField();
        usnField.setBounds(150, 80, 200, 30);
        add(usnField);

        JLabel deptLabel = new JLabel("Department:");
        deptLabel.setBounds(30, 130, 120, 30);
        add(deptLabel);

        JTextField deptField = new JTextField();
        deptField.setBounds(150, 130, 200, 30);
        add(deptField);

        JLabel cgpaLabel = new JLabel("CGPA:");
        cgpaLabel.setBounds(30, 180, 120, 30);
        add(cgpaLabel);

        JTextField cgpaField = new JTextField();
        cgpaField.setBounds(150, 180, 200, 30);
        add(cgpaField);

        JLabel emailLabel = new JLabel("Email:");
        emailLabel.setBounds(30, 230, 120, 30);
        add(emailLabel);

        JTextField emailField = new JTextField();
        emailField.setBounds(150, 230, 200, 30);
        add(emailField);

        // Load existing student data
        try (Connection con = DBConnection.getConnection()) {

            String query = "SELECT * FROM students WHERE student_id = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, studentId);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                nameField.setText(rs.getString("name"));
                usnField.setText(rs.getString("usn"));
                deptField.setText(rs.getString("department"));
                cgpaField.setText(String.valueOf(rs.getDouble("cgpa")));
                emailField.setText(rs.getString("email"));
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        JButton updateBtn = new JButton("Update");
        updateBtn.setBounds(150, 280, 100, 35);
        add(updateBtn);

        updateBtn.addActionListener(e -> {
            try (Connection con = DBConnection.getConnection()) {

                String query = "UPDATE students SET name=?, usn=?, department=?, cgpa=?, email=? WHERE student_id=?";
                PreparedStatement pst = con.prepareStatement(query);

                pst.setString(1, nameField.getText());
                pst.setString(2, usnField.getText());
                pst.setString(3, deptField.getText());
                pst.setDouble(4, Double.parseDouble(cgpaField.getText()));
                pst.setString(5, emailField.getText());
                pst.setInt(6, studentId);

                pst.executeUpdate();

                JOptionPane.showMessageDialog(this, "Student updated!");
                parent.loadStudents();
                dispose();

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        });

        setVisible(true);
    }
}
