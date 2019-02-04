package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Transazione;
import persistence.DatabaseManager;
import persistence.dao.TransazioneDao;

/**
 * Servlet implementation class ViewHistory
 */
@WebServlet("/ViewHistory")
public class ViewHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewHistory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("STORICO");
		TransazioneDao transazioneDao=DatabaseManager.getInstance().getDaoFactory().getTransazioneDao();
		ArrayList<Transazione> transazioniM = transazioneDao.getByEmail((String)request.getSession().getAttribute("email"), TransazioneDao.MITTENTE);
		ArrayList<Transazione> transazioniD = transazioneDao.getByEmail((String)request.getSession().getAttribute("email"), TransazioneDao.DESTINATARIO);
		
		request.setAttribute("transazioniM", transazioniM);
		request.setAttribute("transazioniD", transazioniD);
		
		
		//System.out.println("fatto");
		RequestDispatcher rd = request.getRequestDispatcher("history.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		
	}

}
