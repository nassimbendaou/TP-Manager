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
import busniss.ProfessorService;
import busniss.StudentService;
import busniss.TpService;
import dao.ManageTp;
import model.Professor;
import model.Student;
import model.Tp;

/**
 * Servlet implementation class Login
 */

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LoginService service;
	ManageTp tp;
	TpService tpservice;
	private List<Tp> myTps ;

	public List<Tp> getMyTps() {
		return myTps;
	}

	public void setMyTps(List<Tp> myTps) {
		this.myTps = myTps;
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	@Override
	public void init() {
		service = LoginService.getInstance();
		tp=ManageTp.getInstance();
		setMyTps(new ArrayList<Tp>());
		tpservice=TpService.getInstance();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");		
		String pwd = request.getParameter("password");	
		String represent = request.getParameter("represent");
		String id=service.authentification(email, pwd);
		if (!id.isEmpty()) {
			if (represent.equals("student")) {
				service.setUser((Student)service.getStudent(id));
				Student temp = (Student) service.getUser();
				setMyTps(tp.getAllTpOfFillier( temp.getFillier()));
				request.setAttribute("modele", myTps);			
				request.getRequestDispatcher("list_tp.jsp").forward(request, response);					
			}
			if (represent.equals("prof")) {
				service.setUser((Professor)service.getProf(id));
				Professor temp = (Professor) service.getUser();
				request.setAttribute("departement", temp.getDepartement());
				setMyTps(tp.getTpsofProf( temp.getCin()));
				request.setAttribute("num", tpservice.getNumber(temp.getCin()));
				request.setAttribute("modele", myTps);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String represent = request.getParameter("represent");
		String id = request.getParameter("id");
		
		if (!id.isEmpty()) {
			if (represent.equals("student")) {
				service.setUser((Student)service.getStudent(id));
				Student temp = (Student) service.getUser();
				setMyTps(tp.getAllTpOfFillier( temp.getFillier()));
				request.setAttribute("modele", myTps);
				
				request.getRequestDispatcher("list_tp.jsp").forward(request, response);
				
				
			}
			if (represent.equals("prof")) {
				service.setUser((Professor)service.getProf(id));
				Professor temp = (Professor) service.getUser();
				request.setAttribute("departement", temp.getDepartement());
				setMyTps(tp.getTpsofProf( temp.getCin()));
				request.setAttribute("num", tpservice.getNumber(temp.getCin()));
				request.setAttribute("modele", myTps);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		// TODO Auto-generated method stub
		
	}


}
}