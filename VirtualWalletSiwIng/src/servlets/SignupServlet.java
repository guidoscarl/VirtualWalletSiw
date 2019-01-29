package servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Excepions.EmailAlreadyUsed;
import models.Utente;
import persistence.DatabaseManager;
import persistence.PostgresDAOFactory;
import persistence.dao.UtenteDao;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email =request.getParameter("em");
		
		UtenteDao ut = DatabaseManager.getInstance().getDaoFactory().getUtenteDao();
		if(ut.existUtente(email)) {
			response.getOutputStream().print("exist");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nome =request.getParameter("name");
		String cognome=request.getParameter("surname");
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
		int saldo=0;
		
		
		System.out.println(nome);
		System.out.println(cognome);
		
		Utente u = new Utente(nome,cognome,email,pass,saldo);
		
		PostgresDAOFactory p = new PostgresDAOFactory();
		UtenteDao dao=p.getUtenteDao();
		try {
		dao.save(u);
		PrintWriter out = response.getWriter();
		response.sendRedirect("home.jsp");
		response.setContentType("text/html");
		out.println("<p>Benvenuto "+nome+" "+cognome+"</p>");
		}
		catch(EmailAlreadyUsed e) {
			System.out.println("email già usata");
			request.getSession().setAttribute("esistente", true);
			response.sendRedirect("sign-up.jsp");
			
		}
		
			
		
		
		
		
	}

}
