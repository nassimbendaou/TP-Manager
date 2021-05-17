package busniss;

import dao.ManageTp;
import model.Tp;

public class TpService  {
	private static ManageTp instanceTp;
	private static TpService instance;
	private TpService() {
		instanceTp=ManageTp.getInstance();
	}
	public static TpService getInstance() {
		if(instance==null) {
			instance=new TpService();
			
		}
		return instance;			
	}
	public Tp getTp(String id) {
		return instanceTp.getTp(id);
	}
	public void getPDF(String id) {
		instanceTp.getPdfFile(id);
	}
	public String getNumber(String prof) {
		return instanceTp.numberOfTps(prof);
	}
	public void updateTp(Tp tp) {
		instanceTp.updateTp(tp);
	}
	public void delete(String id) {
		instanceTp.deleteTp(id);
	}
	
}
