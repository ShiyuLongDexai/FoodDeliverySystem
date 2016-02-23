package edu.coe.lab.domain.mainEntity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

@Entity
public class Dish {
	@Id
	@GeneratedValue
private int id;
	@Column(length=50)
private String name;
	@Column(length=200)
private String disc;
private double price;
@Column(length=20)
private String category;
@Column(name="COVER_PHOTO")
@Lob private byte[] coverPhoto;
@ManyToOne(cascade=CascadeType.MERGE)
private Restaurant res;
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
public String getDisc() {
	return disc;
}
public void setDisc(String disc) {
	this.disc = disc;
}
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}
public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}
public byte[] getCoverPhoto() {
	return coverPhoto;
}
public void setCoverPhoto(byte[] coverPhoto) {
	this.coverPhoto = coverPhoto;
}
public Restaurant getRes() {
	return res;
}
public void setRes(Restaurant res) {
	this.res = res;
}

}
