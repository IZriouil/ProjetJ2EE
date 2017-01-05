package web;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Question;
import entity.Utilisateur;
import bean.BeanModule;
import bean.BeanQCM;
import bean.BeanQuestion;
import bean.BeanUsers;

@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@EJB
	private BeanUsers bean;
	@EJB
	private BeanQCM beanQCM;
	@EJB
	private BeanQuestion beanQuestion;

	public login() {
	       super();
	   }

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		if(request.getParameter("logout") != null )
		{  
			//on vide la session 
			System.out.println("Status --> Down");
			request.getSession().setAttribute("status", "down");
			request.getSession().invalidate();
			response.sendRedirect("login");
		}
		
		String username=(String) request.getSession().getAttribute("username");
		String pwd=(String) request.getSession().getAttribute("password");
		String status=(String)request.getSession().getAttribute("status");
		
		if(status != null && status.equals("up")){
			System.out.println(status);
			String type =bean.getUser(username).getType();
			switch (type) {
        	case "Etud":this.getServletContext().getRequestDispatcher("/etudiantServlet?page=h").forward(request, response);	
                  break;        
        	case "Prof":this.getServletContext().getRequestDispatcher("/welcomeProf?page=h").forward(request, response);
                  break;
        	case "Admin":this.getServletContext().getRequestDispatcher("/welcomeAdmin?page=h").forward(request, response);	
                  break;
        	default:  this.getServletContext().getRequestDispatcher("/etudiantServlet?page=h").forward(request, response);
                  break;
		}
			
		}
		else{
			
			pwd = request.getParameter("password");
			username = request.getParameter("username");
			if(username!=null && pwd!=null){
				if(bean.checkLogin(username, pwd)){
					
					request.getSession().setAttribute("username", username);
					request.getSession().setAttribute("pwd", pwd);
					request.getSession().setAttribute("status", "up");
					
					System.out.println("Succes Authentification");
					String type =bean.getUser(username).getType();
					System.out.println("voilaaa un ------"+type	);
					
				
					/*
					 * ADD IF PROF OU ETUDIANT OU ADMIN D'APRES TYPED
					 * etudiantServlet
					 * profServlet
					 * adminServlet
					 */
					
					switch (type) {
			        	case "Etud":this.getServletContext().getRequestDispatcher("/etudiantServlet?page=h").forward(request, response);	
			                  break;        
			        	case "Prof":this.getServletContext().getRequestDispatcher("/welcomeProf?page=h").forward(request, response);
			                  break;
			        	case "Admin":this.getServletContext().getRequestDispatcher("/welcomeAdmin?page=h").forward(request, response);	
			                  break;
			        	default:  this.getServletContext().getRequestDispatcher("/etudiantServlet?page=h").forward(request, response);
			                  break;
					}
					
				}
				else{
					this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp?connect=false").forward(request, response);
				}		
			}
			else{
				this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);	
			}
			
			
		}
		
				
	}
}
