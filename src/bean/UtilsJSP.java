package bean;

import java.util.List;

import javax.ejb.Stateless;

import entity.Chapitre;
import entity.Inscription;
import entity.Module;
import entity.Validation;

@Stateless
public class UtilsJSP {

	public static boolean isInscrit(List<Inscription> inscriptions,String username){
		
		for (Inscription inscription : inscriptions) {
			if(inscription.getEtudiant().getId().equals(username))
			{
				return true;
			}
		}
		return false;
	}
	

	
	public static boolean profOwner(Module module,String username ){
		
		if(module.getProf().getId().equals(username)){
			return true;
		}
		return false;
		
	}

	public static Inscription getInscription(List<Inscription> inscriptions,String username){
		for (Inscription inscription : inscriptions) {
			if(inscription.getEtudiant().getId().equals(username))
			{
				return inscription;
			}
		}
		return null;
	
	}
	
	public static Validation getValidation(Chapitre chapitre,String username){
		List<Validation> validations=chapitre.getControle().getValidations();
		for (Validation validation : validations) {
			if(validation.getEtudiant().getId().equals(username)){
				return validation;
			}
		}
		return null;
	
	}
	
	public static int validationChapitre(Chapitre chapitre,String username){
		List<Validation> validations=chapitre.getControle().getValidations();
		for (Validation validation : validations) {
			if(validation.getEtudiant().getId().equals(username)){
				if(validation.getDateValidation().equals(" "))
					return 2;
				else
					return 1;
			}
			
		}
		
		return 3;
	}
	
	

}
