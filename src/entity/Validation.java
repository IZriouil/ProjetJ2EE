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
	private String dateValidation;
	private int nbEssai=0;
	private int score_validation;
	public Validation() {
		super();
	}
	
	
	
	public Validation(QCM controle, Etudiant etudiant, String dateValidation,
			int nbEssai, int score_validation) {
		super();
		this.controle = controle;
		this.etudiant = etudiant;
		this.dateValidation = dateValidation;
		this.nbEssai = nbEssai;
		this.score_validation = score_validation;
	}



	public int getScore_validation() {
		return score_validation;
	}


	public void setScore_validation(int score_validation) {
		this.score_validation = score_validation;
	}


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
	public String getDateValidation() {
		return dateValidation;
	}
	public void setDateValidation(String dateValidation) {
		this.dateValidation = dateValidation;
	}
	public int getNbEssai() {
		return nbEssai;
	}
	public void setNbEssai(int nbEssai) {
		this.nbEssai = nbEssai;
	}
	
	
}
