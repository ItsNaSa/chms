package com.CHMS.DAOfiles;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;

import com.CHMS.JavaBeans.Ratify;
import com.CHMS.JavaBeans.Revoke;

public class RevokeLoginDao 
{

	String sql = "select doc_reg_id,fname,mname,lname,degrees from doctor natural join person";
	String sql2 = "insert into revoked values (?)";
	String sql3 = "select doc_reg_id,concat(fname,' ',lname) as name from revoked natural join doctor natural join person";
	String sql4= "delete from revoked where doc_reg_id=?";
	String url = "jdbc:mysql://localhost:3306/chms";
	String username = "root";
	String password = "root";
	
	public List<Revoke> show() 
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,username, password);				
			PreparedStatement st = con.prepareStatement(sql);
				
			List<Revoke> row= new ArrayList<> ();
			ResultSet rs = st.executeQuery();
			while(rs.next())
			{
				
				String doc_reg_id=rs.getString("doc_reg_id");
				String fname=rs.getString("fname");
				String mname=rs.getString("mname");
				String lname=rs.getString("lname");
				String degrees=rs.getString("degrees");
				
				loginDao ld = new loginDao();
				if(!(ld.verify(doc_reg_id)))
				{
					Revoke newRow=new Revoke(doc_reg_id,fname,mname,lname,degrees);				
					row.add(newRow);
				}
			}
			return row;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		//return false;
		return null;
	}

	public void deleteDoctor(String docid) 
	{
		// TODO Auto-generated method stub
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println(docid);
			Connection conn = DriverManager.getConnection(url,username, password);				
			PreparedStatement smt = conn.prepareStatement(sql2);			
			smt.setString(1,docid);
			smt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}			
	}
		
	
	public List<Ratify> showrevoked() 
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,username, password);				
			PreparedStatement st = con.prepareStatement(sql3);
				
			List<Ratify> row= new ArrayList<> ();
			ResultSet rs = st.executeQuery();
			while(rs.next())
			{
				
				String doc_reg_id=rs.getString("doc_reg_id");
				String name=rs.getString("name");
				
				
				
					Ratify newRow=new Ratify(doc_reg_id,name);				
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

	public void deleteRevokedDoctor(String docid) 
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println(docid);
			Connection conn = DriverManager.getConnection(url,username, password);				
			PreparedStatement smt = conn.prepareStatement(sql4);
						
			smt.setString(1,docid);
			smt.executeUpdate();			

		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
