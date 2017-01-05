package bean;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import entity.Chapitre;
import entity.Etudiant;
import entity.Module;
import entity.QCM;
import entity.Question;
import entity.Validation;

@Stateless
@LocalBean

public class BeanQCM {
	@PersistenceContext(name="monMiniProjet")
	EntityManager em;
	

	  /* public int corrigerControl(List<String> reponses,Controle c,Etudiant e){
	   EtudiantControl ec = new EtudiantControl();
	 for(Question q:c.getQuestions()){
	 List<String> rj = q.getReponsesJustes();
	  int score = c.getScore();
	  int i;
	  int max = max(rj.size(),reponses.size());
	  for(i=0;i<max;i++){
		  if(rj.get(i).equals(reponses.get(i))){score++;}
	  }
	  	c.setScore(score);
	  	em.persist(c);
		return score; }*/
		
	public List<Integer> getQCM_Questions_id(int Id){
		Query query = em.createQuery("select idQuestion  from Question   where controle.id  = :ID");
		query.setParameter("ID",Id);
		 return  query.getResultList();
	}
	   
	
	public QCM createControle(int minScore,boolean afficherScore,int nombreQuestion,List<Question> questions){
		QCM controle = new QCM(minScore,afficherScore,nombreQuestion,questions);
		
		em.persist(controle);
		em.flush();
		return controle;
	}


}
