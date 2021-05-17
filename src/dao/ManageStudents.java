package dao;

import java.io.ObjectInputStream.GetField;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;
import java.util.Vector;

import model.Professor;
import model.Student;
import model.Tp;

public class ManageStudents  {

	private Connection conn = ConnecToMyDb.Connectdb();;
	private ResultSet resultat = null;
	private PreparedStatement prepared = null;
	private static ManageStudents instance = null;

	public static ManageStudents getInstance() {
		if (instance==null) {
			instance = new ManageStudents();
			System.out.println("d");
		}

		return instance;
	}

	private ManageStudents() {

	}
	public List<Professor> getMyProf(String Prof){
		List<Professor> prList = new Vector<Professor>();
		String sql = "select * from prof where departement=? ";
		try {
			prepared = conn.prepareStatement(sql);
			prepared.setString(1, Prof);
			resultat = prepared.executeQuery();
			while(resultat.next()) {
				Professor s= new Professor(resultat.getString("CIN"),resultat.getString("firstname"),resultat.getString("lastname"),resultat.getString("departement")); 
				prList.add(s);
			}
				
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return prList;
	}


	public List<Student> getAll() {
		List<Student> students = new Vector<Student>();
		String sql = "select * from students ";
		try {
			prepared = conn.prepareStatement(sql);
			resultat = prepared.executeQuery();
			while (resultat.next()) {
				Student s = new Student(resultat.getString("CNE"), resultat.getString("firstname"),
						resultat.getString("lastname"), resultat.getString("adress"), resultat.getString("birthDate"),
						resultat.getString("fillier"));
				students.add(s);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return students;
	}

	public void addStudent(String cne, String firstname, String lastname, String adress, String birthdate,
			String fillier) {

		String sql = "insert into student (CNE,firstname,lastname,adress,birthDate,fillier) values(?,?,?,?,?,?)";
		try {
			prepared = conn.prepareStatement(sql);
			prepared.setString(1, cne);
			prepared.setString(2, firstname);
			prepared.setString(3, lastname);
			prepared.setString(4, adress);
			prepared.setString(5, birthdate);
			prepared.setString(6, fillier);
			prepared.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	

	

}
