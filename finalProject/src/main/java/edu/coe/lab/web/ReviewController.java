package edu.coe.lab.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.coe.lab.domain.Review.RestaurantReview;
import edu.coe.lab.domain.mainEntity.Customer;
import edu.coe.lab.domain.mainEntity.Restaurant;
import edu.coe.lab.service.ResReviewService;

@Controller
public class ReviewController {
@Resource
private ResReviewService resReviewService;
@RequestMapping("CusReviews")
public String cusReviews(@RequestParam(value = "rating", required = false) String rating,
		@RequestParam(value = "reviewContent", required = false) String reviewContent,
		@RequestParam(value = "resReviewId", required = false) String resReviewId,
		@RequestParam(value = "deleteId", required = false) String deleteId,
		HttpSession s,
		Model model){
	if(resReviewId!=null){
		RestaurantReview r = resReviewService.getResReview(Integer.parseInt(resReviewId));
		if(reviewContent!=null){
			int ra = (int)Double.parseDouble(rating)*2;
			r.setRating(ra);
			r.setContent(reviewContent);
			resReviewService.update(r);
		}
		model.addAttribute("review", r);
		
	}
	if(deleteId!=null){
		RestaurantReview r = resReviewService.getResReview(Integer.parseInt(deleteId));
		r.setCustomer(null);
		r.setRestaurant(null);
		resReviewService.delete(resReviewService.getResReview(Integer.parseInt(deleteId)));
	}
//	if (reviewContent != null) {
//		RestaurantReview rreview = new RestaurantReview();
//		rreview.setContent(reviewContent);
//		rreview.setRating(Integer.parseInt(rating));
////		System.out.println("rating added");
////		System.out.println(resId);
//		
//		rreview.setRestaurant(r);
////		System.out.println("restaurant added");
//		rreview.setCustomer((Customer) s.getAttribute("cus"));
//		rreview.setDate(new Date(System.currentTimeMillis()));
////		System.out.println("customer added");
//		resReviewService.addResReview(rreview);
//
//	}
	
	
	model.addAttribute("restaurantReviews", 
			resReviewService.resReviewListByCus(((Customer)s.getAttribute("cus")).getId()));
	return "CusReviews";
}

@RequestMapping("ResReviews")
public String resReview(Model model, HttpSession s){
	Restaurant r = (Restaurant) s.getAttribute("res");
	model.addAttribute("restaurantReviews", resReviewService.resReviewListByRes(r.getId()));
	return "ResReviews";
}
}
