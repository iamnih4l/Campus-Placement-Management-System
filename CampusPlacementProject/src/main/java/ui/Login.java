package ui;

import db.DBConnection;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.*;

public class Login extends JFrame {

    private JTextField usernameField;
    private JPasswordField passwordField;

    public Login() {

        setTitle("Campus Placement Login");
        setSize(400, 300);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(null);

        JLabel title = new JLabel("Campus Placement System");
        title.setFont(new Font("Arial", Font.BOLD, 18));
        title.setBounds(60, 20, 300, 30);
        add(title);

        JLabel userLabel = new JLabel("Username:");
        userLabel.setBounds(50, 80, 100, 30);
        add(userLabel);

        usernameField = new JTextField();
        usernameField.setBounds(150, 80, 180, 30);
        add(usernameField);

        JLabel passLabel = new JLabel("Password:");
        passLabel.setBounds(50, 130, 100, 30);
        add(passLabel);

        passwordField = new JPasswordField();
        passwordField.setBounds(150, 130, 180, 30);
        add(passwordField);

        JButton loginBtn = new JButton("Login");
        loginBtn.setBounds(150, 180, 100, 35);
        add(loginBtn);

        loginBtn.addActionListener(e -> authenticateUser());

        setVisible(true);
    }

    private void authenticateUser() {

        String username = usernameField.getText();
        String password = new String(passwordField.getPassword());

        try (Connection con = DBConnection.getConnection()) {

            String query = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement pst = con.prepareStatement(query);

            pst.setString(1, username);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                JOptionPane.showMessageDialog(this, "Login Successful!");

                new Dashboard(username);
                dispose();  // close login window
            } else {
                JOptionPane.showMessageDialog(this, "Invalid username or password!");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
