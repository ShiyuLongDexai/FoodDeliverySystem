package edu.coe.lab.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.coe.lab.domain.mainEntity.Dish;
@Repository
public class DishDaoImpl implements DishDao{
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public void add(Dish d) {
		Session s = sessionFactory.getCurrentSession();
		//System.out.println("dao "+r.getName());
		s.save(d);
		s.flush();
		
	}

	@Override
	public void delete(Dish d) {
		Session s = sessionFactory.getCurrentSession();
		//System.out.println("dao "+r.getName());
		s.delete(d);
	
		s.flush();
		
	}

	@Override
	public Dish getDish(int id) {
		Session s = sessionFactory.getCurrentSession();
		Dish d = (Dish) s.get(Dish.class, id);
		return d;
	}

	@Override
	public List<Dish> getDishByRes(int resId) {
Session session=sessionFactory.getCurrentSession();
		
		Query query=session.createQuery("from Dish where res_id=:resid");
//		 query.setString("resid", String.valueOf(resId)); 
		 query.setInteger("resid", resId);
		List list=query.list();
		
		
//		System.out.println("FirstDishName"+((Dish)list.get(0)).getName());
	     
		return list;
	}

}
