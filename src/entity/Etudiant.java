package entity;

import java.util.List;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

@Entity
@DiscriminatorValue("Etud")
public class Etudiant extends Utilisateur {
	
	@OneToMany
	private List<Inscription> inscriptions;
	@OneToMany
	private List<Validation> validations;
	
	public List<Inscription> getInscriptions() {
		return inscriptions;
	}
	public void setInscriptions(List<Inscription> inscriptions) {
		this.inscriptions = inscriptions;
	}
	public List<Validation> getValidations() {
		return validations;
	}
	public void setValidations(List<Validation> validations) {
		this.validations = validations;
	}
	
	
	

}
