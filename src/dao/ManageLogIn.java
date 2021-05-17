package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Professor;
import model.Student;

public class ManageLogIn {
	
	private Connection conn = ConnecToMyDb.Connectdb();;
	private ResultSet resultat = null;
	private PreparedStatement prepared = null;
	private static ManageLogIn instance = null;
	
	public static ManageLogIn getInstance() {
		if (instance==null) {
			
			instance = new ManageLogIn();
		}

		return instance;
	}

	private ManageLogIn() {

	}

	public String login(String email, String pwd) {
		String sql = "select id from connect where email=? and pwd=? ";
		try {
			prepared = conn.prepareStatement(sql);
			prepared.setString(1, email);
			prepared.setString(2, pwd);
			resultat = prepared.executeQuery();
			if (resultat.next()) {
				return resultat.getString("id");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}
	public Student getStudent(String cne) {
		String sql = "select * from student where CNE=? ";
		try {
			prepared = conn.prepareStatement(sql);
			prepared.setString(1, cne);
			resultat = prepared.executeQuery();
			if (resultat.next()) {
				return  new Student(resultat.getString("CNE"), resultat.getString("firstname"),
						resultat.getString("lastname"), resultat.getString("adress"), resultat.getString("birthDate"),
						resultat.getString("fillier"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public Professor getProf(String cin) {
		String sql = "select * from prof where CIN=? ";
		try {
			prepared = conn.prepareStatement(sql);
			prepared.setString(1, cin);
			resultat = prepared.executeQuery();
			if (resultat.next()) {
				return new Professor(resultat.getString("CIN"),resultat.getString("firstname"),resultat.getString("lastname"),resultat.getString("departement")); 
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
