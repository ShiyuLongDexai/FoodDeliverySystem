package edu.coe.lab.domain.order;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import edu.coe.lab.domain.mainEntity.Address;
import edu.coe.lab.domain.mainEntity.CreditCard;
import edu.coe.lab.domain.mainEntity.Customer;

@Entity
public class FoodOrder {
	
	@OneToMany(fetch=FetchType.LAZY,mappedBy = "foodOrder", cascade = CascadeType.ALL)
	@JsonManagedReference
	private Set<OrderItem> orders = new HashSet<OrderItem>();
	@ManyToOne(cascade = CascadeType.ALL)
	private Customer customer;
	@Id
	@GeneratedValue
	private int orderId;
	@ManyToOne(cascade = CascadeType.ALL)
	private Address address;
	@Column(length = 30)
	private String status;
	@Column(length = 30)
	private String payment;
	@ManyToOne(cascade = CascadeType.ALL)
	private CreditCard creditCard;
	private double totalPrice;
	private Date deliveryTime;
	@Column(length = 30)
	private String resName;


	public String getResName() {
		return resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Date getDeliveryTime() {
		return deliveryTime;
	}

	public void setDeliveryTime(Date deliveryTime) {
		this.deliveryTime = deliveryTime;
	}

	public CreditCard getCreditCard() {
		return creditCard;
	}

	public void setCreditCard(CreditCard creditCard) {
		this.creditCard = creditCard;
	}

	private Date date;

	public Set<OrderItem> getOrders() {
		return orders;
	}

	public void setOrders(Set<OrderItem> orders) {
		this.orders = orders;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	// public Set<OrderItem> getOrders() {
	// return orders;
	// }
	// public void setOrders(Set<OrderItem> orders) {
	// this.orders = orders;
	// }
	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public void updateCartDish(String dishId, String qty) {
		OrderItem temp = null;
		for (OrderItem oi : orders) {
			if (oi.getDish().getId() == Integer.parseInt(dishId)) {
				// System.out.println("oi id "+oi.getId());
				if (Integer.parseInt(qty) != 0) {
					oi.setQuantity(Integer.parseInt(qty));
				}
				// System.out.println("oi qty "+oi.getQuantity());
				else {
					temp = oi;
				}
			}
		}
		if (temp != null) {
			orders.remove(temp);
		}
	}
}
