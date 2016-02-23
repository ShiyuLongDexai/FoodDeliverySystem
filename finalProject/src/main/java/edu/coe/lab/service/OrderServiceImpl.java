package edu.coe.lab.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.coe.lab.dao.OrderDao;
import edu.coe.lab.domain.order.FoodOrder;
@Service
public class OrderServiceImpl implements OrderService{
	@Resource
	private OrderDao orderDao;

	@Override
	@Transactional
	public void addOrder(FoodOrder fo) {
		
		orderDao.addOrder(fo);		
	}

	@Override
	@Transactional
	public void deleteOrder(FoodOrder fo) {
		orderDao.deleteOrder(fo);
		
	}

	@Override
	@Transactional
	public FoodOrder getOrder(int id) {
		
		return orderDao.getOrder(id);
	}

	@Override
	@Transactional
	public void updateOrder(FoodOrder fo) {
		orderDao.updateOrder(fo);
		
	}

	@Override
	@Transactional
	public List<FoodOrder> ListOrdersByCus(int id) {
		
		return orderDao.ListOrderByCustomer(id);
	}

	@Override
	@Transactional
	public List<FoodOrder> ListOrder() {
		return orderDao.ListOrder();
		
	}

	@Override
	@Transactional
	public List<FoodOrder> ListOrderByCusUD(int id) {
		List<FoodOrder> list = new ArrayList<FoodOrder>();
		for(FoodOrder fo:ListOrdersByCus(id)){
			if(fo.getStatus().equals("undelivered")||fo.getStatus().equals("delivering")){
				list.add(fo);
			}
		}
		return list;
	}

	@Override
	@Transactional
	public List<FoodOrder> ListOrderByCusD(int id) {
		List<FoodOrder> list = new ArrayList<FoodOrder>();
		for(FoodOrder fo:ListOrdersByCus(id)){
			if(fo.getStatus().equals("delivered")){
				list.add(fo);
			}
		}
		return list;
	}

	@Override
	@Transactional
	public List<FoodOrder> ListOrderByRes(String name) {
		
		return orderDao.ListOrderByRestaurant(name);
	}

	@Override
	@Transactional
	public List<FoodOrder> ListOrderByResUD(String name) {
		List<FoodOrder> list = new ArrayList<FoodOrder>();
		for(FoodOrder fo:ListOrderByRes(name)){
			if(fo.getStatus().equals("undelivered")){
				list.add(fo);
			}
		}
		return list;
	}

	@Override
	@Transactional
	public List<FoodOrder> ListOrderByResDing(String name) {
		List<FoodOrder> list = new ArrayList<FoodOrder>();
		for(FoodOrder fo:ListOrderByRes(name)){
			if(fo.getStatus().equals("delivering")){
				list.add(fo);
			}
		}
		return list;
	}

	@Override
	@Transactional
	public List<FoodOrder> ListOrderByResDed(String name) {
		List<FoodOrder> list = new ArrayList<FoodOrder>();
		for(FoodOrder fo:ListOrderByRes(name)){
			if(fo.getStatus().equals("delivered")){
				list.add(fo);
			}
		}		
		return list;
	}

}
