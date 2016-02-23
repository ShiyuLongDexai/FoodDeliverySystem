package edu.coe.lab.domain.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user") //uniqueConstraints=@UniqueConstraint(columnNames={"USER_NAME", "PASS_WORD"})//
public class User {

//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name="USER_ID", unique=true, nullable=false)
//	private Integer userId;
	@Id
	@Column(name="USER_NAME", unique=true, nullable=false, length=30)
	private String username;
	
	@Column(name="PASS_WORD", nullable=false, length=30)
	private String password;
	
	@Column(name="role", length=10)
	private String role;
	
	
	
	
	
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
}
