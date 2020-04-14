package com.CHMS.JavaBeans;

public class doctorReportRow {
	
	private long treatmentID;
	private String patient_name;
	private String diagnosis;
	
	public doctorReportRow(long treatmentID, String patient_name, String diagnosis) {
		super();
		this.treatmentID = treatmentID;
		this.patient_name = patient_name;
		this.diagnosis = diagnosis;
	}

	public long getTreatmentID() {
		return treatmentID;
	}

	public void setTreatmentID(long treatmentID) {
		this.treatmentID = treatmentID;
	}

	public String getPatient_name() {
		return patient_name;
	}

	public void setPatient_name(String patient_name) {
		this.patient_name = patient_name;
	}

	public String getDiagnosis() {
		return diagnosis;
	}

	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}
}
