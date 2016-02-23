package edu.coe.lab.domain.Review;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import edu.coe.lab.domain.mainEntity.Customer;
import edu.coe.lab.domain.mainEntity.Restaurant;

@Entity
public class RestaurantReview {
	@Id
	@GeneratedValue
	private int id;
	@Column(length = 200)
	private String content;
	private int rating;

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	@ManyToOne(cascade = CascadeType.MERGE)
	private Customer customer;
	@ManyToOne(cascade = CascadeType.ALL)
	private Restaurant restaurant;
	private Date date;

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

	public Restaurant getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(Restaurant restaurant) {
		this.restaurant = restaurant;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
