package ui;

import db.DBConnection;

import javax.swing.*;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

public class EditInterviewForm extends JFrame {

    ArrayList<Integer> applicationIds = new ArrayList<>();

    public EditInterviewForm(InterviewManagement parent, int interviewId) {

        setTitle("Edit Interview");
        setSize(550, 400);
        setLayout(null);
        setLocationRelativeTo(null);

        JLabel appLabel = new JLabel("Application:");
        appLabel.setBounds(40, 40, 120, 30);
        add(appLabel);

        JComboBox<String> appBox = new JComboBox<>();
        appBox.setBounds(170, 40, 300, 30);
        add(appBox);

        JLabel dateLabel = new JLabel("Interview Date:");
        dateLabel.setBounds(40, 100, 120, 30);
        add(dateLabel);

        JTextField dateField = new JTextField(java.time.LocalDate.now().toString());
        dateField.setBounds(170, 100, 300, 30);
        add(dateField);


        JLabel modeLabel = new JLabel("Mode:");
        modeLabel.setBounds(40, 160, 120, 30);
        add(modeLabel);

        String[] modes = {"Online", "Offline", "Telephonic"};
        JComboBox<String> modeBox = new JComboBox<>(modes);
        modeBox.setBounds(170, 160, 300, 30);
        add(modeBox);

        JLabel resultLabel = new JLabel("Result:");
        resultLabel.setBounds(40, 220, 120, 30);
        add(resultLabel);

        String[] results = {"Pending", "Pass", "Fail"};
        JComboBox<String> resultBox = new JComboBox<>(results);
        resultBox.setBounds(170, 220, 300, 30);
        add(resultBox);

        JButton updateBtn = new JButton("Update");
        updateBtn.setBounds(220, 280, 100, 35);
        add(updateBtn);

        loadApplications(appBox);

        // load old values
        try (Connection con = DBConnection.getConnection()) {

            String q = "SELECT application_id, interview_date, mode, result " +
                    "FROM interviews WHERE interview_id = ?";
            PreparedStatement pst = con.prepareStatement(q);
            pst.setInt(1, interviewId);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                int appId = rs.getInt("application_id");
                int index = applicationIds.indexOf(appId);
                if (index >= 0) appBox.setSelectedIndex(index);

                Date d = rs.getDate("interview_date");
                if (d != null) dateField.setText(d.toString());

                modeBox.setSelectedItem(rs.getString("mode"));
                resultBox.setSelectedItem(rs.getString("result"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        updateBtn.addActionListener(e -> {
            int appIndex = appBox.getSelectedIndex();
            if (appIndex == -1) {
                JOptionPane.showMessageDialog(this, "Select application!");
                return;
            }

            int appId = applicationIds.get(appIndex);
            String date = dateField.getText().trim();
            String mode = (String) modeBox.getSelectedItem();
            String result = (String) resultBox.getSelectedItem();

            try (Connection con = DBConnection.getConnection()) {

                String q = "UPDATE interviews SET application_id=?, interview_date=?, mode=?, result=? WHERE interview_id=?";
                PreparedStatement pst = con.prepareStatement(q);

                pst.setInt(1, appId);
                pst.setDate(2, Date.valueOf(date));
                pst.setString(3, mode);
                pst.setString(4, result);
                pst.setInt(5, interviewId);

                pst.executeUpdate();

                JOptionPane.showMessageDialog(this, "Interview updated!");
                parent.loadInterviews();
                dispose();

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        });

        setVisible(true);
    }

    private void loadApplications(JComboBox<String> box) {

        box.removeAllItems();
        applicationIds.clear();

        String q =
                "SELECT a.application_id, s.name, s.usn, j.role, c.name AS company " +
                        "FROM applications a " +
                        "JOIN students s ON a.student_id = s.student_id " +
                        "JOIN jobs j ON a.job_id = j.job_id " +
                        "JOIN companies c ON j.company_id = c.company_id";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(q);
             ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("application_id");
                applicationIds.add(id);

                String text = rs.getString("name") + " (" + rs.getString("usn") + ") → "
                        + rs.getString("role") + " - " + rs.getString("company");

                box.addItem(text);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
