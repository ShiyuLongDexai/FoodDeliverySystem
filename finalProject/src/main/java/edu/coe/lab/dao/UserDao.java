package edu.coe.lab.dao;

import java.util.List;

import edu.coe.lab.domain.user.User;

public interface UserDao {
public void addUser(User u);
public void deleteUser(User u);
public User getUser(String username);
public List<User> getUsers();
}
