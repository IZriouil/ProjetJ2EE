package web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BeanModule;
import entity.Module;

@WebServlet("/etudiantServlet")
public class etudiantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@EJB
	private BeanModule beanM;
	
	
	public etudiantServlet() {
	       super();
	   }

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String status=(String) request.getSession().getAttribute("status");
		if(status!=null && status.equals("up")){
			String username=(String) request.getSession().getAttribute("username");
			//Nouvelle d'inscription dans un module
			if(request.getParameter("id_m") != null ){
				System.out.println("vous avez cliquer sur le module suivant"+request.getParameter("id_m"));

				beanM.Inscrire(username,Integer.parseInt(request.getParameter("id_m")));

			}
			/**
			 *  Récupération des modules de l'utilisateur courant
			 */

			List<Module> allModules = beanM.getAllModules();
			List<Module> modulesInscrits = new ArrayList<Module>() ;
			List<Module> modulesNonInscrits = new ArrayList<Module>() ;
			Iterator<Module> it =allModules.iterator();
			while(it.hasNext()){
				Module module = it.next();
				if(beanM.isInscrit(username, module.getId()))
					modulesInscrits.add(module);
				else
					modulesNonInscrits.add(module);												
			}
			

			String page=request.getParameter("page");
			switch (page) {
	        case "h": this.getServletContext().getRequestDispatcher("/WEB-INF/welcome.jsp?page=h").forward(request, response); //Home	     		 
	                  break;
	        case "m": request.setAttribute("modulesInscrits",modulesInscrits); //ModulesInscrits
	        		  request.setAttribute("modulesNonInscrits",modulesNonInscrits); //ModulesNonInscrits
	        
	        		  this.getServletContext().getRequestDispatcher("/WEB-INF/welcome.jsp?page=m").forward(request, response);	
	                  break;
	        case "i": 
	        		  request.setAttribute("Inscriptions",beanM.getModulesInscrits(username)); //Liste des inscriptions
	        		  this.getServletContext().getRequestDispatcher("/WEB-INF/welcome.jsp?page=i").forward(request, response);	  //Inscription 
	                  break;
	        default:  this.getServletContext().getRequestDispatcher("/WEB-INF/welcome.jsp?page=h").forward(request, response);	//Default Home
	                  break;
			}
		}
		else{
			this.getServletContext().getRequestDispatcher("/login").forward(request, response);
		}
		
				
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}
}
