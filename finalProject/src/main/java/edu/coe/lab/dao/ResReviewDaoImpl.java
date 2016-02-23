package edu.coe.lab.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.coe.lab.domain.Review.RestaurantReview;
@Repository
public class ResReviewDaoImpl implements ResReviewDao{
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public void addResReview(RestaurantReview rr) {
		// TODO Auto-generated method stub
		Session s = sessionFactory.getCurrentSession();
		s.save(rr);
		s.flush();
	}
	@Override
	public List<RestaurantReview> getResReviewByCustomer(int id) {
Session session=sessionFactory.getCurrentSession();
		
		Query query=session.createQuery("from RestaurantReview where customer_id=:cusid");
		 query.setString("cusid", String.valueOf(id)); 
		List<RestaurantReview> list=query.list();
		
		
		return list;
	}
	@Override
	public List<RestaurantReview> getResReviewByRestaurant(int id) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from RestaurantReview where restaurant_id=:cusid");
		 query.setString("cusid", String.valueOf(id)); 
		List<RestaurantReview> list=query.list();
		
		
		return list;
	}
	@Override
	public RestaurantReview getResReview(int id) {
		
		return (RestaurantReview)sessionFactory.getCurrentSession().get(RestaurantReview.class, id);
	}
	@Override
	public void update(RestaurantReview r) {
		sessionFactory.getCurrentSession().update(r);
		sessionFactory.getCurrentSession().flush();
	}
	@Override
	public void delete(RestaurantReview r) {
		sessionFactory.getCurrentSession().delete(r);
		sessionFactory.getCurrentSession().flush();
	}

}
