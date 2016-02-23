package edu.coe.lab.domain.mainEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class CreditCard {
	@Id
	@GeneratedValue
	private int id;
	@Column(length = 30)
	private String cardNo;
	@Column(length = 30)
	private String name;
	@Column(length = 6)
	private String expirationDate;
	@Column(length = 30)
	private String vin;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getExpirationDate() {
		return expirationDate;
	}
	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}
	public String getVin() {
		return vin;
	}
	public void setVin(String vin) {
		this.vin = vin;
	}
	
}
