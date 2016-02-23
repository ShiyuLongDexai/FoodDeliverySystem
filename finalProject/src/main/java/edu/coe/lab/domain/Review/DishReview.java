package edu.coe.lab.domain.Review;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import edu.coe.lab.domain.mainEntity.Customer;
import edu.coe.lab.domain.mainEntity.Dish;
@Entity
@Table(name="dishReview")
public class DishReview {
	@Id
	@GeneratedValue
private int id;
	@Column(length = 200)
private String content;
	@ManyToOne( cascade=CascadeType.ALL)
	@JoinColumn(name="customer_Id") 
private Customer customer;
	@ManyToOne( cascade=CascadeType.ALL)
	@JoinColumn(name="dish_Id") 
private Dish dish;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Dish getDish() {
		return dish;
	}
	public void setDish(Dish dish) {
		this.dish = dish;
	}
	
}
