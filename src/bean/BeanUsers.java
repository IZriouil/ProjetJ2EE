package bean;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import entity.Utilisateur;

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
	
    

}
