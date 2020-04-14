package com.CHMS.DAOfiles;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class AddDoctorAdminDao {
	String sql = "insert into authentication values(?,?)";
	String url = "jdbc:mysql://localhost:3306/chms";
	String username = "root";
	String password = "root";
	
	public boolean addDoctor(String DoctorId,String AuthenticationKey) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,username,password);
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, DoctorId);
			stmt.setString(2, AuthenticationKey);
			stmt.executeUpdate();
			return true;
		}
		catch(Exception E) {
			E.printStackTrace();
		}
		return false;
	}
}
