package com.CHMS.DAOfiles;

import java.sql.Connection;	
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.CHMS.JavaBeans.Treatment;

public class personDao 
{
	
	String sql = "SELECT * from treatment where patient_aadhar=?";
	String sql1 = "SELECT * from person where aadhar=?";
	String url = "jdbc:mysql://localhost:3306/chms";
	String username = "root";
	String password = "root";
	
	
	public boolean validate(String aadharid)
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,username, password);
			PreparedStatement st = con.prepareStatement(sql1);
			st.setString(1, aadharid);
			
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
	
	public List<Treatment> getTreatmentList(String aadharid)
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,username, password);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,aadharid);
			
			List<Treatment> treatments = new ArrayList<> ();
			ResultSet rs = st.executeQuery();
			while(rs.next())
			{
				long treatmentID=rs.getLong("treatmentID");
				String doc_reg_id=rs.getString("doc_reg_id");
				long patient_aadhar=rs.getLong("patient_aadhar");
				String date_of_treatment=rs.getString("date_of_treatment");
				String diagnosis=rs.getString("diagnosis");
				Treatment newTreatment=new Treatment(treatmentID,doc_reg_id,patient_aadhar,date_of_treatment,diagnosis);
				treatments.add(newTreatment);
			}
			return treatments;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		//return false;
		return null;
	}
}
