package com.CHMS.DAOfiles;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.CHMS.JavaBeans.doctorReportRow;

public class viewreportDao 
{

	String sql = "select concat(p1.fname,' ',p1.mname,' ',p1.lname) as patient_name,treatmentID,diagnosis from person p1 join treatment t on p1.aadhar = t.patient_aadhar join doctor d on d.doc_reg_id = t.doc_reg_id where t.doc_reg_id=? and date_of_treatment=?";
	String url = "jdbc:mysql://localhost:3306/chms";
	String username = "root";
	String password = "root";
	
	
	public List<doctorReportRow> show(String doc_reg_id, String sqlDate) 
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,username, password);				
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,doc_reg_id);
			st.setString(2,sqlDate);
				
			List<doctorReportRow> row= new ArrayList<> ();
			ResultSet rs = st.executeQuery();
			while(rs.next())
			{
				long treatmentID=rs.getLong("treatmentID");
				String patient_name=rs.getString("patient_name");
				String diagnosis=rs.getString("diagnosis");
				doctorReportRow newRow=new doctorReportRow(treatmentID,patient_name,diagnosis);
				row.add(newRow);
			}
			return row;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		//return false;
		return null;
	}
		
}

