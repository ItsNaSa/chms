package com.CHMS.DAOfiles;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.CHMS.JavaBeans.Medicine;

public class medicineDAO {

	String url = "jdbc:mysql://localhost:3306/chms";
	String username = "root";
	String password = "root";
	String sql = "select * from medicine";
	String sql2 = "select * from medicine where medicineID=?";
	String sql3 = "update medicine set basic_drug=?, common_name=? where medicineID=?"; 
	String sql4="select count(*) from medicine";
	String sql5="insert into medicine values(?,?,?)";
			
	public List<Medicine> getmedicines() {
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,username, password);
			PreparedStatement st = con.prepareStatement(sql);
			
			List<Medicine> medicines = new ArrayList<> ();
			ResultSet rs = st.executeQuery();
			while(rs.next())
			{
				int medicineID=rs.getInt("medicineID");
				String common_name=rs.getString("common_name");
				String basic_drug=rs.getString("basic_drug");
				Medicine newMedicine=new Medicine(medicineID, common_name, basic_drug);
				medicines.add(newMedicine);
			}
			return medicines;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;						
	}

	public void addmedicine(Medicine medicine) 
	{
		int count=0;
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,username, password);
			PreparedStatement st = con.prepareStatement(sql4);
			
			
			ResultSet rs = st.executeQuery();
			while(rs.next())
			{
				count=rs.getInt("count(*)");
				
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(count);
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,username, password);
			PreparedStatement st = con.prepareStatement(sql5);
			
			int count1=count+1;
			st.setInt(1,count1);
			st.setString(2,medicine.common_name);
			st.setString(3,medicine.basic_drug);
			

			st.executeUpdate();		
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	public Medicine getmedicine(int medicineID) {
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,username, password);
			PreparedStatement st = con.prepareStatement(sql2);
			st.setInt(1, medicineID);
			ResultSet rs = st.executeQuery();
			while(rs.next())
			{
				
				String common_name=rs.getString("common_name");
				String basic_drug=rs.getString("basic_drug");
				Medicine newMedicine=new Medicine(medicineID, common_name, basic_drug);
				return newMedicine;
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		//return false;
		return null;						
	}

	public void updatemedicine(Medicine medicine) {
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection conn = DriverManager.getConnection(url,username, password);				
			PreparedStatement smt = conn.prepareStatement(sql3);									
			smt.setString(1,medicine.basic_drug);
			smt.setString(2,medicine.common_name);
			smt.setInt(3, medicine.medicineID);
			smt.executeUpdate();						
		}
		catch(Exception e) {
			e.printStackTrace();
		}	
	}	
	
}
