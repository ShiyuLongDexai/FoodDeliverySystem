package edu.coe.lab.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.coe.lab.domain.TestEmail;
import edu.coe.lab.domain.mainEntity.Address;
import edu.coe.lab.domain.mainEntity.Customer;
import edu.coe.lab.domain.mainEntity.Restaurant;
import edu.coe.lab.domain.user.User;
import edu.coe.lab.service.CustomerService;
import edu.coe.lab.service.RestaurantService;
import edu.coe.lab.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Resource(name = "userService")
	private UserService userService;
	@Resource
	private CustomerService customerService;
	@Resource
	private RestaurantService restaurantService;
	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = "login")
	public String login(
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "realname", required = false) String realname,
			@RequestParam(value = "street", required = false) String street,
			@RequestParam(value = "city", required = false) String city,
			@RequestParam(value = "state", required = false) String state,
			@RequestParam(value = "zipcode", required = false) String zipcode,
			@RequestParam(value = "role", required = false) String role,
			@RequestParam(value = "forget", required = false) String forget,
			HttpServletRequest request, Model model) {

		Customer c = new Customer();
		// set user
		User u = new User();
		u.setUsername(username);
		u.setPassword(password);

		u.setRole(role);
		c.setUser(u);
		// set address
		Address a = new Address();
		a.setCity(city);
		a.setState(state);
		a.setStreet(street);
		a.setZipcode(zipcode);
		c.setAddress(a);
		// set name
		c.setName(realname);
		// set restaurant
		Restaurant r = new Restaurant();
		r.setAddress(a);
		r.setName(realname);
		r.setUser(u);
		if (forget != null) {
			TestEmail.send(forget, "Your Password", "Your Password is "+userService.getUser(forget).getPassword());
			request.setAttribute(
					"notValidUser",
					"<div class='alert alert-danger'>An Email with Your Password Has Been Sent.</div>");
		}
		// System.out.println("role "+role);
		// save
		if (username != null && username.length() != 0) {
			if (role.equals("c")) {

				customerService.addCustomer(c);
			}
			if (role.equals("r")) {
				restaurantService.addRestaurant(r);
			}
		}
		return "finallogin";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession s) {
		logger.info("Welcome home! The client locale is {}.", locale);
		model.addAttribute("restaurants", restaurantService.topRestaurants());
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG,
				DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		s.setAttribute("role", null);
		s.setAttribute("username", null);
		s.setAttribute("cart", null);
		s.setAttribute("res", null);
		s.setAttribute("cus", null);
		return "homepage2";
	}
	// @RequestMapping("/CusHome")
@RequestMapping("/error")
public String error(){
	return "error";
}
}
