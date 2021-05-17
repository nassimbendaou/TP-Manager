package model;

public class Professor {
	private String cin;
	private String firstname;
	private String laststname;
	private String departement;
	
	public Professor(String cin, String firstname, String laststname , String departement) {
		super();
		this.cin = cin;
		this.firstname = firstname;
		this.laststname = laststname;
		this.departement=departement;
	}
	public String getDepartement() {
		return departement;
	}
	public void setDepartement(String departement) {
		this.departement = departement;
	}
	public String getCin() {
		return cin;
	}
	public void setCin(String cin) {
		this.cin = cin;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLaststname() {
		return laststname;
	}
	public void setLaststname(String laststname) {
		this.laststname = laststname;
	}
	
	

}
