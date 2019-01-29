package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Excepions.UsersNotFound;
import models.Utente;
import persistence.PostgresDAOFactory;
import persistence.dao.UtenteDao;

/**
 * Servlet implementation class Transaction
 */
@WebServlet("/Transaction")
public class Transaction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Transaction() {
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
		PostgresDAOFactory p = new PostgresDAOFactory();
		UtenteDao dao=p.getUtenteDao();
		Utente mittente=new Utente("a","a",(String)request.getSession().getAttribute("email"),"a",(int)request.getSession().getAttribute("saldo"));
		
		try {
			Utente destinatario=dao.getUtenteforTransaction((String)request.getParameter("email"));
			dao.transaction(mittente, destinatario, Integer.parseInt(request.getParameter("importo")));
			
			int oldSaldo=(int)request.getSession().getAttribute("saldo");
			request.getSession().setAttribute("saldo", oldSaldo-Integer.parseInt(request.getParameter("importo")));
			response.sendRedirect("confirm.html");
			
		} catch (UsersNotFound e) {
			// TODO Auto-generated catch block
			System.out.println("utente destinatario non trovato");
		}
		
		
		
		
		
		
		
	}

}
