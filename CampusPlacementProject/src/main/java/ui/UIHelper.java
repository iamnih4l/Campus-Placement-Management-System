package ui;

import javax.swing.*;
import java.awt.*;

public class UIHelper {

    public static Font titleFont = new Font("Segoe UI", Font.BOLD, 20);
    public static Font labelFont = new Font("Segoe UI", Font.PLAIN, 16);
    public static Font buttonFont = new Font("Segoe UI", Font.BOLD, 15);
    public static Font tableFont = new Font("Segoe UI", Font.PLAIN, 14);

    public static JButton createButton(String text) {
        JButton btn = new JButton(text);
        btn.setFont(buttonFont);
        btn.setFocusPainted(false);
        btn.setBackground(new Color(230, 230, 230));
        btn.setBorder(BorderFactory.createLineBorder(new Color(180, 180, 180)));
        return btn;
    }

    public static JLabel createLabel(String text) {
        JLabel lbl = new JLabel(text);
        lbl.setFont(labelFont);
        return lbl;
    }

    public static JLabel createTitle(String text) {
        JLabel lbl = new JLabel(text, SwingConstants.CENTER);
        lbl.setFont(titleFont);
        return lbl;
    }

    public static void styleTable(JTable table) {
        table.setFont(tableFont);
        table.setRowHeight(25);
        table.getTableHeader().setFont(new Font("Segoe UI", Font.BOLD, 14));
    }
}
