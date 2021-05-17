package service;

import java.beans.Statement;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class StockPdf {

	    public static void getPDFData(Connection conn,String id) {
	         
	        byte[] fileBytes;
	        String query;
	        PreparedStatement pstmt;
	        ResultSet rs ;
	        try {
	            query = 
	              "select data from tp  where id='"+id+"';" ;
	            pstmt = conn.prepareStatement(query);
				rs = pstmt.executeQuery();
				if (rs.next()) {
	                fileBytes = rs.getBytes(1);
	                OutputStream targetFile=  new FileOutputStream(
	                        "/gestiondesTP/src/newtest.pdf");
	                targetFile.write(fileBytes);
	                targetFile.close();
	            }
	             
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	
}
