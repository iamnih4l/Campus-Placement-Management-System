package ui;

import db.DBConnection;

import javax.swing.*;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class AddStudentForm extends JFrame {

    public AddStudentForm(StudentManagement parent) {

        setTitle("Add Student");
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

        JButton saveBtn = new JButton("Save");
        saveBtn.setBounds(150, 280, 100, 35);
        add(saveBtn);

        saveBtn.addActionListener(e -> {
            try (Connection con = DBConnection.getConnection()) {

                String query = "INSERT INTO students(name, usn, department, cgpa, email) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement pst = con.prepareStatement(query);

                pst.setString(1, nameField.getText());
                pst.setString(2, usnField.getText());
                pst.setString(3, deptField.getText());
                pst.setDouble(4, Double.parseDouble(cgpaField.getText()));
                pst.setString(5, emailField.getText());

                pst.executeUpdate();

                JOptionPane.showMessageDialog(this, "Student added!");
                parent.loadStudents();
                dispose();

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        });

        setVisible(true);
    }
}
