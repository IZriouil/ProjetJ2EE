package bean;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import entity.Chapitre;
import entity.Inscription;
import entity.Module;
import entity.QCM;

@Stateless
@LocalBean

public class BeanChapitre {
	@PersistenceContext(name="monMiniProjet")
	EntityManager em;
	
	public Chapitre createChapitre(String titre,  Module module, String text){
		Chapitre chapitre = new Chapitre(titre,module, text);
		module.getChapitres().add(chapitre);
		chapitre.setModule(module);
		em.persist(chapitre);
		em.flush();
		return chapitre;
	}
	public List<Chapitre> getChapitreByModuleId(int moduleId){
		Query query = em.createQuery("select c from Chapitre c where module.id  = :ID");
		query.setParameter("ID",moduleId);
		if(!query.getResultList().isEmpty())
			return query.getResultList();
		else return new ArrayList<Chapitre>();	
	}
	

	public Chapitre getChapitreId(int chapitreId){
		Query query = em.createQuery("select c from Chapitre c where id  = :ID");
		query.setParameter("ID",chapitreId);
		
			return (Chapitre)query.getSingleResult();
		
	}
	public Chapitre updateControle (Chapitre chapitre) {
	    return em.merge(chapitre);
	}
}
