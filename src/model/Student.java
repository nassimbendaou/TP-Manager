package model;

public class Student {
private String cin;
private String firstanme;
private String lastname;
private String adress;
private String birthDate;
private  String fillier;

public Student(String cin, String firstanme, String lastname, String adress, String birthDate, String fillier) {
	super();
	this.cin = cin;
	this.firstanme = firstanme;
	this.lastname = lastname;
	this.adress = adress;
	this.birthDate = birthDate;
	this.fillier=fillier;
	
	
}
public String getCin() {
	return cin;
}
public void setCin(String cin) {
	this.cin = cin;
}
public String getFirstanme() {
	return firstanme;
}
public void setFirstanme(String firstanme) {
	this.firstanme = firstanme;
}
public String getLastname() {
	return lastname;
}
public void setLastname(String lastname) {
	this.lastname = lastname;
}
public String getAdress() {
	return adress;
}
public void setAdress(String adress) {
	this.adress = adress;
}
public String getBirthDate() {
	return birthDate;
}
public void setBirthDate(String birthDate) {
	this.birthDate = birthDate;
}
public String getFillier() {
	return fillier;
}
public void setFillier(String fillier) {
	this.fillier = fillier;
}

}
