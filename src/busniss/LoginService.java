package busniss;

import dao.ManageLogIn;
import model.Professor;
import model.Student;

public class LoginService implements DefaultService {
	private ManageLogIn loginI;
	private static LoginService instance;
	private Object user;
	public Object getUser() {
		return user;
	}
	public void setUser(Object user) {
		this.user = user;
	}
	public static void setInstance(LoginService instance) {
		LoginService.instance = instance;
	}
	private LoginService() {
		loginI = ManageLogIn.getInstance();
	}
	public static LoginService getInstance() {
		if(instance==null) {
			instance = new LoginService();
		}
		return instance;
	}
	public String authentification(String email, String pwd) {
		return loginI.login(email, pwd);
	}
	public Professor getProf(String cin) {
		return loginI.getProf(cin);
	}
	public Student getStudent(String cne) {
		return loginI.getStudent(cne);
	}
	
}
