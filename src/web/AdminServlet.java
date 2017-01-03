package web;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BeanUsers;


public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@EJB
	private BeanUsers bean;
       
    public AdminServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String status=(String) request.getSession().getAttribute("status");
		if(status!=null && status.equals("up")){
			String page=request.getParameter("page");
						
			switch (page) {
	        case "h": this.getServletContext().getRequestDispatcher("/WEB-INF/welcomeAdmin.jsp?page=h").forward(request, response); //Home	     		 
	                  break;
	        case "l": this.getServletContext().getRequestDispatcher("/WEB-INF/welcomeAdmin.jsp?page=l").forward(request, response);	  //Inscription 
	                  break;
	        default:  this.getServletContext().getRequestDispatcher("/WEB-INF/welcomeAdmin.jsp?page=h").forward(request, response);	//Default Home
	                  break;
			}
		}
		else{
			this.getServletContext().getRequestDispatcher("/login").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}