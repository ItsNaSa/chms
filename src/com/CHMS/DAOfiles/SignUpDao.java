package com.CHMS.DAOfiles;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SignUpDao 
{
	String sql = "SELECT doc_reg_id,password from doctor where doc_reg_id=? and password=?";
	String sql1 = "SELECT * from authentication where auth_key=?";
	String sql2 = "INSERT into doctor values(?,?,?,?,?)";
	
	String url = "jdbc:mysql://localhost:3306/chms";
	String username = "root";
	String password = "root";
	
	
	public boolean validate(String token)
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,username, password);
			PreparedStatement st = con.prepareStatement(sql1);
			st.setString(1, token);
			
			ResultSet rs = st.executeQuery();
			if(rs.next())
			{
				return true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	public void register(String aadharid, String regid, String pass, String degree, String city) 
	{
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,username, password);
			PreparedStatement st = con.prepareStatement(sql2);
			st.setString(1, aadharid);
			st.setString(2, regid);
			st.setString(3, pass);
			st.setString(4, city);
			st.setString(5, degree);
			
			st.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

}
}
