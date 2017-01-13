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
import bean.BeanModule;
import bean.BeanQCM;
import bean.BeanQuestion;
import bean.BeanUsers;
import bean.UtilsJSP;
import entity.Chapitre;
import entity.Etudiant;
import entity.Inscription;
import entity.Module;
import entity.Question;

@WebServlet("/etudiantServlet")
public class etudiantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@EJB
	private BeanModule  beanM;
	@EJB
	private BeanUsers beanUsers;
	@EJB
	private BeanChapitre beanCH;
	@EJB
	private BeanQCM beanQCM;
	@EJB
	private BeanQuestion beanQuestion;
	private	List<Question> listQuestionsQCM = new ArrayList<Question>();
	
	
	public etudiantServlet() {
	       super();
			System.out.println("Ca Marche");
	   }

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Verification de Session sinon go authentification
		String status=(String) request.getSession().getAttribute("status");
		if(status!=null && status.equals("up"))
		{
			
			String username=(String) request.getSession().getAttribute("username");
			
			//Nouvelle d'inscription dans un module
			if(request.getParameter("id_m") != null ){
				int id_m=Integer.parseInt(request.getParameter("id_m"));
				Module moduleToSignIn=beanM.getModule(id_m);
				beanM.Inscrire((Etudiant)beanUsers.getUser(username),moduleToSignIn);

			}
			
			//Correction
			if(request.getParameter("correction") != null )
			{  
				System.out.println("Correction block entered...");
				int chap_id=Integer.parseInt(request.getParameter("correction"));
				Etudiant etudiant=(Etudiant) beanUsers.getUser(username);
				boolean aValide=beanQCM.corrigerQcm(listQuestionsQCM, request,etudiant);
				System.out.println("QCM corrected...");
				if(aValide){
					Module moduleToUpdate=beanCH.getChapitreId(chap_id).getModule();
					float pas=100/moduleToUpdate.getChapitres().size();
					Inscription inscriptionToUpdate=UtilsJSP.getInscription(moduleToUpdate.getInscriptions(), username);
					inscriptionToUpdate.setNiveauAvancement(inscriptionToUpdate.getNiveauAvancement()+pas);
					beanQCM.updateInscription(inscriptionToUpdate);
					System.out.println("Niveau d'avancement Updated");
					Chapitre nextChapitre=beanCH.nextChapitre(moduleToUpdate.getId(),chap_id);
					if(nextChapitre!=null){
						beanQCM.createValidation(nextChapitre.getControle(), (Etudiant)beanUsers.getUser(username), " ", 0, 0);
						System.out.println("Next Chapitre available now...");
					}
				}
				else {
					System.out.println(username+" a validé !");
				}
				response.sendRedirect("etudiantServlet?page=m");
					
			}
			
			Chapitre chapitre=new Chapitre();
			if(request.getParameter("chap_id")!=null){
				int chap_id=Integer.parseInt(request.getParameter("chap_id"));
				chapitre=beanCH.getChapitreId(chap_id);	
			}
						
			List<Module> modules=beanM.getAllModules();
			

			String page=request.getParameter("page");
			switch (page) {
			
	        case "h": this.getServletContext().getRequestDispatcher("/WEB-INF/welcome.jsp?page=h").forward(request, response); //Home	     		 
	                  break;
	                  
	        case "m": request.setAttribute("modules",modules); //ModulesInscrits	        
	        		  this.getServletContext().getRequestDispatcher("/WEB-INF/welcome.jsp?page=m").forward(request, response);	
	                  break;
	                  
	        case "i": request.setAttribute("modules",modules); //Liste des inscriptions
	        		  this.getServletContext().getRequestDispatcher("/WEB-INF/welcome.jsp?page=i").forward(request, response);	  //Inscription 
	                  break;
	                  
	        case "q": request.setAttribute("chapitre", chapitre);	
	        		  if(chapitre.getControle()!=null){
	        		  List<Integer> listIdQuestions =beanQCM.getQCM_Questions_id(chapitre.getControle().getId());
	        		  Iterator<Integer> itt = listIdQuestions.iterator();
	        		  listQuestionsQCM.clear();
	        		  while (itt.hasNext()) {
	        			  listQuestionsQCM.add(beanQuestion.getQuestionById(itt.next().intValue()));
	        		  }
	        		  }
	        		  request.setAttribute("listQuestionsQCM", listQuestionsQCM);
	        		  this.getServletContext().getRequestDispatcher("/WEB-INF/welcome.jsp?page=q").forward(request, response);
	        		  
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
