package bean;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import entity.Chapitre;
import entity.Etudiant;
import entity.QCM;
import entity.Question;
import entity.Validation;

@Stateless
@LocalBean

public class BeanQCM {
	@PersistenceContext(name="monMiniProjet")
	EntityManager em;
	
	public QCM createQCM( List<Validation> validations, int minScore,List<Question> questions){
		QCM controle=new QCM(validations, minScore,questions);
		em.persist(controle);
		return controle; 
	}
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
	   
	
   public boolean controlValide(QCM controle,Etudiant etudiant){
	   /*Validation 	public List<Integer> getQCM_Questions_id(int Id){
		Query query = em.createQuery("select idQuestion  from Question   where controle.id  = :ID");
		query.setPar	public List<Integer> getQCM_Questions_id(int Id){
		Query query = em.createQuery("select idQuestion  from Question   where controle.id  = :ID");
		query.setParameter("ID",Id);
		 return  query.getResultList();
	}
	ameter("ID",Id);
		 return  query.getResultList();
	}
	ec = new Validation();
	   ec.setC(c) ; ec.setE(e);
	   if(ec.getScore()>c.getMinscore()){ ec.setaValide(true); c.getOntValide().add(e);}
	   else ec.setaValide(false); //retry
	   em.persist(c);
	   em.persist(ec);*/
	   return true;
   }/*
public int max(int i,int j){
	if(i<j) return j; 
	else return i;
}*/
}
