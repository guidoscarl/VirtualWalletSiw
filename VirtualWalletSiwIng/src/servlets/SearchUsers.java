package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Utente;
import persistence.DatabaseManager;
import persistence.dao.UtenteDao;

/**
 * Servlet implementation class SearchUsers
 */
@WebServlet("/SearchUsers")
public class SearchUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchUsers() {
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
		System.out.println("sto cercando...");
		String searched=request.getParameter("searched");
		String s=searched.toUpperCase();
		System.out.println(s);
		UtenteDao ut=DatabaseManager.getInstance().getDaoFactory().getUtenteDao();
		ArrayList<Utente> users=ut.getAllUsers();
		
		String html="";
		if(!searched.equals(""))
		for(Utente u:users) {
			String name =u.getNome().toUpperCase();
			String surname = u.getCognome().toUpperCase();
			if(name.contains(s) || surname.contains(s)) {
				html+="<li class=\"list-group-item\"><a href=\"viewProfile?email="+u.getEmail()+"\">"+u.getNome()+" "+u.getCognome()+"</a></li>";
			}
		}
		response.getWriter().append(html);
	}

}
