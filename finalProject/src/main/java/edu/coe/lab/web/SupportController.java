package edu.coe.lab.web;

import java.util.Date;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ValidationUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.coe.lab.domain.JsonResponse;
import edu.coe.lab.domain.Review.RestaurantReview;
import edu.coe.lab.domain.mainEntity.Customer;
import edu.coe.lab.domain.mainEntity.Dish;
import edu.coe.lab.domain.order.FoodOrder;
import edu.coe.lab.domain.order.OrderItem;
import edu.coe.lab.service.DishService;
import edu.coe.lab.service.ResReviewService;
import edu.coe.lab.service.RestaurantService;

@Controller
public class SupportController {
	@Resource
	private DishService dishService;
	@Resource
	private RestaurantService restaurantService;
	@Resource
	private ResReviewService resReviewService;

	@RequestMapping("FAQ")
	public String support() {
		return "homepage2CusFAQ";
	}

	@RequestMapping("Contact")
	public String contact() {
		return "contact";
	}

	@RequestMapping("About")
	public String about() {
		return "about";
	}

	@RequestMapping(value = "/ajaxtest", method = RequestMethod.GET)
	public @ResponseBody
	String getTime() {

		Random rand = new Random();
		float r = rand.nextFloat() * 100;
		String result = "<br>Next Random # is <b>" + r
				+ "</b>. Generated on <b>" + new Date().toString() + "</b>";
		System.out
				.println("Debug Message from CrunchifySpringAjaxJQuery Controller.."
						+ new Date().toString());
		return result;
	}

	@RequestMapping(value = "/AddToCart", method = RequestMethod.POST)
	public @ResponseBody
	JsonResponse addUser(
			@ModelAttribute(value = "orderItem") OrderItem orderItem,
			BindingResult result, HttpSession s) {
		JsonResponse res = new JsonResponse();
		ValidationUtils.rejectIfEmpty(result, "quantity",
				"quantity can not be empty.");
		if (!result.hasErrors()) {
			OrderItem oi = new OrderItem();
			oi.setDish(dishService.getDish(orderItem.getId()));
			oi.setQuantity(orderItem.getQuantity());
			FoodOrder cart = (FoodOrder) s.getAttribute("cart");
			cart.getOrders().add(oi);
			s.setAttribute("cart", cart);
			res.setStatus("SUCCESS");
			res.setResult(oi);
		} else {
			res.setStatus("FAIL");
			res.setResult(result.getAllErrors());
		}

		return res;
	}

	@RequestMapping(value = "/AddReviewContent", method = RequestMethod.POST)
	public @ResponseBody
	JsonResponse addUser(@RequestParam("resId") String resId,
			@ModelAttribute(value = "restaurantReview") RestaurantReview restaurantReview,
			BindingResult result, HttpSession s) {
		JsonResponse res = new JsonResponse();
		ValidationUtils.rejectIfEmpty(result, "content",
				"content can not be empty.");
		if (!result.hasErrors()) {
			RestaurantReview rreview = new RestaurantReview();
			rreview.setContent(restaurantReview.getContent());
			rreview.setRating(restaurantReview.getRating());
			rreview.setRestaurant(restaurantService.getRes(Integer.parseInt(resId)));
			rreview.setCustomer((Customer) s.getAttribute("cus"));
			rreview.setDate(new Date(System.currentTimeMillis()));
			resReviewService.addResReview(rreview);
			res.setStatus("SUCCESS");
			res.setResult(rreview);
		} else {
			res.setStatus("FAIL");
			res.setResult(result.getAllErrors());
		}

		return res;
	}
	
	@RequestMapping(value = "/DeleteReviewContent", method = RequestMethod.POST)
	public @ResponseBody
	JsonResponse addUser(@ModelAttribute(value = "restaurantReview") RestaurantReview restaurantReview,
			BindingResult result, HttpSession s) {
		JsonResponse res = new JsonResponse();
		ValidationUtils.rejectIfEmpty(result, "id",
				"id can not be empty.");
		if (!result.hasErrors()) {
			RestaurantReview r = resReviewService.getResReview(restaurantReview.getId());
			r.setCustomer(null);
			r.setRestaurant(null);
			resReviewService.delete(resReviewService.getResReview(restaurantReview.getId()));
			res.setStatus("SUCCESS");
			
		} else {
			res.setStatus("FAIL");
			res.setResult(result.getAllErrors());
		}

		return res;
	}
	
	@RequestMapping(value = "/DeleteDish", method = RequestMethod.POST)
	public @ResponseBody
	JsonResponse addUser(@ModelAttribute(value = "dish") Dish dish,
			BindingResult result, HttpSession s) {
		JsonResponse res = new JsonResponse();
		ValidationUtils.rejectIfEmpty(result, "id",
				"id can not be empty.");
		if (!result.hasErrors()) {
			Dish dd = dishService.getDish(dish.getId());
			if (dd != null) {
				dd.setRes(null);
				
				dishService.deleteDish(dd);
			}
			res.setStatus("SUCCESS");
			
		} else {
			res.setStatus("FAIL");
			res.setResult(result.getAllErrors());
		}

		return res;
	}
}
