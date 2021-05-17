package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import busniss.ProfessorService;
import busniss.StudentService;

/**
 * Servlet implementation class CreateProf
 */
@WebServlet(urlPatterns = {"/CreateProf","/ProfInfo"})
public class CreateProf extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  ProfessorService service;
	  StudentService studentservice;
      @Override
      public void init() {
   	   service=ProfessorService.getInstance();
   	   studentservice=StudentService.getInstance();
      }
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateProf() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String departement = request.getParameter("id");
		studentservice.getMyProf(departement);
		request.setAttribute("prof", studentservice.getMyProf(departement));
		request.getRequestDispatcher("MesProfs.jsp").forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//String departement = request.getParameter("departement");
		//studentservice.getMyProf(departement);
		String cin = request.getParameter("CIN");
		request.setAttribute("prof", service.getProf(cin));
		request.setAttribute("modele", service.getMyTps(cin));
		request.getRequestDispatcher("TpOfProf.jsp").forward(request, response);
		doGet(request, response);
	}

}
