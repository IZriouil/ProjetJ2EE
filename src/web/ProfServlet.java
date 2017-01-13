package web;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BeanChapitre;
import bean.BeanModule;

@WebServlet("/welcomeProf")
public class ProfServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@EJB
	private BeanModule beanM;
	@EJB
	private BeanChapitre beanC;
	
	
    public ProfServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String status=(String) request.getSession().getAttribute("status");
		
		if(status!=null && status.equals("up")){
			//RADOUANE
			
			String page=request.getParameter("page");
			switch (page) {
	        case "h": this.getServletContext().getRequestDispatcher("/WEB-INF/welcomeProf.jsp?page=h").forward(request, response); //Home	     		 
	                  break;
	        case "m": request.setAttribute("modules", beanM.getAllModules());
	        		  this.getServletContext().getRequestDispatcher("/WEB-INF/welcomeProf.jsp?page=m").forward(request, response);
	       
	        	
	        		break;
	        case "a":
	        		 if(request.getParameter("id_m")!=null){
	        		  String module_id=request.getParameter("id_m");
	        		  request.setAttribute("id_m", module_id);	
	        		  this.getServletContext().getRequestDispatcher("/WEB-INF/welcomeProf.jsp?page=a").forward(request, response);
	        		 }
	        		 else{
	        			 System.out.println("id_m not found there is a problem");
	        		 }
	                 break;
	                 
	        case "q": 
	        		  this.getServletContext().getRequestDispatcher("/WEB-INF/welcomeProf.jsp?page=q").forward(request, response);
	        		  break;
	        		  
	        case "qf":
	        		if(request.getParameter("id_c")!=null){
		        		  String chapitre_id=request.getParameter("id_c");
		        		  request.setAttribute("id_c", chapitre_id);
		        		  this.getServletContext().getRequestDispatcher("/WEB-INF/welcomeProf.jsp?page=qf").forward(request, response);
		   			   }
	        		else{
	        			System.out.println("id_c not found there is a prblem");
	        		}
  		  			  break;
  		  			  
	        default:  this.getServletContext().getRequestDispatcher("/WEB-INF/welcomeProf.jsp?page=h").forward(request, response);	//Default Home
	                  break;
	                  
			}
			
		}else{
			this.getServletContext().getRequestDispatcher("/login").forward(request, response);
		}
		
	}
		

}
