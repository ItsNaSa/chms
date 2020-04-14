package com.CHMS.JavaBeans;

public class Ratify 
{
	String doc_reg_id;
	String name;
	
	
	public Ratify(String doc_reg_id, String name) 
	{
		super();
		this.doc_reg_id = doc_reg_id;
		this.name = name;
	}
	
	public String getDoc_reg_id() {
		return doc_reg_id;
	}
	public void setDoc_reg_id(String doc_reg_id) {
		this.doc_reg_id = doc_reg_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
