package edu.coe.lab.dao;

import java.util.List;

import edu.coe.lab.domain.mainEntity.Restaurant;

public interface RestaurantDao {
public void addRestaurant(Restaurant r);
public Restaurant getResbyUsername(String username);
public void updateRes(Restaurant r);
public List<Restaurant> getRestaurants();
public List<Restaurant> getResSortByName();
public List<Restaurant> getResSortByType();
public List<Restaurant> getResSortByRating();
public Restaurant getRes(int id);
}
