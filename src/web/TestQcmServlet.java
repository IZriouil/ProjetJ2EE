package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestQcmServlet
 */
@WebServlet("/TestQcmServlet")
public class TestQcmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public TestQcmServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String reponse =request.getParameter("1001");
		System.out.println("vous avez cocher la case ---------"+reponse);
		this.getServletContext().getRequestDispatcher("/WEB-INF/welcomeProf.jsp?page=h").forward(request, response); 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
