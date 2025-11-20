package ui;

import db.DBConnection;

import javax.swing.*;
import java.sql.*;

public class EditCompanyForm extends JFrame {

    public EditCompanyForm(CompanyManagement parent, int companyId) {

        setTitle("Edit Company");
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

        // Load existing data
        try (Connection con = DBConnection.getConnection()) {

            String query = "SELECT * FROM companies WHERE company_id = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, companyId);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                nameField.setText(rs.getString("name"));
                locField.setText(rs.getString("location"));
                indField.setText(rs.getString("industry"));
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        JButton updateBtn = new JButton("Update");
        updateBtn.setBounds(150, 180, 100, 35);
        add(updateBtn);

        updateBtn.addActionListener(e -> {
            try (Connection con = DBConnection.getConnection()) {

                String query = "UPDATE companies SET name=?, location=?, industry=? WHERE company_id=?";
                PreparedStatement pst = con.prepareStatement(query);

                pst.setString(1, nameField.getText());
                pst.setString(2, locField.getText());
                pst.setString(3, indField.getText());
                pst.setInt(4, companyId);

                pst.executeUpdate();

                JOptionPane.showMessageDialog(this, "Company updated!");
                parent.loadCompanies();
                dispose();

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        });

        setVisible(true);
    }
}
