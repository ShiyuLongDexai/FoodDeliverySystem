package edu.coe.lab;

import javax.annotation.Resource;

import edu.coe.lab.dao.UserDao;

public class UserTest {
	@Resource(name="userDao")
	private static UserDao userDao;
	
	public static void main(String args[]) {
		
//		String s = userDao.addUser(u);
//		return s;
//		// Configuration config = new
		// Configuration().configure("hibernate.cfg.xml");
		// SessionFactory sf = config.buildSessionFactory();
//		Session session = 
//		session.beginTransaction();
//		User user = new User();
//		// user.setUsername("Hechen2");
//		// user.setPassword("Gao2");
		//
		// UserDetail detail = new UserDetail();
		// detail.setDetail("Some detail2");
		//
		// user.setUserDetail(detail);
		// detail.setUser(user);
		//
		// session.save(user);
		//
		// session.getTransaction().commit();
		//
		// User user = (User)session.get(User.class, 1);
		// System.out.println(user);
		// //session.delete(user);
		// session.getTransaction().commit();
//		session.close();
//		sf.close();
	}

}
