package web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BeanChapitre;
import bean.BeanQCM;
import bean.BeanQuestion;
import bean.BeanUsers;
import entity.Chapitre;
import entity.Etudiant;
import entity.Question;
import entity.Validation;

/**
 * Servlet implementation class ModuleServlet
 */
@WebServlet(description = "gestion des chapitres d'un module, et des controles ", 
			urlPatterns = { "/ModuleServlet" })

public class ModuleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	private BeanUsers bean;
	@EJB
	private	BeanChapitre beanChapitre = new BeanChapitre();
	@EJB
	private BeanQCM beanQCM;
	@EJB
	private BeanQuestion beanQuestion;
	private	List<Question> listQuestionsQCM = new ArrayList<Question>();

    public ModuleServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String module=request.getParameter("id_m");
		List<Chapitre> listChapitre = new ArrayList<Chapitre>();

		String username = (String) request.getSession().getAttribute("username");
		
		// Correction du qcm
		int score = beanQCM.corrigerQcm(listQuestionsQCM , request,(Etudiant)bean.getUser(username));
		System.out.println("votre score est ---------"+score);
		Validation validation= beanQCM.getNbrEssais("Issam",1);
		if(validation!=null){
			System.out.println("Issam est dans la table validation");
			//validation.setDateValidation("date_update");
			//beanQCM.updateValidation(validation);
		}
		if(module!=null){
			request.getSession().setAttribute("module", module);	
			System.out.println("les chapitres de ce module von etre affiches---------"+module);
			listChapitre =beanChapitre.getChapitreByModuleId(Integer.parseInt(module));
		}
		else {
			 module= (String)request.getSession().getAttribute("module");
			 listChapitre =beanChapitre.getChapitreByModuleId(Integer.parseInt(module));
		}
		// affichage du contenu d'un chapitre
		Chapitre ch = null ;
		String chapitre_id=request.getParameter("ch_id");
		if(chapitre_id!=null){
			Iterator<Chapitre> it = listChapitre.iterator();
			while(it.hasNext()){
				 ch = it.next();
				if(ch.getId()==Integer.parseInt(chapitre_id)){
					System.out.println("-le chapitre à afficher est " +ch.getTitre());
					break;
				}
			}
			
		}
		//traitement des qcm ici 
		String qcm_id=request.getParameter("qcm_id");

		//traitement de la page
		String page=request.getParameter("page");
		if(page==null)page="qcm";
		switch (page) {
        case "h": request.setAttribute("chapitres", listChapitre);
        		  System.out.println("looool"+bean.getUser(username).getType());
        		  request.setAttribute("type", bean.getUser(username).getType());
				  this.getServletContext().getRequestDispatcher("/WEB-INF/module.jsp?page=h").forward(request, response);  		 
                  break;
                  
        case "lire": if(ch!=null){
			        	request.setAttribute("chapitre", ch);
			 			 this.getServletContext().getRequestDispatcher("/WEB-INF/module.jsp?page=lire").forward(request, response); 
        			}
        	  break;
                         
        case "qcm":
        	if(request.getParameter("qcm_id")!=null){
    				int id_q=Integer.parseInt(request.getParameter("qcm_id"));
    				List<Integer> listIdQuestions =beanQCM.getQCM_Questions_id(id_q);
    				Iterator<Integer> itt = listIdQuestions.iterator();
    				while (itt.hasNext()) {
    					listQuestionsQCM.add(beanQuestion.getQuestionById(itt.next().intValue()));
					}
        	}
    				request.setAttribute("listQuestionsQCM", listQuestionsQCM);
  				    this.getServletContext().getRequestDispatcher("/WEB-INF/module.jsp?page=qcm").forward(request, response);
        	
        	break;
        		                    
        default:  request.setAttribute("chapitres", listChapitre);
				  this.getServletContext().getRequestDispatcher("/WEB-INF/module.jsp?page=h").forward(request, response); 
                  break;
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}