package edu.coe.lab.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.coe.lab.dao.DishDao;
import edu.coe.lab.domain.mainEntity.Dish;

@Service
public class DishServiceImpl implements DishService {
	@Resource
	private DishDao dishDao;

	@Override
	@Transactional
	public void addDish(Dish d) {
		dishDao.add(d);

	}

	@Override
	@Transactional
	public void deleteDish(Dish d) {
		dishDao.delete(d);

	}

	@Override
	@Transactional
	public Dish getDish(int id) {
		return dishDao.getDish(id);

	}
	//

	@Override
	@Transactional
	public ArrayList<Dish> getDishByRes(int id) {
		List l =dishDao.getDishByRes(id);
		ArrayList <Dish> menu = new ArrayList<Dish>();
		for(Object o :l){
			Dish d = (Dish)o;
			menu.add(d);
		}
//		System.out.println("Service "+menu.get(0).getName());
		return menu;
	}
}
