package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Professor;

public class ManageProf {

	private Connection conn = ConnecToMyDb.Connectdb();
	private ResultSet resultat = null;
	private PreparedStatement prepared = null;
	private static ManageProf instance = null;
	
	public static ManageProf getInstance() {
		if (instance==null) {
			instance = new ManageProf();
		}

		return instance;
	}

	private ManageProf() {

	}
	public void addProf(String cin, String firstname, String lastname, 
			String departement) {

		String sql = "insert into prof (CIN,firstname,lastname,departement) values(?,?,?,?)";
		try {
			prepared = conn.prepareStatement(sql);
			prepared.setString(1, cin);
			prepared.setString(2, firstname);
			prepared.setString(3, lastname);
			prepared.setString(4, departement);
			prepared.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
