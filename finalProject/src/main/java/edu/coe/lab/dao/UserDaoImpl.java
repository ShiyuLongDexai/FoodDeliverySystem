package edu.coe.lab.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.coe.lab.domain.user.User;

@Repository("userDao")
public class UserDaoImpl implements UserDao {

	// @Autowired
	// private SessionFactory sf;

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addUser(User u) {
		// TODO Auto-generated method stub

		Session s = sessionFactory.getCurrentSession();
		
		s.save(u);
		s.flush();
		
	}

	@Override
	public void deleteUser(User u) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().delete(u);
//		System.out.println(u2.getPassword());
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	public User getUser(String username) {
		// String hql = "FROM User U WHERE U.USER_NAME =";
		// Query query = sf.getCurrentSession().createQuery(hql+username);
		// List results = query.list();
		// User u = (User) results.get(0);
		// Session s = SessionFactoryUtils.getSession(sessionFactory, false);
		Session s = sessionFactory.getCurrentSession();
		// s.beginTransaction();
		User u = (User) s.get(User.class, username);
		// s.getTransaction().commit();
		return u;
	}

	@Override
	public List<User> getUsers() {
		String hql = "from User";  
        Query query = sessionFactory.getCurrentSession().createQuery(hql);  
          
        return query.list();  
		
	}

}
