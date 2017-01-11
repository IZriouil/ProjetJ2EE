package entity;

import javax.persistence.AttributeOverride;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;


@Entity
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="TYPE" )
@DiscriminatorValue("Admin")

@AttributeOverride(name="TYPE", 
	column = @Column(name="TYPE", nullable=false,
	insertable = false, updatable = false))
public class Utilisateur {
	
	@Id
	private String id;
	@Column(name="mdp",nullable=false)
	private String password;
	
	@Column(name="type",nullable=false)
	private String TYPE;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getType() {
		return TYPE;
	}
	public void setType(String type) {
		this.TYPE = type;
	}
}
