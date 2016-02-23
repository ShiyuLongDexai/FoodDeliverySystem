package edu.coe.lab.service;

import java.util.List;

import edu.coe.lab.domain.mainEntity.Restaurant;

public interface RestaurantService {
public void addRestaurant(Restaurant r);
public Restaurant getRestaurantByUsername(String username);
public void update(Restaurant r);
public List<Restaurant> listRes() ;
public List<Restaurant> findRes(String name);
public List<Restaurant> sortByName();
public List<Restaurant> sortByType();
public List<Restaurant> sortByRating();
public Restaurant getRes(int id);
public double getAvgRating(Restaurant r);
public List<Restaurant> topRestaurants();
public List<Restaurant> listResWithZipCode(List<Restaurant> restaurants,String zipcode);
}
