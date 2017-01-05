package bean;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import entity.Chapitre;
import entity.Module;
import entity.QCM;
import entity.Question;

@Stateless
@LocalBean
public class BeanQuestion {
	@PersistenceContext(name="monMiniProjet")
	EntityManager em;

	public boolean corrigerQuestion(Question q,List<String> reponse){
		if(q.getReponses() == reponse) return true; 
		else return false;
	}
	public Question getQuestionById(int Id){
		Question question=new Question();
		Query query = em.createQuery("select q  from Question q  where idQuestion = :ID");
		query.setParameter("ID",Id);
		if(query.getSingleResult()!=null)
			return (Question) query.getSingleResult();
		else return question;
		
	}
	public Question createQuestion( QCM controle, String enonce,
			List<String> reponses, List<String> reponsesJuste){
		Question question = new  Question( controle, enonce,
				 reponses,  reponsesJuste);
		controle.getQuestions().add(question);
		question.setControle(controle);
		em.persist(question);
		em.flush();
		return question;
	}

}
