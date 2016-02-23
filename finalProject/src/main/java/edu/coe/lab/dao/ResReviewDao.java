package edu.coe.lab.dao;

import java.util.List;

import edu.coe.lab.domain.Review.RestaurantReview;

public interface ResReviewDao {
public void addResReview(RestaurantReview rr);
public List<RestaurantReview> getResReviewByCustomer(int id);
public List<RestaurantReview> getResReviewByRestaurant(int id);
public RestaurantReview getResReview(int id);
public void update(RestaurantReview r);
public void delete(RestaurantReview r);

}
