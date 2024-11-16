package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class UserModel {
	public static boolean registerUser(String name, String email, String mobileNumber, String sequrityQuestion, String answer, String password) {
        try {
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("INSERT INTO users (name, email, mobileNumber, sequrityQuestion, answer, password) VALUES (?, ?, ?, ?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, mobileNumber);
            ps.setString(4, sequrityQuestion);
            ps.setString(5, answer);
            ps.setString(6, password);
            ps.executeUpdate();
            con.close();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
	
	public static boolean validateUser(String email, String password) {
        boolean isValid = false;
        try {
            Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM users WHERE email='" + email + "' AND password='" + password + "'");
            isValid = rs.next();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return isValid;
    }
	
	public static boolean changePassword(String email, String mobileNumber, String sequrityQuestion, String answer, String newPassword) {
        boolean isPasswordChanged = false;
        try {
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE email=? AND mobileNumber=? AND sequrityQuestion=? AND answer=?");
            ps.setString(1, email);
            ps.setString(2, mobileNumber);
            ps.setString(3, sequrityQuestion);
            ps.setString(4, answer);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                PreparedStatement updatePs = con.prepareStatement("UPDATE users SET password=? WHERE email=?");
                updatePs.setString(1, newPassword);
                updatePs.setString(2, email);
                updatePs.executeUpdate();
                isPasswordChanged = true;
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return isPasswordChanged;
    }
	
	public static boolean addNewStaff(String id, String name, String category, String dob, String active,String nic,String contact) {
        try {
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("INSERT INTO staff VALUES(?,?,?,?,?,?,?)");
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, category);
            ps.setString(4, dob);
            ps.setString(5, active);
            ps.setString(6, nic);
            ps.setString(7, contact);
            int rowsAffected = ps.executeUpdate();
            con.close();
            return rowsAffected > 0;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
	
	public static boolean editStaff(String id, String name, String category, String dob, String active,String nic,String contact) {
        try {
        	Connection con=ConnectionProvider.getCon();
			Statement st=con.createStatement();
			int rowsAffected=st.executeUpdate("update staff set name='"+name+"',category='"+category+"',dob='"+dob+"',active='"+active+"',nic='"+nic+"',contact='"+contact+"' where id='"+id+"'");
			con.close();
            return rowsAffected > 0;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
	
	public static boolean deleteStaff(String id, String name, String category, String dob, String active,String nic,String contact) {
        try {
        	Connection con=ConnectionProvider.getCon();
			Statement st=con.createStatement();
			int rowsAffected=st.executeUpdate("delete from staff where id='"+id+"'");
			con.close();
            return rowsAffected > 0;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
	
	

}
