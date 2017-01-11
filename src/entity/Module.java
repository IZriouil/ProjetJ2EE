package entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Module {
	
	@Id @GeneratedValue
	private int id;
	private String titre; 
	@OneToMany(fetch = FetchType.EAGER, targetEntity=Chapitre.class,mappedBy="module",orphanRemoval=true)
	private List<Chapitre> chapitres;
	@OneToMany(fetch = FetchType.EAGER, targetEntity=Inscription.class,mappedBy="module")
	private List<Inscription> inscriptions;
	@ManyToOne
	private Prof prof;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public List<Chapitre> getChapitres() {
		return chapitres;
	}
	public void setChapitres(List<Chapitre> chapitres) {
		this.chapitres = chapitres;
	}
	public List<Inscription> getInscriptions() {
		return inscriptions;
	}
	public void setInscriptions(List<Inscription> inscriptions) {
		this.inscriptions = inscriptions;
	}
	public Prof getProf() {
		return prof;
	}
	public void setProf(Prof prof) {
		this.prof = prof;
	}
	
	

}

