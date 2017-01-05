package bean;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.swing.text.html.ListView;
import javax.validation.Valid;

import entity.Chapitre;
import entity.Etudiant;
import entity.Inscription;
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
	
	public Validation getNbrEssais(String etudiantId ,int qcm_id){
		Query query = em.createQuery("select i from Validation i where etudiant.id  = :IDETUD AND controle.id = :IDQ");
		query.setParameter("IDETUD",etudiantId );
		query.setParameter("IDQ",qcm_id );
		if(!query.getResultList().isEmpty())
			return (Validation)query.getSingleResult();
		else return null;
	}
	
	public int corrigerQcm( List<Question> listQuestionsQCM ,HttpServletRequest request, Etudiant etudiant ){
		int score =0;
		BeanUsers beanUser = null;
		Question uneQuestion;
		Iterator<Question> it =listQuestionsQCM.iterator();
		while(it.hasNext()){
			uneQuestion=it.next();
			int id_question=uneQuestion.getIdQuestion();
			boolean repJuste=true;
			int nbr_rep_donnee=0;
			for(int i=0;i<4;i++){
				String reponse_donne=request.getParameter(String.valueOf(id_question)+i);
				System.out.println("votre reponse a la question "+String.valueOf(id_question)+i+" est "+reponse_donne);
				if(reponse_donne!=null){
					nbr_rep_donnee++;
					if(!uneQuestion.getReponsesJuste().contains(reponse_donne)){
						repJuste=false;
						break;
					}
				}
			}
			
		if(repJuste && nbr_rep_donnee==uneQuestion.getReponsesJuste().size())score++;		
		}
		
		if(listQuestionsQCM.size()>0){
			QCM qcm =listQuestionsQCM.get(0).getControle();
			int miniScore =qcm.getMinScore();
			String date_now = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
			
			//etudiant passe le qcm pour la 1 er fois
			Validation validation=this.getNbrEssais(etudiant.getId(),qcm.getId());
			if(validation==null){
					if(score>miniScore){//qcm validé
						this.createValidation(qcm,etudiant, date_now,1, score);
					}
					else{//qcm non validé
						this.createValidation(qcm,etudiant, " ",1, score);	
					}
			
			//etudiant a deja passé le qcm
			}else{
				int nbr_essayes=validation.getNbEssai()+1;
				if(score>miniScore){//qcm validé
					validation.setDateValidation(date_now);
					validation.setScore_validation(score);
					validation.setNbEssai(nbr_essayes);;
					this.updateValidation(validation);
				}
				else{//qcm non validé
					validation.setDateValidation(" ");
					validation.setScore_validation(score);
					validation.setNbEssai(nbr_essayes);
					this.updateValidation(validation);
				}
			}
		}
		return score ;
	}
		
	public List<Integer> getQCM_Questions_id(int Id){
		Query query = em.createQuery("select idQuestion  from Question   where controle.id  = :ID");
		query.setParameter("ID",Id);
		 return  query.getResultList();
	}
	   
	public Validation createValidation(QCM qcm, Etudiant etudiant, String datev,int nbEssai , int score){
		Validation validation = new Validation(qcm,etudiant,datev,nbEssai, score);
		List<Validation> listv = new ArrayList<Validation>();
		listv.add(validation);
		etudiant.setValidations(listv);
		qcm.setValidations(listv);
		try{
			em.persist(validation);
			em.flush();
		}
		catch(Exception ex){
			System.out.println("erreur paire etud_id et qcm_id existe deja");
		}
		return validation;
	}
	
	public boolean updateValidation(Validation validation ){
			em.merge(validation);
		    em.flush();
		return true;
	}
   
}
