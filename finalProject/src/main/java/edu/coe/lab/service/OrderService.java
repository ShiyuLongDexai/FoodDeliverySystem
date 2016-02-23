package edu.coe.lab.service;

import java.util.List;

import edu.coe.lab.domain.order.FoodOrder;


public interface OrderService {
public void addOrder(FoodOrder fo);
public void deleteOrder(FoodOrder fo);
public FoodOrder getOrder(int id);
public void updateOrder(FoodOrder fo);
//res
public List<FoodOrder> ListOrdersByCus(int id);
public List<FoodOrder> ListOrder();
public List<FoodOrder> ListOrderByCusUD(int id);
public List<FoodOrder> ListOrderByCusD(int id);
//res
public List<FoodOrder> ListOrderByRes(String name);
public List<FoodOrder> ListOrderByResUD(String name);
public List<FoodOrder> ListOrderByResDing(String name);
public List<FoodOrder> ListOrderByResDed(String name);

}
