package edu.coe.lab.domain.mainEntity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

import edu.coe.lab.domain.user.User;

@Entity
public class Restaurant {
	@Id
	@GeneratedValue
	private int id;
	@Column(length = 30)
	private String name;
	@ManyToOne(cascade = CascadeType.ALL)
	private Address address;
	@Column(length = 200)
	private String discription;
	@Column(length = 20)
	private String restaurantType;
	@Column(name = "COVER_PHOTO")
	@Lob
	private byte[] coverPhoto;
	@ManyToOne(cascade=CascadeType.ALL)
	private User user;
	@Column(length = 50)
	private String deliverZipcode;
	
	private double avgRating;
	
	private int reviewsNo;
	
	public int getReviewsNo() {
		return reviewsNo;
	}
	public void setReviewsNo(int reviewsNo) {
		this.reviewsNo = reviewsNo;
	}
	public double getAvgRating() {
		return avgRating;
	}
	public void setAvgRating(double avgRating) {
		this.avgRating = avgRating;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDeliverZipcode() {
		return deliverZipcode;
	}
	public void setDeliverZipcode(String deliverZipcode) {
		this.deliverZipcode = deliverZipcode;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public String getDiscription() {
		return discription;
	}
	public void setDiscription(String discription) {
		this.discription = discription;
	}
	
	public String getRestaurantType() {
		return restaurantType;
	}
	public void setRestaurantType(String restaurantType) {
		this.restaurantType = restaurantType;
	}
	public byte[] getCoverPhoto() {
		return coverPhoto;
	}
	public void setCoverPhoto(byte[] coverPhoto) {
		this.coverPhoto = coverPhoto;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	

	// private Set<Dish> dishs = new HashSet<Dish>;

}
