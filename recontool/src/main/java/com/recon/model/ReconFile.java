package com.recon.model;

public class ReconFile {
	
	private String name;
	private String description;
	private String runschedule;
	private String information;
	private String jsonrowdata;
	private String breakaction;
	
	
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
	
	public String getBreakaction() {
		return breakaction;
	}
	public void setBreakaction(String breakaction) {
		this.breakaction = breakaction;
	}
	public String getJsonrowdata() {
		return jsonrowdata;
	}
	public void setJsonrowdata(String jsonrowdata) {
		this.jsonrowdata = jsonrowdata;
	}
	
}
