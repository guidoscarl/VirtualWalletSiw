package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Excepions.UsersNotFound;
import models.Utente;
import persistence.DatabaseManager;
import persistence.PostgresDAOFactory;
import persistence.dao.AmiciziaDao;
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
		String emailUs=request.getParameter("emailUs");
		
		String nameUs=request.getParameter("nameUs");
		String surnameUs=request.getParameter("surnameUs");
		request.setAttribute("emailUs", emailUs);
		if(nameUs!=null && surnameUs!=null) {
		request.setAttribute("nameUs", nameUs);
		request.setAttribute("surnameUs", surnameUs);
		}
		RequestDispatcher rd = request.getRequestDispatcher("transaction.jsp");
		rd.forward(request, response);


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		PostgresDAOFactory p = new PostgresDAOFactory();
		UtenteDao dao=p.getUtenteDao();
		Utente mittente=new Utente("a","a",(String)request.getSession().getAttribute("email"),"a",(int)request.getSession().getAttribute("saldo"),"",true);
		
		try {
			String email = (String)request.getSession().getAttribute("email");
			String emailUs =(String)request.getParameter("email");
			AmiciziaDao amd = DatabaseManager.getInstance().getDaoFactory().getAmiciziaDao();
			if(dao.existUtente((String)request.getParameter("email")) && !amd.checkRelation(email, emailUs).getValue().equals("active")) {
				response.getWriter().append("notfriend");

				
			}
			else {
			Utente destinatario=dao.getUtenteforTransaction((String)request.getParameter("email"));
			dao.transaction(mittente, destinatario, Integer.parseInt(request.getParameter("importo")));
			
			int oldSaldo=(int)request.getSession().getAttribute("saldo");
			request.getSession().setAttribute("saldo", oldSaldo-Integer.parseInt(request.getParameter("importo")));
			//response.sendRedirect("confirm.html");
			response.getWriter().append("confirm");
			}
		} catch (UsersNotFound e) {
			
			response.getWriter().append("failed");
		}
		catch (Exception e) {
			
		}
		
		
	}

}
