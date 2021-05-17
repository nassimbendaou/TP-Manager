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
 * Servlet implementation class CreateStudent
 */
@WebServlet("/CreateStudent")
public class CreateStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       StudentService service;
       @Override
       public void init() {
    	   service=StudentService.getInstance();
       }
   
    public CreateStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String cne=request.getParameter("cne");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String adress = request.getParameter("adress");
		String fillier = request.getParameter("fillier");
		String birthdate = request.getParameter("matiere");
		service.addStudent(cne, firstname, lastname, adress, birthdate, fillier);
		request.setAttribute("TP", StudentService.getMyTps(fillier));
		request.getRequestDispatcher("StudentTps.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
