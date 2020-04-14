package com.CHMS.JavaBeans;
public class Treatment {
	
	private long treatmentID;
	private String doc_reg_id;
	private long patient_aadhar;
	private String date_of_treatment;
	private String diagnosis;
	
	public Treatment(long treatmentID, String doc_reg_id, long patient_aadhar, String date_of_treatment,
			String diagnosis) 
	{
		super();
		this.treatmentID = treatmentID;
		this.doc_reg_id = doc_reg_id;
		this.patient_aadhar = patient_aadhar;
		this.date_of_treatment = date_of_treatment;
		this.diagnosis = diagnosis;
	}

	public Treatment(String doc_reg_id, long patient_aadhar, String date_of_treatment, String diagnosis) {
		super();
		this.doc_reg_id = doc_reg_id;
		this.patient_aadhar = patient_aadhar;
		this.date_of_treatment = date_of_treatment;
		this.diagnosis = diagnosis;
	}

	public long getTreatmentID() {
		return treatmentID;
	}

	public void setTreatmentID(long treatmentID) {
		this.treatmentID = treatmentID;
	}

	public String getDoc_reg_id() {
		return doc_reg_id;
	}

	public void setDoc_reg_id(String doc_reg_id) {
		this.doc_reg_id = doc_reg_id;
	}

	public long getPatient_aadhar() {
		return patient_aadhar;
	}

	public void setPatient_aadhar(long patient_aadhar) {
		this.patient_aadhar = patient_aadhar;
	}

	public String getDate_of_treatment() {
		return date_of_treatment;
	}

	public void setDate_of_treatment(String date_of_treatment) {
		this.date_of_treatment = date_of_treatment;
	}

	public String getDiagnosis() {
		return diagnosis;
	}

	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}

	@Override
	public String toString() {
		return "Treatment [treatmentID=" + treatmentID + ", doc_reg_id=" + doc_reg_id + ", patient_aadhar="
				+ patient_aadhar + ", date_of_treatment=" + date_of_treatment + ", diagnosis=" + diagnosis + "]";
	}

	
}


