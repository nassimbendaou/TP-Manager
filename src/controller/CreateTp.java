package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import busniss.LoginService;
import busniss.ProfessorService;
import busniss.TpService;
import model.Professor;



/**
 * Servlet implementation class CreateTp
 */
@WebServlet("/CreateTp")
public class CreateTp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProfessorService service;
	TpService tpService;
	LoginService i = LoginService.getInstance();
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		 service = ProfessorService.getInstance();
		 tpService=TpService.getInstance();
		 
	}
    public CreateTp() {
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name=request.getParameter("name");
		String datebegin = request.getParameter("datebegin");
		String dateEnd = request.getParameter("dateEnd");
		String salle = request.getParameter("salle");
		String fillier = request.getParameter("fillier");
		String prof = request.getParameter("id");
		String matiere = request.getParameter("matier");
		String filepath = request.getParameter("filepath");
		Professor temp = (Professor) i.getUser();
		service.addTp(name, datebegin, dateEnd, salle, fillier, prof,matiere,filepath);
		request.setAttribute("num", tpService.getNumber(temp.getCin()));
		request.setAttribute("modele", ProfessorService.getMyTps(temp.getCin()));
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		doGet(request, response);
	}

}
