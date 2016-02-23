package edu.coe.lab.service;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.Entity;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.coe.lab.dao.UserDao;
import edu.coe.lab.domain.user.User;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource(name = "userDao")
	private UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	@Transactional
	public void removeUser(User u) {
		userDao.deleteUser(u);
	}

	@Override
	@Transactional
	public void addUser(User u) {
		System.out.println("service" + u.getUsername());
		userDao.addUser(u);

	}

	@Override
	@Transactional
	public User getUser(String username) {
		return userDao.getUser(username);

	}

	@Override
	public String validUser(User u) {
//		List<User> users = userDao.getUsers();
		User uvalid =userDao.getUser(u.getUsername());
		if(uvalid==null){
			return null;
		}else{
		String pass = uvalid.getPassword();
//		System.out.println("uv "+pass);
//		System.out.println("u "+u.getPassword());
//		System.out.println("ur "+uvalid.getRole());
		if(pass.equals(u.getPassword())){
			return uvalid.getRole();
		}
		return null;}
	}
}
