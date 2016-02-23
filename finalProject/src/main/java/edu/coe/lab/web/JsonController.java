package edu.coe.lab.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import edu.coe.lab.domain.JsonResponse;
import edu.coe.lab.domain.TestEmail;
import edu.coe.lab.domain.Review.RestaurantReview;
import edu.coe.lab.domain.mainEntity.Customer;
import edu.coe.lab.domain.mainEntity.Dish;
import edu.coe.lab.domain.mainEntity.Restaurant;
import edu.coe.lab.domain.order.FoodOrder;
import edu.coe.lab.domain.order.OrderItem;
import edu.coe.lab.domain.user.User;
import edu.coe.lab.service.CustomerService;
import edu.coe.lab.service.DishService;
import edu.coe.lab.service.OrderService;
import edu.coe.lab.service.ResReviewService;
import edu.coe.lab.service.RestaurantService;
import edu.coe.lab.service.UserService;

@RestController
public class JsonController {
	@Resource(name = "userService")
	private UserService userService;
	@Resource
	private CustomerService customerService;
	@Resource
	private ResReviewService resReviewService;
	@Resource
	private DishService dishService;
	@Resource
	private OrderService orderService;
	@Resource
	private RestaurantService restaurantService;
	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	@RequestMapping(value="/test/{name}", method = RequestMethod.GET)
	public @ResponseBody User getShopInJSON(@PathVariable String name) {
 
		User user = new User();
		user.setUsername(name);
		user.setRole("abc");
 
		return user;
	}
	
	@RequestMapping(value="/test1/topRestaurants", method = RequestMethod.GET)
	public @ResponseBody List<Restaurant> gettopRestaurantsInJSON() {
 
		List<Restaurant> restaurants = new ArrayList<Restaurant>();
		restaurants = restaurantService.listRes();

		return restaurants;
	}
	
	@RequestMapping(value="/test1/topRestaurants2", method = RequestMethod.GET)
	public @ResponseBody Restaurant gettopRestaurantsInJSON2() {
 
		List<Restaurant> restaurants = new ArrayList<Restaurant>();
		restaurants = restaurantService.listRes();

		return restaurants.get(1);
 
	}
	
	
	@RequestMapping(value = "/testreceive", method = RequestMethod.POST, produces={"application/json"}, consumes = {"application/json"})
	@ResponseBody
	public JsonResponse addPerson(@RequestBody User user) {
	  logger.debug(user.toString());
	  
	  return new JsonResponse("ok","pass");
	}
	
	@RequestMapping(value = "/testreceive2", method = RequestMethod.POST, produces={"application/json"}, consumes = {"application/json"})
	@ResponseBody
	public JsonResponse addRes(@RequestBody Restaurant restaurant) {
	  logger.debug(restaurant.toString());
	  
	  return new JsonResponse("ok","pass");
	}
	
	@RequestMapping(value = "/testreceive3", method = RequestMethod.POST, produces={"application/json"}, consumes = {"application/json"})
	@ResponseBody
	public JsonResponse addRess(@RequestBody List<Restaurant> restaurants) {
	  logger.debug(restaurants.toString());
	  
	  return new JsonResponse("ok","pass");
	}
	
	@RequestMapping(value = "/newuser/customer", method = RequestMethod.POST, produces={"application/json"}, consumes = {"application/json"})
	@ResponseBody
	public JsonResponse addCustomer(@RequestBody Customer customer) {
		customerService.addCustomer(customer);
	  
	  return new JsonResponse("ok","pass");
	}
	
	@RequestMapping(value = "/newuser/restaurant", method = RequestMethod.POST, produces={"application/json"}, consumes = {"application/json"})
	@ResponseBody
	public JsonResponse addRestaurant(@RequestBody Restaurant restaurant) {
		restaurantService.addRestaurant(restaurant);
	  
	  return new JsonResponse("ok","pass");
	}
	
	@RequestMapping(value = "/json/login", method = RequestMethod.POST, produces={"application/json"}, consumes = {"application/json"})
	@ResponseBody
	public JsonResponse login(@RequestBody User user) {
		String valid= userService.validUser(user);
		if(valid.equals("c")){
			for(int i=0;i<restaurantService.listRes().size();i++){
				Restaurant restaurant = restaurantService.listRes().get(i);
				double avgRating = restaurantService.getAvgRating(restaurant);
//				restaurant.setAvgRating(restaurantService.getAvgRating(restaurant));
				restaurant.setReviewsNo(resReviewService.resReviewListByRes(restaurant.getId()).size());
				restaurant.setAvgRating(avgRating);
//				restaurant.setReviewsNo(2);
				restaurantService.update(restaurant);
			}
		}
	  return new JsonResponse("ok",valid);
	}
	
	@RequestMapping(value = "/customer/updateCustomer", method = RequestMethod.POST, produces={"application/json"}, consumes = {"application/json"})
	@ResponseBody
	public JsonResponse updateCustomer(@RequestBody Customer customer) {
		customerService.update(customer);
	  return new JsonResponse("ok","pass");
	}
	
	@RequestMapping(value="/customer/getRestaurants/{username}/", method = RequestMethod.GET)
	public @ResponseBody List<Restaurant> getRestaurants(@PathVariable String username) {
		List<Restaurant> result = new ArrayList<Restaurant>();
		String zipcode = customerService.getCustomerByUsername(username).getAddress().getZipcode();
		result= restaurantService.sortByRating();
		//filter res by zip
		result = restaurantService.listResWithZipCode(result, zipcode);
		return result;
	}
	
