package edu.coe.lab.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.coe.lab.dao.ResReviewDao;
import edu.coe.lab.dao.RestaurantDao;
import edu.coe.lab.domain.Review.RestaurantReview;
import edu.coe.lab.domain.mainEntity.Restaurant;

@Service
public class RestaurantServiceImpl implements RestaurantService{
	@Resource
	private RestaurantDao restaurantDao;
	@Resource
	private ResReviewDao resReviewDao;
	
	@Override
	@Transactional
	public void addRestaurant(Restaurant r) {
		System.out.println("service"+r.getName());
		restaurantDao.addRestaurant(r);
		
	}

	@Override
	@Transactional
	public Restaurant getRestaurantByUsername(String username) {
		Restaurant r = restaurantDao.getResbyUsername(username);
		return r;
	}

	@Override
	@Transactional
	public void update(Restaurant r) {
          restaurantDao.updateRes(r);		
	}
	
	@Override
	@Transactional
	public List<Restaurant> listRes() {
		return restaurantDao.getRestaurants();
	}

	@Override
	@Transactional
	public List<Restaurant> findRes(String name) {
		List<Restaurant> restaurants = listRes();
		List<Restaurant> newReses= new ArrayList<Restaurant>();
		for (Restaurant r:restaurants){
			if(r.getName().contains(name)){
				newReses.add(r);
			}
		}
		return newReses;
	}

	@Override
	@Transactional
	public List<Restaurant> sortByName() {
		
		return restaurantDao.getResSortByName();
	}

	@Override
	@Transactional
	public List<Restaurant> sortByType() {
		// TODO Auto-generated method stub
		return restaurantDao.getResSortByType();
	}

	@Override
	@Transactional
	public Restaurant getRes(int id) {
		// TODO Auto-generated method stub
		return restaurantDao.getRes(id);
	}

	@Override
	@Transactional
	public double getAvgRating(Restaurant r) {
		List<RestaurantReview> rrs=resReviewDao.getResReviewByRestaurant(r.getId());
		double avgRating = 0;
		double total=0;
		if(rrs.size()!=0){
			for(RestaurantReview rr:rrs){
				total+=rr.getRating();
			}
			avgRating=total/rrs.size();	
			return Double.parseDouble(String.format("%.1f", avgRating));
		}else{
			return 0;
		}
	
	}

	@Override
	@Transactional
	public List<Restaurant> sortByRating() {
		// TODO Auto-generated method stub
		return restaurantDao.getResSortByRating();
	}

	@Override
	@Transactional
	public List<Restaurant> topRestaurants() {
		if(restaurantDao.getResSortByRating().size()<=6){
			return restaurantDao.getResSortByRating();
		}
		else{
		 return restaurantDao.getResSortByRating().subList(0, 6);
		}
	}

	@Override
	public List<Restaurant> listResWithZipCode(List<Restaurant> restaurants,
			String zipcode) {
                List<Restaurant> result = new ArrayList<Restaurant>();
                for(Restaurant r: restaurants){
                	String zip = r.getDeliverZipcode();
                	if(r.getDeliverZipcode()!=null&&r.getDeliverZipcode().contains(zipcode)){
                		result.add(r);
                	}
                }

		return result;
	}
	
	
	

}
