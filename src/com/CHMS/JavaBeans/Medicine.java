package com.CHMS.JavaBeans;

public class Medicine {
	public int medicineID;
	public String common_name;
	public String basic_drug;
	public int getMedicineID() {
		return medicineID;
	}
	public void setMedicineID(int medicineID) {
		this.medicineID = medicineID;
	}
	public String getCommon_name() {
		return common_name;
	}
	public void setCommon_name(String common_name) {
		this.common_name = common_name;
	}
	public String getBasic_drug() {
		return basic_drug;
	}
	public void setBasic_drug(String basic_drug) {
		this.basic_drug = basic_drug;
	}
	public Medicine(int medicineID, String common_name, String basic_drug) {
		super();
		this.medicineID = medicineID;
		this.common_name = common_name;
		this.basic_drug = basic_drug;
	}
	public Medicine(String common_name, String basic_drug) {
		// TODO Auto-generated constructor stub
		this.common_name = common_name;
		this.basic_drug = basic_drug;		
	}
	public Medicine() {
		// TODO Auto-generated constructor stub
	}
}