package ui;

import javax.swing.*;
import java.awt.*;

public class Dashboard extends JFrame {

    public Dashboard(String username) {

        setTitle("Campus Placement System - Dashboard");
        setSize(500, 550);  // Enough space for all buttons
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(null);

        // Main Title
        JLabel title = new JLabel("Campus Placement System", SwingConstants.CENTER);
        title.setFont(new Font("Segoe UI", Font.BOLD, 22));
        title.setBounds(50, 15, 400, 40);
        add(title);

        // Welcome message (from original code)
        JLabel welcome = new JLabel("Welcome, " + username + "!", SwingConstants.CENTER);
        welcome.setFont(new Font("Segoe UI", Font.PLAIN, 16));
        welcome.setBounds(50, 60, 400, 25);
        add(welcome);

        // Original msg label (you had this in your code)
        JLabel msg = new JLabel("Campus Placement System Dashboard", SwingConstants.CENTER);
        msg.setFont(new Font("Segoe UI", Font.PLAIN, 15));
        msg.setBounds(50, 95, 400, 25);
        add(msg);

        // Buttons
        JButton manageStudents = createButton("Manage Students");
        manageStudents.setBounds(150, 140, 200, 40);
        manageStudents.addActionListener(e -> new StudentManagement());
        add(manageStudents);

        JButton manageCompanies = createButton("Manage Companies");
        manageCompanies.setBounds(150, 190, 200, 40);
        manageCompanies.addActionListener(e -> new CompanyManagement());
        add(manageCompanies);

        JButton manageApplications = createButton("Manage Applications");
        manageApplications.setBounds(150, 240, 200, 40);
        manageApplications.addActionListener(e -> new ApplicationManagement());
        add(manageApplications);

        JButton manageInterviews = createButton("Manage Interviews");
        manageInterviews.setBounds(150, 290, 200, 40);
        manageInterviews.addActionListener(e -> new InterviewManagement());
        add(manageInterviews);

        // You originally did NOT include jobs, so I removed it to match your code.
        // If you want to add Jobs, tell me & I'll include it.

        JButton reportsBtn = createButton("Reports & Analytics");
        reportsBtn.setBounds(150, 340, 200, 40);
        reportsBtn.addActionListener(e -> new ReportsDashboard());
        add(reportsBtn);

        setVisible(true);
    }

    // Windows UI style button
    private JButton createButton(String text) {
        JButton btn = new JButton(text);
        btn.setFont(new Font("Segoe UI", Font.BOLD, 14));
        btn.setFocusPainted(false);
        btn.setBackground(new Color(235, 235, 235));
        btn.setBorder(BorderFactory.createLineBorder(new Color(160, 160, 160)));
        return btn;
    }
}
