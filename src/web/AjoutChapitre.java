package web;

import java.io.IOException;
import java.util.ArrayList;
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
import entity.Chapitre;
import entity.Module;
import entity.QCM;
import entity.Question;

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
	@EJB
	private BeanQCM beanQ;
	@EJB
	private BeanQuestion beanQu;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			//Ajout Chapitre
		int module_id=0;
		List<Module> modules=beanM.getAllModules();
		int indice=0;
		for(int i=1;i<modules.size()+1;i++){
			if(request.getParameter("form"+i)!=null){
				indice=i;
				break;				
			}
				
		}
		
		System.out.println(indice);
		if(indice!=0){
			
			Module module=modules.get(indice-1);
			module_id=module.getId();
			
			System.out.println("Block Ajout Chapitre commence...");
			System.out.println("--> Creer un chapitre dans le module "+module.getTitre()+"...");
			String chapitre_titre=request.getParameter("titre"+module_id);
			
			String chapitre_text =request.getParameter("texte"+module_id);
			Chapitre chapitre = beanC.createChapitre(chapitre_titre, module, chapitre_text);
			
			System.out.println("Block Ajout Controle commence...");
			System.out.println("--> Creer le controle dans le nouveau chapitre "+chapitre.getTitre()+"...");
			String afficherS = request.getParameter("afficherScore"+module_id);
			System.out.println("--> Recuperer AfficherScore: "+afficherS);
			int scoreQ =Integer.valueOf( request.getParameter("scoreQ"+module_id));
			System.out.println("--> Recuperer score: "+scoreQ);
			String nombre = request.getParameter("nombreQ"+module_id);
			int nombreQ=Integer.valueOf(nombre);
			System.out.println("--> Recuperer nombreQ: "+nombreQ);
			
			boolean afficherScore=false;
			if("on".equals(afficherS)){
				 afficherScore=true;
				} 
			else{
					afficherScore=false;

			}
			
			List<Question> questions=new ArrayList<Question>();
			QCM controle = beanQ.createControle(scoreQ,afficherScore,nombreQ,questions);
			
			for(int i=1;i<=nombreQ;i++){
				String enonce = request.getParameter("titre_"+module_id+i);
				List<String> reponses=new ArrayList<String>();
				List<String> reponsesJustes=new ArrayList<String>();
				for(int j=1;j<=4;j++){
					reponses.add(request.getParameter("reponse "+j+"_"+module_id+i));
					if(request.getParameter("reponse "+j+"c_"+i)!=null)
						reponsesJustes.add(request.getParameter("reponse "+j+"_"+module_id+i));
					
					}
				beanQu.createQuestion(controle, enonce, reponses, reponsesJustes);	
				}
			
			chapitre.setControle(controle);
			beanC.updateControle(chapitre);
			
			
			
		}
		
		request.setAttribute("modules", beanM.getAllModules());		
		this.getServletContext().getRequestDispatcher("/WEB-INF/welcomeProf.jsp?page=m").forward(request, response);
	
		}// TODO Auto-generated method stub


}
