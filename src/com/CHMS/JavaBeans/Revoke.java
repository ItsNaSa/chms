package com.CHMS.JavaBeans;

public class Revoke 
{
	public Revoke(String doc_reg_id, String fname, String mname, String lname, String degrees) {
		super();
		this.doc_reg_id = doc_reg_id;
		this.fname = fname;
		this.mname = mname;
		this.lname = lname;
		this.degrees = degrees;
	}
	
	private String doc_reg_id;
	private String fname;
	private String mname;
	private String lname;
	private String degrees;
	
	public String getDoc_reg_id() 
	{
		return doc_reg_id;
	}
	
	public void setDoc_reg_id(String doc_reg_id) {
		this.doc_reg_id = doc_reg_id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getDegrees() {
		return degrees;
	}
	public void setDegrees(String degrees) {
		this.degrees = degrees;
	}
}
