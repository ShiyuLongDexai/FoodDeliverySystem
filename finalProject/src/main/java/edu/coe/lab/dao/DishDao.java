package edu.coe.lab.dao;

import java.util.List;

import edu.coe.lab.domain.mainEntity.Dish;

public interface DishDao {
public void add(Dish d);
public void delete (Dish d);
public Dish getDish(int id);
public List<Dish> getDishByRes(int resId);

}
