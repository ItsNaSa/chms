package com.CHMS.DAOfiles;

import java.sql.*;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;



public class newrecordDao 
{
	String sql = "insert into treatment (doc_reg_id,patient_aadhar,date_of_treatment,diagnosis) values (?,?,?,?)";
	String getTreatmentId = "select treatmentID from treatment where doc_reg_id = ? and patient_aadhar = ? and date_of_treatment = ? ORDER BY treatmentID DESC LIMIT 1";
	String insertMedicine = "{call enter_medicine_list(?,?)}"; //the 3 here is static... we have to add a dynamic value there
	String url = "jdbc:mysql://localhost:3306/chms";
	String username = "root";
	String password = "root";
	
	public int insert(String diagnosis, String doc_reg_id, String p_aadharid, Date sqlDate, String[] med) 
	{
		int treatmentID = 0;
		try 
		{
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,username, password);
			
			CallableStatement cStmt = con.prepareCall(insertMedicine);
			
			PreparedStatement st = con.prepareStatement(sql);
			PreparedStatement gettingTreatId = con.prepareStatement(getTreatmentId);
			st.setString(1, doc_reg_id);
			st.setLong(2, Long.parseLong(p_aadharid));
			st.setDate(3, sqlDate);
			st.setString(4, diagnosis);
			st.executeUpdate();
			
			gettingTreatId.setString(1, doc_reg_id);
			gettingTreatId.setLong(2, Long.parseLong(p_aadharid));
			gettingTreatId.setString(3,String.valueOf(sqlDate));
			
			ResultSet rs = gettingTreatId.executeQuery();
			if(rs.next()) 
			{
				treatmentID = rs.getInt("treatmentID");
				cStmt.setInt(1, treatmentID);
				for(int j = 0;j<med.length;j++) {
					cStmt.setString(2, med[j]);
					cStmt.executeQuery();
				}								
			}
			else 
			{
				throw new Exception();
			}
			con.close();			
		}		
		catch(Exception e)
		{
			e.printStackTrace();
		}				
		return treatmentID;			
	}		
}
