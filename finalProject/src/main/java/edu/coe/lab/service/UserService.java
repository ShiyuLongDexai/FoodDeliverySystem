package edu.coe.lab.service;

import edu.coe.lab.domain.user.User;

public interface UserService {
public void addUser(User u);
public void removeUser(User u);
public User getUser(String username);
public String validUser(User u);

}
