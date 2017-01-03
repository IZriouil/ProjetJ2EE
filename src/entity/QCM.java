package entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class QCM {
		@Id @GeneratedValue
		private int id;
		@OneToMany
		private List<Validation> validations;
		private int minScore;
		@OneToMany
		private List<Question> questions;
		
		public QCM() {
			super();
		}

		public QCM(List<Validation> validations, int minScore,
				List<Question> questions) {
			super();
			this.validations = validations;
			this.minScore = minScore;
			this.questions = questions;
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
		
		
		

}
