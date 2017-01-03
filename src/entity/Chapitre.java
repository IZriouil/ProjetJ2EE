package entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;



@Entity
public class Chapitre {
	
	@Id @GeneratedValue
	private int id;
	protected String titre;
	@OneToOne
	private QCM controle;
	@ManyToOne(targetEntity=Module.class)
	@JoinColumn(name="id_module")
	private Module module;
	private String text;
	
	
	public Chapitre() {
		super();
	}

	public Chapitre(String titre,  Module module, String text) {
		super();
		this.titre = titre;
		
		this.module = module;
		this.text = text;
	}
	
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public QCM getControle() {
		return controle;
	}
	public void setControle(QCM controle) {
		this.controle = controle;
	}
	public Module getModule() {
		return module;
	}
	public void setModule(Module module) {
		this.module = module;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	
	

}
