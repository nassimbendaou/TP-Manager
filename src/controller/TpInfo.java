package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import busniss.ProfessorService;
import busniss.TpService;
import model.Tp;

/**
 * Servlet implementation class TpInfo
 */
@WebServlet("/TpInfo")
public class TpInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  TpService service;
      @Override
      public void init() {
   	   service=TpService.getInstance();
      }
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TpInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name=request.getParameter("id");
		Tp tp =service.getTp(name);
		request.setAttribute("TP", tp);
		request.setAttribute("prof", ProfessorService.getInstance().getProf(tp.getProf()));
		request.getRequestDispatcher("tp_info.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		doGet(request, response);
	}

}
