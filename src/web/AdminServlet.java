package web;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BeanUsers;

@WebServlet("/AdminServlet")
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
	        case "h": bean.addUser("mehdi", "sa","Prof");
	        		 this.getServletContext().getRequestDispatcher("/WEB-INF/welcomeAdmin.jsp?page=h").forward(request, response); //Home	     		 
	                  break;
	        case "u":
	        		request.setAttribute("utilisateurs", bean.getAllUsers());
	        		  this.getServletContext().getRequestDispatcher("/WEB-INF/welcomeAdmin.jsp?page=u").forward(request, response);
	        		 //Liste des utilisateurs
	                  break;
	        case "rm":
	        	String id =request.getParameter("id");
	        	if(request.getParameter("id")!=null){
	        		System.out.println("vous voulez supprimez  "+id);
	        		  bean.removeUser(id);
	        		  request.setAttribute("utilisateurs", bean.getAllUsers());
			  		  this.getServletContext().getRequestDispatcher("/WEB-INF/welcomeAdmin.jsp?page=u").forward(request, response);	  //Liste des utilisateurs
			            break;
			    }
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