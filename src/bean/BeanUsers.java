package bean;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import entity.Etudiant;
import entity.Prof;
import entity.QCM;
import entity.Question;
import entity.Utilisateur;
import entity.Validation;

/**
 * Session Bean implementation class BeanUsers
 */
@Stateless
@LocalBean
public class BeanUsers {

	@PersistenceContext  
    private EntityManager em; 
	
	public BeanUsers() {
        
    }
	
	public List<Utilisateur> getAllUsers() {   
        Query q = em.createQuery("select u from Utilisateur u");  
        return q.getResultList();  
    } 
	
	public boolean checkLogin(String id,String pwd){

		Query query = em.createQuery("select u from Utilisateur u where u.id = :ID AND u.password = :PWD");
		query.setParameter("ID",id);
		query.setParameter("PWD",pwd);
		return !query.getResultList().isEmpty();
	}
	
	public Utilisateur getUser(String id){

		Query query = em.createQuery("select u from Utilisateur u where u.id = :ID ");
		query.setParameter("ID",id);
		return (Utilisateur)query.getSingleResult();
	}
	
	public int removeUser(String id){
		
		//Query query = em.createQuery("delete from Utilisateur  where id = :ID");
		Utilisateur utilisateur =em.find(Utilisateur.class,id);
		//System.out.println("remove user   "+utilisateur.getId());
		if(utilisateur!=null)
			em.remove(utilisateur);
			em.flush();
		return 0;
	}
	
	public Utilisateur addUser(String login,String passwd,String type){
		
				Utilisateur user;
				if(type.equals("Etud"))
					 user= new Etudiant();
				else
					 user = new Prof();
					
				user.setId(login);
				user.setPassword(passwd);
			try{	
				em.persist(user);
				em.flush();
			}
			catch(Exception e){
				System.out.println("Erreur insertion Etudiant \n"+e.getStackTrace());
			}
		return user;					
	}	   			
}
