package edu.coe.lab.service;

import java.util.List;

import edu.coe.lab.domain.Review.RestaurantReview;

public interface ResReviewService {
public void addResReview(RestaurantReview rr);
public List<RestaurantReview> resReviewListByCus(int id);
public List<RestaurantReview> resReviewListByRes(int id);
public RestaurantReview getResReview(int id);
public void update(RestaurantReview r);
public void delete(RestaurantReview r);
}
