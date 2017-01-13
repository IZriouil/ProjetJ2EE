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

import entity.Etudiant;
import entity.Inscription;
import entity.Module;
import entity.Validation;

@Stateless
@LocalBean
public class BeanModule {
	@PersistenceContext(name="monMiniProjet")
	EntityManager em;
	@EJB
	BeanQCM beanControle;
	
	@SuppressWarnings("unchecked")
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
	
	
	
	
	@SuppressWarnings("unchecked")
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
	
	public boolean Inscrire(Etudiant etudiant , Module moduleToSignIn){
		String timeStamp = new SimpleDateFormat("dd-MM-yyyy_HH:mm").format(Calendar.getInstance().getTime());
		
		try{	
			Query query = em.createNativeQuery("INSERT INTO Inscription (dataInscription, niveauAvancement,module_id,etudiant_id) " +
		            " VALUES(?,?,?,?)");
		        query.setParameter(1, timeStamp);
		        query.setParameter(2, 0);
		        query.setParameter(3, moduleToSignIn.getId());
		        query.setParameter(4, etudiant.getId());
		        query.executeUpdate();
		        
		        Validation validation=new Validation(moduleToSignIn.getChapitres().get(0).getControle(), etudiant, " ", 0, 0);
		        List<Validation> listv = new ArrayList<Validation>();
				listv.add(validation);
				etudiant.setValidations(listv);
				moduleToSignIn.getChapitres().get(0).getControle().setValidations(listv);
				try{
					em.persist(validation);
					em.flush();
				}
				catch(Exception ex){
					System.out.println("Problem in deblock first chapter...");
				}
		        return true;
		}
		catch(Exception e){
			return false;
		}
	} 
	
	
	
	
			

}
