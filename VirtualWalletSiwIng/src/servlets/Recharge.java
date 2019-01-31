package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Utente;
import persistence.PostgresDAOFactory;
import persistence.dao.UtenteDao;

/**
 * Servlet implementation class Recharge
 */
@WebServlet("/Recharge")
public class Recharge extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Recharge() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Servlet ricarica...");
		PostgresDAOFactory p = new PostgresDAOFactory();
		UtenteDao dao=p.getUtenteDao();
		
		String email = request.getParameter("email");
		int oldSaldo=Integer.parseInt(request.getParameter("saldo"));
		int importo=Integer.parseInt(request.getParameter("importo"));
		System.out.println(email+" "+oldSaldo+" "+importo);
		
		int newSaldo=oldSaldo+importo;
		
		Utente u = new Utente("a","a",email,"a",newSaldo);
		
		dao.update(u);
		request.getSession().setAttribute("saldo", newSaldo);
		response.getWriter().append("ok");
		
		
		
		
	}

}
