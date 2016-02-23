package edu.coe.lab.service;

import java.util.ArrayList;

import edu.coe.lab.domain.mainEntity.Dish;


public interface DishService {
public void addDish(Dish d);
public void deleteDish(Dish d);
public Dish getDish(int id);
public ArrayList<Dish> getDishByRes(int id);
}
