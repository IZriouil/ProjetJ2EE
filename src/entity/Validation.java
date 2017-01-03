package entity;
import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Validation implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id @ManyToOne 
	private QCM controle; 
	@Id @ManyToOne 
	private Etudiant etudiant;
	private Date dateValidation;
	private int nbEssai;
	
	public QCM getControle() {
		return controle;
	}
	public void setControle(QCM controle) {
		this.controle = controle;
	}
	public Etudiant getEtudiant() {
		return etudiant;
	}
	public void setEtudiant(Etudiant etudiant) {
		this.etudiant = etudiant;
	}
	public Date getDateValidation() {
		return dateValidation;
	}
	public void setDateValidation(Date dateValidation) {
		this.dateValidation = dateValidation;
	}
	public int getNbEssai() {
		return nbEssai;
	}
	public void setNbEssai(int nbEssai) {
		this.nbEssai = nbEssai;
	}
	
	
}
