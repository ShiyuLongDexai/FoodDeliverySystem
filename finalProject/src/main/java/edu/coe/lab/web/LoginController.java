package edu.coe.lab.web;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import edu.coe.lab.domain.mainEntity.Customer;
import edu.coe.lab.domain.mainEntity.Restaurant;
import edu.coe.lab.domain.order.FoodOrder;
import edu.coe.lab.domain.user.User;
import edu.coe.lab.service.CustomerService;
import edu.coe.lab.service.ResReviewService;
import edu.coe.lab.service.RestaurantService;
import edu.coe.lab.service.UserService;

@Controller
public class LoginController {
	
	@Resource(name="userService")
	private UserService userService;
	@Resource
	private RestaurantService restaurantService;
	@Resource
	private CustomerService customerService;
	@Resource
	private ResReviewService resReviewService;
	
	@RequestMapping(value = "/home", method = RequestMethod.POST)
	public String logins(@RequestParam("email") String email, 
			@RequestParam("password") String password, Model model,  HttpSession s, HttpServletRequest r ){
		model.addAttribute("restaurants", restaurantService.topRestaurants());
		User u = new User();
		u.setUsername(email);
		u.setPassword(password);
		String valid= userService.validUser(u);
//		System.out.println(valid);
		if(valid==null){
			model.addAttribute("notValid", "<div class='alert alert-danger'>not valid username or password</div>");
			r.setAttribute("notValidUser", "<div class='alert alert-danger'>not valid username or password</div>");
			return "forward:/login";
		}
//		User u = userService.getUser(email);
//		model.addAttribute("password", u.getPassword());
		//userService.removeUser(u);
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
			s.setAttribute("username", email);
			s.setAttribute("role", valid);
			s.setAttribute("cus",customerService.getCustomerByUsername(email));
			FoodOrder cart = new FoodOrder();
			cart.setCustomer(customerService.getCustomerByUsername(email));
			cart.setPayment("unpaid");
			cart.setStatus("undelivered");
			s.setAttribute("cart",cart);
			
		    
		return "redirect:/homeCus";
		}
		if(valid.equals("r")){
			for(int i=0;i<restaurantService.listRes().size();i++){
				Restaurant restaurant = restaurantService.listRes().get(i);
				double avgRating = restaurantService.getAvgRating(restaurant);
//				restaurant.setAvgRating(restaurantService.getAvgRating(restaurant));
				restaurant.setReviewsNo(resReviewService.resReviewListByRes(restaurant.getId()).size());
				restaurant.setAvgRating(avgRating);
//				restaurant.setReviewsNo(2);
				restaurantService.update(restaurant);
			}
			s.setAttribute("username", email);
			s.setAttribute("role", valid);
			s.setAttribute("res", restaurantService.getRestaurantByUsername(email));
		return "redirect:/homeRes";
		}
		else{
			return null;
		}
	}

	@RequestMapping(value = "/homeCus", method = RequestMethod.GET)
	public String homeCus(Model model, HttpSession s) {
		model.addAttribute("restaurants", restaurantService.listResWithZipCode(
				restaurantService.topRestaurants(),
				((Customer) s.getAttribute("cus")).getAddress().getZipcode()));

		return "homepage2Cus";
	}

//	@RequestMapping(value="/homeRes",method = RequestMethod.GET)
//	public String homeRes2(){
//		return "homepage2Res";
//		
//	}
	
	@RequestMapping(value="/homeRes",method = RequestMethod.POST, headers = "content-type=multipart/*")
	public String homeRes(
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "realname", required = false) String realname,
			@RequestParam(value = "street", required = false) String street,
			@RequestParam(value = "city", required = false) String city,
			@RequestParam(value = "state", required = false) String state,
			@RequestParam(value = "zipcode", required = false) String zipcode,
			
			@RequestParam(value = "resType", required = false) String resType,
			@RequestParam(value = "resDisc", required = false) String resDisc,
			@RequestParam(value = "deliveryZipcode", required = false) String deliveryZipcode,
			@RequestParam(value= "resPhoto", required = false) MultipartFile resPhoto,
			Model model,
			HttpSession s
			) throws IOException{
		model.addAttribute("restaurants", restaurantService.topRestaurants());
		if(deliveryZipcode!=null){
		
		Restaurant r2=(Restaurant)s.getAttribute("res");
		Restaurant r = (Restaurant) restaurantService.getRes(r2.getId());
		
		
		
		r.getUser().setUsername(username);
		r.getUser().setPassword(password);
		r.setName(realname);
		r.getAddress().setStreet(street);
		r.getAddress().setCity(city);
		r.getAddress().setState(state);
		r.getAddress().setZipcode(zipcode);
		r.setRestaurantType(resType);
		r.setDiscription(resDisc);
		r.setDeliverZipcode(deliveryZipcode);
		if (!resPhoto.isEmpty()) {
	        byte[] bytes = resPhoto.getBytes();
	        r.setCoverPhoto(bytes);}
		restaurantService.update(r);
		s.setAttribute("res", r);
		}
		
		
		return "homepage2Res";
	}
	
	@RequestMapping(value="/homeRes",method = RequestMethod.GET)
	public String homeRes2(
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "realname", required = false) String realname,
			@RequestParam(value = "street", required = false) String street,
			@RequestParam(value = "city", required = false) String city,
			@RequestParam(value = "state", required = false) String state,
			@RequestParam(value = "zipcode", required = false) String zipcode,
			
			@RequestParam(value = "resType", required = false) String resType,
			@RequestParam(value = "resDisc", required = false) String resDisc,
			@RequestParam(value = "deliveryZipcode", required = false) String deliveryZipcode,
			Model model,
			HttpSession s
			) throws IOException{
		model.addAttribute("restaurants", restaurantService.topRestaurants());
		if(deliveryZipcode!=null){
		
		
		Restaurant r = (Restaurant) s.getAttribute("res");
		
		
		
		r.getUser().setUsername(username);
		r.getUser().setPassword(password);
		r.setName(realname);
		r.getAddress().setStreet(street);
		r.getAddress().setCity(city);
		r.getAddress().setState(state);
		r.getAddress().setZipcode(zipcode);
		r.setRestaurantType(resType);
		r.setDiscription(resDisc);
		r.setDeliverZipcode(deliveryZipcode);
		
		restaurantService.update(r);
		s.setAttribute("res", r);
		}
		
		
		return "homepage2Res";
	}
	
	
	@RequestMapping(value="/homeCus")
	public String homeCus(
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "realname", required = false) String realname,
			@RequestParam(value = "street", required = false) String street,
			@RequestParam(value = "city", required = false) String city,
			@RequestParam(value = "state", required = false) String state,
			@RequestParam(value = "zipcode", required = false) String zipcode,
			
			Model model,
			HttpSession s
			){
		
		if(zipcode!=null){
		
		Customer r= (Customer) s.getAttribute("cus");
		
		
		
		r.getUser().setUsername(username);
		r.getUser().setPassword(password);
		r.setName(realname);
		r.getAddress().setStreet(street);
		r.getAddress().setCity(city);
		r.getAddress().setState(state);
		r.getAddress().setZipcode(zipcode);
		
		
		customerService.update(r);
		}
		model.addAttribute("restaurants", 
				restaurantService.listResWithZipCode(restaurantService.topRestaurants(), ((Customer)s.getAttribute("cus")).getAddress().getZipcode()));
		
		return "homepage2Cus";
	}
	@RequestMapping(value="/forgetPassword")
	public String homeRes2(){
		return "forgetPassword";
		
	}
	
}
