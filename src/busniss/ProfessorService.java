package busniss;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.Vector;

import dao.ManageProf;
import dao.ManageTp;
import model.Professor;
import model.Tp;

public class ProfessorService implements DefaultService{
	private static ManageTp instanceTp;
	private static ManageProf instanceProf;
	public static ProfessorService instance;
	private static List<Tp> myTps = new ArrayList<Tp>();
	private ProfessorService() {		
		instanceTp=ManageTp.getInstance();
	}
	public static ProfessorService getInstance() {
		if(instance==null) {
			instance=new ProfessorService();
			myTps=instanceTp.getAll();
			instanceProf=ManageProf.getInstance();
		}
		return instance;			
	}
	public void addProf(String cin,String firstname,String lastname,String departement) {
		Professor prof = new Professor(cin, firstname, lastname,departement);
		instanceProf.addProf(cin, firstname, lastname, departement);
	}
	public void addTp(String name, String datebegin, String dateEnd, String salle, String fillier, String prof,String matiere,String filepath) {
		Tp tp = new Tp(UUID.randomUUID().toString(),name, datebegin, dateEnd, salle, fillier, prof,matiere);
		instanceTp.addTp(tp.getId(),name, datebegin, dateEnd, salle, fillier, prof,matiere,filepath);
		myTps.add(tp);	
	}
	public Professor getProf(String CIN) {
		return instanceProf.getProf(CIN);
	}
	public static List<Tp> getMyTps(String prof) {
		List<Tp> tps=new Vector<Tp>();
		for(Tp tp: myTps) {
			if(tp.getProf().equals(prof)) {
				tps.add(tp);
			}
		}
		return tps;
	}
	
	
}
