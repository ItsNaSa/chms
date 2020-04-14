package com.CHMS.JavaBeans;

public class PrescriptionData 
{
	String docName;
	String patientName;
	int age ;
	String gender ;
	String city ;
	public String getDocName() {
		return docName;
	}
	public void setDocName(String docName) {
		this.docName = docName;
	}
	public String getPatientName() {
		return patientName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public PrescriptionData(String docName, String patientName, int age, String gender, String city) {
		super();
		this.docName = docName;
		this.patientName = patientName;
		this.age = age;
		this.gender = gender;
		this.city = city;
	}
	public PrescriptionData() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
