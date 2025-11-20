package ui;

import db.DBConnection;

import javax.swing.*;
import java.awt.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ReportsDashboard extends JFrame {

    public ReportsDashboard() {

        setTitle("Reports & Analytics Dashboard");
        setSize(600, 600);
        setLocationRelativeTo(null);
        setLayout(new GridLayout(0, 1, 10, 10));
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        Font f = new Font("Arial", Font.BOLD, 18);

        // Panels for metrics
        add(metric("Total Students", count("SELECT COUNT(*) FROM students"), f));
        add(metric("Total Companies", count("SELECT COUNT(*) FROM companies"), f));
        add(metric("Total Jobs", count("SELECT COUNT(*) FROM jobs"), f));
        add(metric("Total Applications", count("SELECT COUNT(*) FROM applications"), f));
        add(metric("Total Interviews", count("SELECT COUNT(*) FROM interviews"), f));

        // Placed students
        int placed = count(
                "SELECT COUNT(*) FROM interviews WHERE result = 'Pass'"
        );

        add(metric("Placed Students", placed, f));

        // Total students again for % calculation
        int totalStudents = count("SELECT COUNT(*) FROM students");

        double percentage = 0;
        if (totalStudents > 0) {
            percentage = (placed * 100.0) / totalStudents;
        }

        add(metric("Placement Percentage", String.format("%.2f%%", percentage), f));

        // Top company
        String topCompany = top(
                "SELECT c.name, COUNT(j.job_id) as cnt " +
                        "FROM companies c " +
                        "JOIN jobs j ON c.company_id = j.company_id " +
                        "GROUP BY c.company_id " +
                        "ORDER BY cnt DESC LIMIT 1"
        );

        add(metric("Top Hiring Company", topCompany, f));

        // Highest package
        String highestPackage = top(
                "SELECT CONCAT(role, ' - ', max_package) FROM jobs ORDER BY max_package DESC LIMIT 1"
        );

        add(metric("Highest Package", highestPackage + " LPA", f));

        setVisible(true);
    }

    private JPanel metric(String title, Object value, Font f) {
        JPanel p = new JPanel();
        p.setLayout(new GridLayout(2, 1));

        JLabel t = new JLabel(title, SwingConstants.CENTER);
        t.setFont(f);

        JLabel v = new JLabel(String.valueOf(value), SwingConstants.CENTER);
        v.setFont(new Font("Arial", Font.PLAIN, 22));

        p.add(t);
        p.add(v);
        p.setBorder(BorderFactory.createLineBorder(Color.BLACK, 2));
        return p;
    }

    private int count(String query) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(query);
             ResultSet rs = pst.executeQuery()) {

            if (rs.next()) return rs.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    private String top(String query) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(query);
             ResultSet rs = pst.executeQuery()) {

            if (rs.next()) return rs.getString(1);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "N/A";
    }
}
