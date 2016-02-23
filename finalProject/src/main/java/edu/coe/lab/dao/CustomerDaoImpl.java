package edu.coe.lab.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.coe.lab.domain.mainEntity.Customer;

@Repository("customerDao")
public class CustomerDaoImpl implements CustomerDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addCustomer(Customer c) {

		Session s = sessionFactory.getCurrentSession();

		s.save(c);
		s.flush();

	}

	@Override
	public Customer getCusbyUsername(String username) {
Session session=sessionFactory.getCurrentSession();
		
		Query query=session.createQuery("from Customer where user_USER_NAME=:name");
		 query.setString("name", username); 
		List list=query.list();
		
		Customer r = (Customer) list.get(0);
		System.out.println(r.getId());
	      return r;
	}

	@Override
	public void updateCus(Customer c) {
		Session session=sessionFactory.getCurrentSession();
		session.update(c);
		session.flush();
		
	}

}
