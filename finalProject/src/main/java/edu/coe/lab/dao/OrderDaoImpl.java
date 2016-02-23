package edu.coe.lab.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.coe.lab.domain.order.FoodOrder;
@Repository
public class OrderDaoImpl implements OrderDao{
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public void addOrder(FoodOrder fo) {
//		for(OrderItem oi:fo.getOrders()){
//		sessionFactory.getCurrentSession().merge(oi.getDish().getRes());
//		System.out.println("Res "+ oi.getDish().getRes().getName()+" merged");
//				}
//		getHibernateTemplate().merge(user)
//		FoodOrder foodOrder = (FoodOrder) sessionFactory.getCurrentSession().merge(fo);
		sessionFactory.getCurrentSession().save(fo);
		sessionFactory.getCurrentSession().flush();
		
	}

	@Override
	public void deleteOrder(FoodOrder fo) {
		sessionFactory.getCurrentSession().delete(fo);
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	public void updateOrder(FoodOrder fo) {
		sessionFactory.getCurrentSession().update(fo);
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	public FoodOrder getOrder(int id) {
		Session s = sessionFactory.getCurrentSession();
		FoodOrder d = (FoodOrder) s.get(FoodOrder.class, id);
		return d;
		
	}

	@Override
	public List<FoodOrder> ListOrderByCustomer(int id) {
Session session=sessionFactory.getCurrentSession();
		
		Query query=session.createQuery("from FoodOrder where customer_id=:customerId order by deliveryTime desc");
//		 query.setString("resid", String.valueOf(resId)); 
		 query.setInteger("customerId", id);
		List<FoodOrder> list=query.list();
		return list;
	}

	@Override
	public List<FoodOrder> ListOrder() {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from FoodOrder");
		List<FoodOrder> list=query.list();
		return list;
	}

	@Override
	public List<FoodOrder> ListOrderByRestaurant(String name) {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from FoodOrder where resName=:resName");
//		 query.setString("resid", String.valueOf(resId)); 
		 query.setString("resName", name);
		List<FoodOrder> list=query.list();
		return list;
	}

}
