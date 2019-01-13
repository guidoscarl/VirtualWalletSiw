package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Excepions.UsersNotFound;
import models.Utente;
import persistence.ConnectionFactory;
import persistence.PostgresDAOFactory;
import persistence.dao.UtenteDao;

/**
 * Servlet implementation class SignInServlet
 */
@WebServlet("/SignInServlet")
public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignInServlet() {
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
		Utente u = null;
		
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		PostgresDAOFactory p = new PostgresDAOFactory();
		UtenteDao dao=p.getUtenteDao();
		HttpSession session=request.getSession();
		try {
			u=dao.getByPrimaryKey(email, password);
			session.setAttribute("nome", u.getNome());
			session.setAttribute("cognome", u.getCognome());
			System.out.println(u.getSaldo());
			session.setAttribute("saldo", u.getSaldo());
			
			
		}
		catch(UsersNotFound e) {
			System.out.println("utente non trovato");
			session.setAttribute("usersNotFound", true);
		}
		
		System.out.println(u.getNome()+u.getCognome());
		
		
		
		
		
		
		response.sendRedirect("account.jsp");
		
		
		
	}

}
