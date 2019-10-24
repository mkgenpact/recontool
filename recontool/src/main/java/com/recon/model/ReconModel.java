package com.recon.model;

public class ReconModel { 
	
	private Integer reconId;
	private String name;
	private String description;
	private String runschedule;
	private String information;
	
	public Integer getReconId() {
		return reconId;
	}
	public void setReconId(Integer reconId) {
		this.reconId = reconId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getRunschedule() {
		return runschedule;
	}
	public void setRunschedule(String runschedule) {
		this.runschedule = runschedule;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((reconId == null) ? 0 : reconId.hashCode());
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
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (reconId == null) {
			if (other.reconId != null)
				return false;
		} else if (!reconId.equals(other.reconId))
			return false;
		return true;
	}

}
