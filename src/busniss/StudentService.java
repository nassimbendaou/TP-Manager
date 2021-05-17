package busniss;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import dao.ManageStudents;
import dao.ManageTp;
import model.Professor;
import model.Tp;

public class StudentService implements DefaultService {
	private static ManageTp instanceTp;
	private static ManageStudents instancestudent;
	private static StudentService instance;
	private static List<Tp> myTps = new ArrayList<Tp>();
	private StudentService() {
		instanceTp=ManageTp.getInstance();
		instancestudent=ManageStudents.getInstance();
	}
	public static StudentService getInstance() {
		if(instance==null) {
			instance=new StudentService();
			myTps=instanceTp.getAll();
		}
		return instance;			
	}
	public void addStudent(String cne, String firstname,String lastname,String adress,String birthdate,String fillier) {
		instancestudent.addStudent(cne, firstname, lastname, adress, birthdate, fillier);
	}
	public List<Professor> getMyProf(String fillier){
		return instancestudent.getMyProf(fillier);
	}
	public static List<Tp> getMyTps(String fillier) {
		List<Tp> tps=new Vector<Tp>();
		for(Tp tp: myTps) {
			if(tp.getProf().equals(fillier)) {
				tps.add(tp);
			}
		}
		return tps;
	}
	
}
