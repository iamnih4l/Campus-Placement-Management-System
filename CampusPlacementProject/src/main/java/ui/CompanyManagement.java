package ui;

import db.DBConnection;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.sql.*;

public class CompanyManagement extends JFrame {

    JTable table;
    DefaultTableModel model;

    public CompanyManagement() {

        setTitle("Company Management");
        setSize(800, 500);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLayout(new BorderLayout());

        // Columns
        String[] columns = {"ID", "Name", "Location", "Industry"};
        model = new DefaultTableModel(columns, 0);
        table = new JTable(model);

        loadCompanies();

        add(new JScrollPane(table), BorderLayout.CENTER);

        JPanel btnPanel = new JPanel();

        JButton addBtn = new JButton("Add");
        JButton editBtn = new JButton("Edit");
        JButton deleteBtn = new JButton("Delete");

        btnPanel.add(addBtn);
        btnPanel.add(editBtn);
        btnPanel.add(deleteBtn);

        add(btnPanel, BorderLayout.SOUTH);

        addBtn.addActionListener(e -> new AddCompanyForm(this));

        editBtn.addActionListener(e -> editCompany());

        deleteBtn.addActionListener(e -> deleteCompany());

        setVisible(true);
    }

    public void loadCompanies() {
        model.setRowCount(0);

        try (Connection con = DBConnection.getConnection()) {

            String query = "SELECT * FROM companies";
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Object[] row = {
                        rs.getInt("company_id"),
                        rs.getString("name"),
                        rs.getString("location"),
                        rs.getString("industry")
                };
                model.addRow(row);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void editCompany() {
        int row = table.getSelectedRow();

        if (row == -1) {
            JOptionPane.showMessageDialog(this, "Select a company to edit.");
            return;
        }

        int id = (int) model.getValueAt(row, 0);
        new EditCompanyForm(this, id);
    }

    private void deleteCompany() {

        int row = table.getSelectedRow();
        if (row == -1) {
            JOptionPane.showMessageDialog(this, "Select a company to delete.");
            return;
        }

        int confirm = JOptionPane.showConfirmDialog(this, "Are you sure?", "Delete company?", JOptionPane.YES_NO_OPTION);
        if (confirm != 0) return;

        int id = (int) model.getValueAt(row, 0);

        try (Connection con = DBConnection.getConnection()) {

            String query = "DELETE FROM companies WHERE company_id = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, id);
            pst.executeUpdate();

            JOptionPane.showMessageDialog(this, "Company deleted!");
            loadCompanies();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
