package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Excepions.UsersNotFound;
import javafx.util.Pair;
import models.Utente;
import persistence.DatabaseManager;

/**
 * Servlet implementation class viewProfile
 */
@WebServlet("/viewProfile")
public class viewProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public viewProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			String first = (String)request.getSession().getAttribute("email");
			String second = request.getParameter("email");
			
			Utente u = DatabaseManager.getInstance().getDaoFactory().getUtenteDao().getUtenteforTransaction(second);
			request.setAttribute("nomeUs", u.getNome());
			request.setAttribute("cognomeUs", u.getCognome());
			request.setAttribute("emailUs", second);
			
			String image=DatabaseManager.getInstance().getDaoFactory().getUtenteDao().getImage(second);
			Pair<Integer,String> check = DatabaseManager.getInstance().getDaoFactory().getAmiciziaDao().checkRelation(first, second);
			System.out.println("stato.."+check.getValue());
			request.setAttribute("status",check.getValue());
			System.out.println("numero.."+check.getKey());
			request.setAttribute("imageUs", image);
			request.setAttribute("number", check.getKey());
		} catch (UsersNotFound e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("user.jsp");
		rd.forward(request, response);

		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
