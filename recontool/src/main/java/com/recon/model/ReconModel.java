package com.recon.model;

public class ReconModel {

	private String reconFileName;
	private String recievedDate;
	private String source;
	
	public String getReconFileName() {
		return reconFileName;
	}
	public void setReconFileName(String reconFileName) {
		this.reconFileName = reconFileName;
	}
	public String getRecievedDate() {
		return recievedDate;
	}
	public void setRecievedDate(String recievedDate) {
		this.recievedDate = recievedDate;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((recievedDate == null) ? 0 : recievedDate.hashCode());
		result = prime * result + ((reconFileName == null) ? 0 : reconFileName.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReconModel other = (ReconModel) obj;
		if (recievedDate == null) {
			if (other.recievedDate != null)
				return false;
		} else if (!recievedDate.equals(other.recievedDate))
			return false;
		if (reconFileName == null) {
			if (other.reconFileName != null)
				return false;
		} else if (!reconFileName.equals(other.reconFileName))
			return false;
		return true;
	}
}
