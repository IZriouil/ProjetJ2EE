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
import entity.Chapitre;
import entity.Module;

/**
 * Servlet implementation class AjoutCjapitre
 */
@WebServlet("/AjoutChapitre")
public class AjoutChapitre extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	private BeanModule beanM;
	@EJB
	private BeanChapitre beanC;
	String module_id ;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjoutChapitre() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			
			String chapitre_titre=request.getParameter("titre");
			String chapitre_text =request.getParameter("texte");
			Module module = null;
			module_id=(String)request.getParameter("id_m");
			System.out.println("------------------- module ID"+module_id);
			
				module = beanM.getModule(Integer.parseInt(module_id));
				System.out.println("voila ID"+module.getId());
			
			Chapitre chapitre = beanC.createChapitre(chapitre_titre, module, chapitre_text);
			request.setAttribute("modules", beanM.getAllModules());
			
			this.getServletContext().getRequestDispatcher("/WEB-INF/welcomeProf.jsp?page=m").forward(request, response);
		}// TODO Auto-generated method stub


}
