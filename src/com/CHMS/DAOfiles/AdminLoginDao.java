package com.CHMS.DAOfiles;

import java.sql.*;
public class AdminLoginDao {
	String sql = "SELECT * from admin where login_id=? and password=?";
	String url = "jdbc:mysql://localhost:3306/chms";
	String username = "root";
	String password = "root";
	
	
	public boolean checkAdmin(String uname,String psw) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,username,password);
			PreparedStatement stmt = con.prepareStatement(sql);
			System.out.println(stmt);
			stmt.setString(1, uname);
			stmt.setString(2,psw);
			
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}
		catch(Exception E){
			E.printStackTrace();
		}
		return false;
	}
}
