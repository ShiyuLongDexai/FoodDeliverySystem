package edu.coe.lab.domain.order;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonBackReference;

import edu.coe.lab.domain.mainEntity.Dish;
@Entity
public class OrderItem {
	@Id
	@GeneratedValue
	private int id;
	@ManyToOne(cascade=CascadeType.ALL)
	 private Dish dish;
	
	 private int quantity;
	 
	 @ManyToOne( fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	@JoinColumn(name="Order_ID", nullable=false)
	 @JsonBackReference
	 private FoodOrder foodOrder;
	public int getId() {
		return id;
	}

	public FoodOrder getFoodOrder() {
		return foodOrder;
	}

	public void setFoodOrder(FoodOrder foodOrder) {
		this.foodOrder = foodOrder;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Dish getDish() {
		return dish;
	}

	public void setDish(Dish dish) {
		this.dish = dish;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	    
	   
}
