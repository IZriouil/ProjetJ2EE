package entity;

import java.util.List;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Question {
	
	public Question() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Id @GeneratedValue
	protected int idQuestion;
	@ManyToOne
	private QCM controle;
	protected String Enonce; 
	@ElementCollection(fetch = FetchType.EAGER)
	protected List<String> reponses;
	@ElementCollection(fetch = FetchType.EAGER)
	protected List<String> reponsesJuste; 
	
	public Question( QCM controle, String enonce,
			List<String> reponses, List<String> reponsesJuste) {
		super();
		this.controle = controle;
		Enonce = enonce;
		this.reponses = reponses;
		this.reponsesJuste = reponsesJuste;
	}
	
	public int getIdQuestion() {
		return idQuestion;
	}
	public void setIdQuestion(int idQuestion) {
		this.idQuestion = idQuestion;
	}
	public QCM getControle() {
		return controle;
	}
	public void setControle(QCM controle) {
		this.controle = controle;
	}
	public List<String> getReponsesJuste() {
		return reponsesJuste;
	}
	public void setReponsesJuste(List<String> reponsesJuste) {
		this.reponsesJuste = reponsesJuste;
	}

	public String getEnonce() {
		return Enonce;
	}
	public void setEnonce(String enonce) {
		Enonce = enonce;
	}
	
	public List<String> getReponses() {
		return reponses;
	}
	public void setReponses(List<String> reponses) {
		this.reponses = reponses;
	}

}
