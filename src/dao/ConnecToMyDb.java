package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnecToMyDb {
	static Connection conn = null;
	public static Connection Connectdb(){
		try {
			if(conn==null) {
		Class.forName("com.mysql.jdbc.Driver");
		 conn= DriverManager.getConnection("jdbc:mysql://localhost/gestiontp?autoReconnect=true&useSSL=false","root","");}
		
					
		return conn;
		
	}
		catch(Exception e){
			e.printStackTrace();
			return null;
			}
		}
		
	}

