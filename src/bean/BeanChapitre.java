package bean;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import entity.Chapitre;
import entity.Module;

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
	public Chapitre nextChapitre(int mod_id,int chap_id) {
		
		List<Chapitre> chapitres=this.getChapitreByModuleId(mod_id);
		boolean found=false;
		
		for (Chapitre chapitre : chapitres) {
			if(found){
				return chapitre;
			}
			if(chapitre.getId()==chap_id){
				found=true;
			}
		}
		return null;
	}
}