	@RequestMapping(value="/customer/getRestaurantsByType/{username}/", method = RequestMethod.GET)
	public @ResponseBody List<Restaurant> getRestaurantsByType(@PathVariable String username) {
		List<Restaurant> result = new ArrayList<Restaurant>();
		String zipcode = customerService.getCustomerByUsername(username).getAddress().getZipcode();
		result= restaurantService.sortByType();
		//filter res by zip
		result = restaurantService.listResWithZipCode(result, zipcode);
		return result;
	}
	
	@RequestMapping(value="/customer/getRestaurantsByName/{username}/", method = RequestMethod.GET)
	public @ResponseBody List<Restaurant> getRestaurantsByName(@PathVariable String username) {
		List<Restaurant> result = new ArrayList<Restaurant>();
		String zipcode = customerService.getCustomerByUsername(username).getAddress().getZipcode();
		result= restaurantService.sortByName();
		//filter res by zip
		result = restaurantService.listResWithZipCode(result, zipcode);
		return result;
	}
	
	@RequestMapping(value="/customer/getReviews/{resId}/", method = RequestMethod.GET)
	public @ResponseBody List<RestaurantReview> getReviews(@PathVariable String resId) {
		List<RestaurantReview> result = new ArrayList<RestaurantReview>();
		result = resReviewService.resReviewListByRes(Integer.valueOf(resId));
		return result;
	}
	
	@RequestMapping(value="/customer/getDishes/{resId}/", method = RequestMethod.GET)
	public @ResponseBody List<Dish> getDishes(@PathVariable String resId) {
		List<Dish> result = new ArrayList<Dish>();
		result = dishService.getDishByRes(Integer.valueOf(resId));
		return result;
	}
	
	@RequestMapping(value = "/customer/checkOut", method = RequestMethod.POST, produces={"application/json"}, consumes = {"application/json"})
	@ResponseBody
	public JsonResponse checkOut(@RequestBody FoodOrder cart) {
		for (OrderItem oi : cart.getOrders()) {
			oi.setFoodOrder(cart);
		}
		cart.setOrderId(0);
		
		for(OrderItem oi: cart.getOrders()){
			System.out.println(oi);
		}
		orderService.addOrder(cart);
		//confirmation email
//		StringBuffer message = new StringBuffer();
//		for(OrderItem oi: cart.getOrders()){
//			message.append(oi.getDish().getName()+"\t\t\t");
//			message.append(oi.getDish().getPrice()+"\t\t\t");
//			message.append(oi.getQuantity()+".\n");
//		}
//		TestEmail.send(cart.getCustomer().getUser().getUsername(),
//				"Comfirmation on Order in "+cart.getResName()+" restaurant",
//				"Thank you for Order for Food in "+cart.getResName()+" restaurant!\n"+
//				"Order Details:\n"+message.toString()+"Best,\n"+"BostonToGo.com");
		
	  return new JsonResponse("ok", "pass");
	}
	
	@RequestMapping(value="/customer/getCustomer/{username}/", method = RequestMethod.GET)
	public @ResponseBody Customer getCustomer(@PathVariable String username) {
		Customer result = new Customer();
		result= customerService.getCustomerByUsername(username);
		return result;
	}
	
	@RequestMapping(value="/customer/getCurrentOrder/{customerId}/", method = RequestMethod.GET)
	public @ResponseBody List<FoodOrder> getCurrentOrder(@PathVariable String customerId) {
		List<FoodOrder> result = new ArrayList<FoodOrder>();
		result = orderService.ListOrderByCusUD(Integer.parseInt(customerId));
		return result;
	}
	
	@RequestMapping(value="/customer/getHistoryOrder/{customerId}/", method = RequestMethod.GET)
	public @ResponseBody List<FoodOrder> getHistoryOrder(@PathVariable String customerId) {
		List<FoodOrder> result = new ArrayList<FoodOrder>();
		result = orderService.ListOrderByCusD(Integer.parseInt(customerId));
		return result;
	}
	
	@RequestMapping(value="/customer/getCusReviews/{customerId}/", method = RequestMethod.GET)
	public @ResponseBody List<RestaurantReview> getCustomerReviews(@PathVariable String customerId) {
		List<RestaurantReview> result = new ArrayList<RestaurantReview>();
		result = resReviewService.resReviewListByCus(Integer.parseInt(customerId));
		return result;
	}
	
	@RequestMapping(value = "/customer/addReview", method = RequestMethod.POST, produces={"application/json"}, consumes = {"application/json"})
	@ResponseBody
	public JsonResponse addReview(@RequestBody RestaurantReview rr) {
		resReviewService.addResReview(rr);
	  return new JsonResponse("ok","pass");
	}
	
	@RequestMapping(value = "/customer/updateReview", method = RequestMethod.POST, produces={"application/json"}, consumes = {"application/json"})
	@ResponseBody
	public JsonResponse updateReview(@RequestBody RestaurantReview rr) {
		resReviewService.update(rr);
	  return new JsonResponse("ok","pass");
	}
	
	@RequestMapping(value = "/customer/deleteReview", method = RequestMethod.POST, produces={"application/json"}, consumes = {"application/json"})
	@ResponseBody
	public JsonResponse deleteReview(@RequestBody RestaurantReview rr) {
		RestaurantReview r = resReviewService.getResReview(rr.getId());
		r.setCustomer(null);
		r.setRestaurant(null);
		resReviewService.delete(resReviewService.getResReview(rr.getId()));
	  return new JsonResponse("ok","pass");
	}
	
	@RequestMapping(value="/customer/forgetPassword/{username}/", method = RequestMethod.GET)
	public @ResponseBody JsonResponse forgetPassword(@PathVariable String username) {
		TestEmail.send(username, "Your Password", "Your Password is "+userService.getUser(username).getPassword());
		return new JsonResponse("ok","pass");
	}
	
}
