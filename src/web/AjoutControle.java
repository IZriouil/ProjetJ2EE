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
import bean.BeanQCM;
import bean.BeanQuestion;
import entity.Chapitre;
import entity.QCM;
import entity.Question;

/**
 * Servlet implementation class AjoutControle
 */
@WebServlet("/AjoutControle")
public class AjoutControle extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	private BeanChapitre beanC;
	@EJB
	private BeanQCM beanQ;
	@EJB
	private BeanQuestion beanQu;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjoutControle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String afficherS = request.getParameter("afficherScore");
		int scoreQ =Integer.valueOf( request.getParameter("scoreQ"));
		int nombreQ =Integer.valueOf( request.getParameter("nombreQ"));
		int id_c =Integer.valueOf(request.getParameter("id_c"));
		
		boolean afficherScore=false;
		if("on".equals(afficherS)){
			 afficherScore=true;
			} else{
				afficherScore=false;

			}
		List<Question> questions=new ArrayList<Question>();
		Chapitre chapitre = beanC.getChapitreId(id_c);
		System.out.println("Chapitre in AjoutControle: "+chapitre.getTitre());
		if(request.getParameter("formulaire")!=null){
		 
		 
		 
		
	
		System.out.println(afficherScore+"---"+scoreQ+"----"+nombreQ+"---"+id_c);
		this.getServletContext().getRequestDispatcher("/WEB-INF/welcomeProf.jsp?page=qc").forward(request, response);
		}else if (request.getParameter("confirmation")!=null){
			QCM controle = beanQ.createControle(scoreQ,afficherScore,nombreQ,questions);
			for(int i=1;i<=nombreQ;i++){
				String enonce = request.getParameter("titre_"+i);
				List<String> reponses=new ArrayList<String>();
				List<String> reponsesJustes=new ArrayList<String>();
				for(int j=1;j<=4;j++){
					reponses.add(request.getParameter("reponse "+j+"_"+i));
					if(request.getParameter("reponse "+j+"c_"+i)!=null)
						reponsesJustes.add(request.getParameter("reponse "+j+"_"+i));
					
				}
				Question question = new  Question( controle, enonce,
						 reponses,  reponsesJustes);
				beanQu.createQuestion(controle, enonce, reponses, reponsesJustes);
				
				
			}
			chapitre.setControle(controle);
			beanC.updateControle(chapitre);
			
			
			
			
		}
	}

}
