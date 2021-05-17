package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import busniss.LoginService;
import busniss.TpService;
import dao.ManageTp;
import model.Professor;
import model.Student;
import model.Tp;

/**
 * Servlet implementation class Operations
 */
@WebServlet("/Operations")
public class Operations extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LoginService service;
	ManageTp tp;
	TpService tpservice;
	
	@Override
	public void init() {
		service = LoginService.getInstance();

		tp=ManageTp.getInstance();

	
		tpservice=TpService.getInstance();

	}
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Operations() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		String prof = request.getParameter("prof");	
		String represent = request.getParameter("represent");
			if (represent.equals("edit")) {
				request.setAttribute("tp", tp.getTp(id));
				request.setAttribute("id", id);
				request.getRequestDispatcher("update.jsp").forward(request, response);			
			}
			if (represent.equals("delete")) {			
				tp.deleteTp(id);
				request.setAttribute("num", tpservice.getNumber(prof));
				request.setAttribute("modele", tp.getTpsofProf(prof));
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String profid = request.getParameter("id");	
		String tpid = request.getParameter("tpid");	
		String name=request.getParameter("name");
		String datebegin = request.getParameter("datebegin");
		String dateEnd = request.getParameter("dateEnd");
		String salle = request.getParameter("salle");
		String fillier = request.getParameter("fillier");
		String matiere = request.getParameter("matier");
		String filepath = request.getParameter("filepath");
		Tp newtp = new Tp(tpid, name, datebegin, dateEnd, salle, fillier, profid, matiere);
		tp.updateTp(newtp);
		request.setAttribute("num", tpservice.getNumber(profid));
		request.setAttribute("modele", tp.getTpsofProf(profid));
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
