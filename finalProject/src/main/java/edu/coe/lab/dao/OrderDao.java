package edu.coe.lab.dao;

import java.util.List;

import edu.coe.lab.domain.order.FoodOrder;

public interface OrderDao {
public void addOrder(FoodOrder fo);
public void deleteOrder(FoodOrder fo);
public void updateOrder(FoodOrder fo);
public FoodOrder getOrder(int id);
public List<FoodOrder> ListOrderByCustomer(int id);
public List<FoodOrder> ListOrder();
public List<FoodOrder> ListOrderByRestaurant(String name);
}
