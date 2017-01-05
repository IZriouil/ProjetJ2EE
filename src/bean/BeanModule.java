package bean;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import entity.Chapitre;
import entity.Etudiant;
import entity.Inscription;
import entity.Module;

@Stateless
@LocalBean
public class BeanModule {
	@PersistenceContext(name="monMiniProjet")
	EntityManager em;
	@EJB
	BeanQCM beanControle;
	
	public List<Module> getAllModules() {   
        Query q = em.createQuery("select m from Module m");  
        return q.getResultList();  
    }
	
	public Module getModule(int id){
		List<Module> listM =getAllModules();
		Iterator<Module> it = listM.iterator();
		while(it.hasNext()){
			Module module=it.next();
			if( module.getId()==id)
				return module;
		}
		return null;
	}
	
	public List<Inscription> getModulesInscrits(String etudiantId){
		Query query = em.createQuery("select i from Inscription i where etudiant.id  = :ID");
		query.setParameter("ID",etudiantId);
		if(!query.getResultList().isEmpty())
			return query.getResultList();
		else return new ArrayList<Inscription>();
	}
	
	public boolean isInscrit(String etudiantId , int moduleId){
		Query query = em.createQuery("select i from Inscription i where etudiant.id  = :IDETUD AND module.id = :IDMOD ");
		query.setParameter("IDETUD",etudiantId );
		query.setParameter("IDMOD", moduleId);
		return !query.getResultList().isEmpty();
	}
	
	public boolean Inscrire(String etudiantId , int moduleId){
		String timeStamp = new SimpleDateFormat("dd-MM-yyyy").format(Calendar.getInstance().getTime());
	
		try{	
			Query query = em.createNativeQuery("INSERT INTO Inscription (dataInscription, niveauAvancement,module_id,etudiant_id) " +
		            " VALUES(?,?,?,?)");
		        query.setParameter(1, timeStamp);
		        query.setParameter(2, 0);
		        query.setParameter(3, moduleId);
		        query.setParameter(4, etudiantId);
	
		        query.executeUpdate();
		        return true;
		}
		catch(Exception e){
			return false;
		}
	} 
	
}
