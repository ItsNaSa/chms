package com.CHMS.DAOfiles;

import java.sql.Connection;		
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class loginDao {
	String sql = "SELECT doc_reg_id,password from doctor where doc_reg_id=? and password=?";
	String sql2 = "SELECT * from revoked where doc_reg_id=?";
	String url = "jdbc:mysql://localhost:3306/chmsdb";
	String username = "root";
	String password = "root";
		
	public boolean check(String uname,String pass)
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,username, password);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, uname);
			st.setString(2, pass);
			
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

	public boolean verify(String uname) 
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url,username, password);
			PreparedStatement srt = conn.prepareStatement(sql2);
			srt.setString(1, uname);

			ResultSet rst = srt.executeQuery();
			if(rst.next())
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

}
