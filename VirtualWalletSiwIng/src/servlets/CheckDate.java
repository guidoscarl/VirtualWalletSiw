package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import persistence.DatabaseManager;
import persistence.dao.UtenteDao;

/**
 * Servlet implementation class CheckDate
 */
@WebServlet("/CheckDate")
public class CheckDate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckDate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String email =request.getParameter("em");
		System.out.println(email);
		
		UtenteDao ut = DatabaseManager.getInstance().getDaoFactory().getUtenteDao();
		if(ut.existUtente(email)) {
			response.getWriter().append("exist");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("entrato in checkDate");
		String email =request.getParameter("em");
		System.out.println(email);
		
		UtenteDao ut = DatabaseManager.getInstance().getDaoFactory().getUtenteDao();
		if(ut.existUtente(email)) {
			response.getOutputStream().print("exist");
		}
	}

}
