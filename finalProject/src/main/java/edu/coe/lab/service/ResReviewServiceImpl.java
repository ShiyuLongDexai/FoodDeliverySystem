package edu.coe.lab.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.coe.lab.dao.ResReviewDao;
import edu.coe.lab.domain.Review.RestaurantReview;
@Service
public class ResReviewServiceImpl implements ResReviewService{
@Resource
private ResReviewDao resReviewDao;
	@Override
	@Transactional
	public void addResReview(RestaurantReview rr) {
		resReviewDao.addResReview(rr);
		
	}
	@Override
	@Transactional
	public List<RestaurantReview> resReviewListByCus(int id) {
		return resReviewDao.getResReviewByCustomer(id);
		
	}
	@Override
	@Transactional
	public List<RestaurantReview> resReviewListByRes(int id) {
//		System.out.println(id+" ID");
//		for(RestaurantReview rr:resReviewDao.getResReviewByRestaurant(id)){
//			System.out.println(rr+" rr");
//		}
		// TODO Auto-generated method stub
		return resReviewDao.getResReviewByRestaurant(id);
	}
	@Override
	@Transactional
	public RestaurantReview getResReview(int id) {
		// TODO Auto-generated method stub
		return resReviewDao.getResReview(id);
	}
	@Override
	@Transactional
	public void update(RestaurantReview r) {
		resReviewDao.update(r);
		
	}
	@Override
	@Transactional
	public void delete(RestaurantReview r) {
		resReviewDao.delete(r);
		
	}

}
