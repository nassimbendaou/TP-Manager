package dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;
import java.util.Vector;

import model.Tp;
import service.StockPdf;

public class ManageTp {
	private Connection conn = ConnecToMyDb.Connectdb();;
	private ResultSet resultat = null;
	private PreparedStatement prepared = null;
	private static ManageTp instance = null;

	public static ManageTp getInstance() {
		if (instance==null) {
			instance = new ManageTp();
		}

		return instance;
	}
	private ManageTp() {

	}
	public void addTp(String id,String name, String datebegin, String dateEnd, String salle, String fillier, String prof,String matiere,String filePath) {
		String sql = "insert into tp (id,name,datebegin,dateEnd,salle,fillier,prof,matiere,data) values(?,?,?,?,?,?,?,?,?)";
		try {
			prepared = conn.prepareStatement(sql);
			prepared.setString(1, id);
			prepared.setString(2, name);
			prepared.setString(3, datebegin);
			prepared.setString(4, dateEnd);
			prepared.setString(5, salle);
			prepared.setString(6, fillier);
			prepared.setString(7, prof);
			prepared.setString(8, matiere);	
			prepared.setString(9, "data");		
		
			prepared.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public List<Tp> getTpsofProf(String prof) {
		List<Tp> tps = new Vector<Tp>();
		String sql = "select * from tp where prof=? ";
		try {
			prepared = conn.prepareStatement(sql);
			prepared.setString(1, prof);
			resultat = prepared.executeQuery();
			while (resultat.next()) {
				Tp t = new Tp(resultat.getString("id"), resultat.getString("name"), resultat.getString("datebegin"),
						resultat.getString("dateEnd"), resultat.getString("salle"), resultat.getString("fillier"),
						resultat.getString("prof"),resultat.getString("matiere"));
				tps.add(t);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tps;
	}
	public void getPdfFile(String name) {
		StockPdf.getPDFData(conn, name);	
	}
	public Tp getTp(String id) {
		Tp tp = null;
		String sql = "select * from tp where id='"+id+"'";
		try {
			prepared = conn.prepareStatement(sql);
			resultat = prepared.executeQuery();
			if(resultat.next()) {
				tp = new Tp(resultat.getString("id"), resultat.getString("name"), resultat.getString("datebegin"),
						resultat.getString("dateEnd"), resultat.getString("salle"), resultat.getString("fillier"),
						resultat.getString("prof"),resultat.getString("matiere"));			
			}		
		}
		catch (Exception e) {e.printStackTrace();}
		return tp;
	}
	public String numberOfTps(String id) {
		String num=null;
		String sql=" SELECT COUNT(id) AS number FROM tp WHERE prof='"+id+"'";
		try {
			prepared = conn.prepareStatement(sql);
			resultat = prepared.executeQuery();
			if(resultat.next()){
				 num = resultat.getString("number");					
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}
	public List<Tp> getAll() {
		List<Tp> tps = new Vector<Tp>();
		String sql = "select * from tp  ";
		try {
			prepared = conn.prepareStatement(sql);
			resultat = prepared.executeQuery();
			while (resultat.next()) {
				Tp tp = new Tp(resultat.getString("id"), resultat.getString("name"), resultat.getString("datebegin"),
						resultat.getString("dateEnd"), resultat.getString("salle"), resultat.getString("fillier"),
						resultat.getString("prof"),resultat.getString("matiere"));
				tps.add(tp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tps;
	}
    public List<Tp> getAllTpOfFillier(String fillier) {
		List<Tp> tps = new Vector<Tp>();
		String sql = "select * from tp where fillier= ? ";
		try {prepared = conn.prepareStatement(sql);
			prepared.setString(1, fillier);
			resultat = prepared.executeQuery();
			while (resultat.next()) {
				Tp tp = new Tp(resultat.getString("id"), resultat.getString("name"), resultat.getString("datebegin"),
						resultat.getString("dateEnd"), resultat.getString("salle"), resultat.getString("fillier"),
						resultat.getString("prof"),resultat.getString("matiere"));
				tps.add(tp);}} 
		catch (SQLException e) {e.printStackTrace();}
		return tps;}
    public void updateTp(Tp tp) {
		try {String sql = "UPDATE  tp  SET name='"+ tp.getName()+"' , datebegin = '"+ tp.getDatebegin()+"' , dateEnd = '"+
		tp.getDateEnd()+"', salle = '"+ tp.getSalle()+"' , fillier ='"+ tp.getFillier()+
			"',matiere='"+ tp.getMatiere()+"' where id= '"+ tp.getId()+"'";
			prepared.execute(sql);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void deleteTp(String id) {
	
		try {
			String sql = "DELETE FROM tp WHERE id='"+id+"'";
			prepared = conn.prepareStatement(sql);	
			prepared.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
