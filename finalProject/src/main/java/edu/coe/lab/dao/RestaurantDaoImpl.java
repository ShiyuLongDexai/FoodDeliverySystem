package edu.coe.lab.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.coe.lab.domain.mainEntity.Restaurant;

@Repository("restaurantDao")
public class RestaurantDaoImpl implements RestaurantDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addRestaurant(Restaurant r) {

		Session s = sessionFactory.getCurrentSession();
		//System.out.println("dao "+r.getName());
//		s.merge(r);
		s.save(r);
		s.flush();
		//System.out.println("res saved");

	}

	@Override
	public Restaurant getResbyUsername(String username) {
		Session session=sessionFactory.getCurrentSession();
		
		Query query=session.createQuery("from Restaurant where user_USER_NAME=:name");
		 query.setString("name", username); 
		List list=query.list();
		
		Restaurant r = (Restaurant) list.get(0);
//		System.out.println(r.getId());
	      return r;
		
	}

	@Override
	public void updateRes(Restaurant r) {
		Session session=sessionFactory.getCurrentSession();
		session.update(r);
		session.flush();
	}

	@Override
	public List<Restaurant> getRestaurants() {
	
return sessionFactory.getCurrentSession().createQuery("from Restaurant").list();
		
	}

	@Override
	public List<Restaurant> getResSortByName() {
		return sessionFactory.getCurrentSession().createQuery("from Restaurant order by name").list();
		
	}

	@Override
	public List<Restaurant> getResSortByType() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from Restaurant order by restaurantType").list();
	}

	@Override
	public Restaurant getRes(int id) {
		Session s = sessionFactory.getCurrentSession();
		Restaurant r = (Restaurant) s.get(Restaurant.class, id);
		return r;
	}

	@Override
	public List<Restaurant> getResSortByRating() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from Restaurant order by avgRating desc").list();
	}

}
