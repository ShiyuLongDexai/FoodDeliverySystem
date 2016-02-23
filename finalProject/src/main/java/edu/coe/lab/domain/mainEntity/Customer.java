package edu.coe.lab.domain.mainEntity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import edu.coe.lab.domain.user.User;

@Entity
public class Customer {
	@Id
	@GeneratedValue
	private int id;
	@Column(length=30)
	private String Name;
//	@Column(length=30)
//	private String MiddleName;
//	@Column(length=30)
//	private String LastName;
	@ManyToOne(cascade=CascadeType.ALL)
	private User user;
	public CreditCard getCreditCard() {
		return creditCard;
	}
	public void setCreditCard(CreditCard creditCard) {
		this.creditCard = creditCard;
	}
	@ManyToOne(cascade=CascadeType.ALL)
	private Address address;
	@ManyToOne(cascade=CascadeType.ALL)
	private CreditCard creditCard;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	
}
