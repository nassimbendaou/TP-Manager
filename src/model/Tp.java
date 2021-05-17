package model;

public class Tp {
	private String id;
	private String name;
	private String datebegin;
	private String dateEnd;
	private String salle;
	private String fillier;
	private String prof;
	private String matiere;

	
	public Tp(String id, String name, String datebegin, String dateEnd, String salle, String fillier, String prof,String matiere) {
		super();
		this.id = id;
		this.name = name;
		this.datebegin = datebegin;
		this.dateEnd = dateEnd;
		this.salle = salle;
		this.fillier = fillier;
		this.prof = prof;
		this.matiere=matiere;
		
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getMatiere() {
		return matiere;
	}
	public void setMatiere(String matiere) {
		this.matiere = matiere;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDatebegin() {
		return datebegin;
	}
	public void setDatebegin(String datebegin) {
		this.datebegin = datebegin;
	}
	public String getDateEnd() {
		return dateEnd;
	}
	@Override
	public String toString() {
		
		return id+" "+name+" "+datebegin+" "+dateEnd+" "+salle+" "+fillier+" "+prof+" "+matiere;
	}
	public void setDateEnd(String dateEnd) {
		this.dateEnd = dateEnd;
	}
	public String getSalle() {
		return salle;
	}
	public void setSalle(String salle) {
		this.salle = salle;
	}
	public String getFillier() {
		return fillier;
	}
	public void setFillier(String fillier) {
		this.fillier = fillier;
	}
	public String getProf() {
		return prof;
	}
	public void setProf(String prof) {
		this.prof = prof;
	}
	
	
	
	

}
