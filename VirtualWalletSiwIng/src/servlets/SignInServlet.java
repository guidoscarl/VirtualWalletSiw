package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import Excepions.UsersNotFound;
import models.Friendship;
import models.Utente;
import persistence.DatabaseManager;
import persistence.PostgresDAOFactory;
import persistence.UtenteDaoJdbc;
import persistence.dao.AmiciziaDao;
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
		
		
		AmiciziaDao am = DatabaseManager.getInstance().getDaoFactory().getAmiciziaDao();
		String email = (String)request.getSession().getAttribute("email");
		ArrayList<Friendship> received = am.getRequest(email);
		ArrayList<Friendship> sended = am.getSended(email);
		ArrayList<Friendship> friends = am.getFriends(email);
		String image = DatabaseManager.getInstance().getDaoFactory().getUtenteDao().getImage(email);
		request.setAttribute("image", image);

		
		if(DatabaseManager.getInstance().getDaoFactory().getMessageDao().haveMessage(email)) {
			request.setAttribute("haveMes", true);
		}
		request.setAttribute("received", received);
		request.setAttribute("sended", sended);
		request.setAttribute("friends", friends);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("account.jsp");
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		 
		
		
		
		UtenteDao dao =DatabaseManager.getInstance().getDaoFactory().getUtenteDao();
		
		HttpSession session=request.getSession();
		
		
			Utente u =dao.getByPrimaryKey(email, password);
			String txt;
			 if(u==null) {
			           txt="no";
			           response.getWriter().append(txt);
			           
			        }
			else {
			//response.getOutputStream().print(email+"post");
			session.setAttribute("nome", u.getNome());
			session.setAttribute("cognome", u.getCognome());
			session.setAttribute("email", u.getEmail());
			session.setAttribute("password", u.getPass());
			
			session.setAttribute("saldo", u.getSaldo());
			request.setAttribute("saldo",u.getSaldo());
			session.setAttribute("logged", true);
			session.setAttribute("active", u.isActive());
			JSONObject g = new JSONObject();
			g.append("saldo", u.getSaldo());
			g.append("email", u.getEmail());
			//response.sendRedirect("account.jsp");
			
			txt=g.toString();
			response.getWriter().append(txt);
			
			}
			 
			
			
		
			
		
		
		    
		
		
		
		
		
		
		
		
		
		
	}

}
