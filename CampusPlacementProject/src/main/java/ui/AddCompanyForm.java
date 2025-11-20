package ui;

import db.DBConnection;

import javax.swing.*;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class AddCompanyForm extends JFrame {

    public AddCompanyForm(CompanyManagement parent) {

        setTitle("Add Company");
        setSize(400, 300);
        setLayout(null);
        setLocationRelativeTo(null);

        JLabel nameLabel = new JLabel("Name:");
        nameLabel.setBounds(30, 30, 120, 30);
        add(nameLabel);

        JTextField nameField = new JTextField();
        nameField.setBounds(150, 30, 200, 30);
        add(nameField);

        JLabel locLabel = new JLabel("Location:");
        locLabel.setBounds(30, 80, 120, 30);
        add(locLabel);

        JTextField locField = new JTextField();
        locField.setBounds(150, 80, 200, 30);
        add(locField);

        JLabel indLabel = new JLabel("Industry:");
        indLabel.setBounds(30, 130, 120, 30);
        add(indLabel);

        JTextField indField = new JTextField();
        indField.setBounds(150, 130, 200, 30);
        add(indField);

        JButton saveBtn = new JButton("Save");
        saveBtn.setBounds(150, 180, 100, 35);
        add(saveBtn);

        saveBtn.addActionListener(e -> {
            try (Connection con = DBConnection.getConnection()) {

                String query = "INSERT INTO companies(name, location, industry) VALUES (?, ?, ?)";
                PreparedStatement pst = con.prepareStatement(query);

                pst.setString(1, nameField.getText());
                pst.setString(2, locField.getText());
                pst.setString(3, indField.getText());

                pst.executeUpdate();

                JOptionPane.showMessageDialog(this, "Company added!");
                parent.loadCompanies();
                dispose();

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        });

        setVisible(true);
    }
}
