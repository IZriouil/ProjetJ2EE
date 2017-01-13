package entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class QCM {
		@Id @GeneratedValue
		private int id;
		@OneToMany(fetch = FetchType.EAGER, targetEntity=Validation.class,mappedBy="controle")
		private List<Validation> validations;
		private int minScore;
		@OneToMany(fetch = FetchType.EAGER)
		private List<Question> questions;
		private boolean afficherScore;
		private int nombreQuestion;
		public QCM() {
			super();
		}

		public QCM( int minScore,boolean afficherScore,int nombreQuestion,
				List<Question> questions) {
			
			
			this.minScore = minScore;
			
			this.afficherScore=afficherScore;
			this.nombreQuestion=nombreQuestion;
			this.questions=questions;
		}
		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}
		
		public List<Validation> getValidations() {
			return validations;
		}
		public void setValidations(List<Validation> validations) {
			this.validations = validations;
		}
		public int getMinScore() {
			return minScore;
		}
		public void setMinScore(int minScore) {
			this.minScore = minScore;
		}
		public List<Question> getQuestions() {
			return questions;
		}
		public void setQuestions(List<Question> questions) {
			this.questions = questions;
		}
		public boolean isAfficherScore() {
			return afficherScore;
		}

		public void setAfficherScore(boolean afficherScore) {
			this.afficherScore = afficherScore;
		}

		public int getNombreQuestion() {
			return nombreQuestion;
		}

		public void setNombreQuestion(int nombreQuestion) {
			this.nombreQuestion = nombreQuestion;
		}


		
		

}
