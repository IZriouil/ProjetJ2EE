package entity;
import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Inscription implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id @ManyToOne 
	private Module module; 
	@Id @ManyToOne 
	private Etudiant etudiant;
	protected String dataInscription ;
	private float niveauAvancement;
	
	public void setNiveauAvancement(float niveauAvancement) {
		this.niveauAvancement = niveauAvancement;
	}
	public Module getModule() {
		return module;
	}
	public void setModule(Module module) {
		this.module = module;
	}
	public Etudiant getEtudiant() {
		return etudiant;
	}
	public void setEtudiant(Etudiant etudiant) {
		this.etudiant = etudiant;
	}
	public String getDataInscription() {
		return dataInscription;
	}
	public void setDataInscription(String dataInscription) {
		this.dataInscription = dataInscription;
	}
	public float getNiveauAvancement() {
		return niveauAvancement;
	}
	

}
