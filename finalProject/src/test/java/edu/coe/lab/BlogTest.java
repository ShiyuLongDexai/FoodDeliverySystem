package edu.coe.lab;

import java.util.HashSet;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;

import edu.coe.lab.domain.Blog;
import edu.coe.lab.domain.Category;
import edu.coe.lab.domain.user.User;

public class BlogTest {

	public static void main(String args[]) {
		Configuration config = new AnnotationConfiguration().configure();
		SessionFactory sf = config.buildSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		User user = (User)session.get(User.class, 1);
		Blog b1 = new Blog();
		b1.setUser(user);
		b1.setContent("blog example for cat1");
		Blog b2 = new Blog();
		b2.setUser(user);
		b2.setContent("blog example for cat1");
		
		Category cat1 = new Category();
		cat1.setName("cat1");
		Category cat2 = new Category();
		cat2.setName("cat2");
		Set<Category> categories = new HashSet<Category>();
		categories.add(cat1);
		categories.add(cat2);
		
		b1.setCategories(categories);
		b2.setCategories(categories);
		
		session.save(b1);
		session.save(b2);
		
		session.getTransaction().commit();
		session.close();
		sf.close();
	}
	
}
