package edu.coe.lab.web;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.coe.lab.domain.TestEmail;
import edu.coe.lab.domain.Review.RestaurantReview;
import edu.coe.lab.domain.mainEntity.Address;
import edu.coe.lab.domain.mainEntity.CreditCard;
import edu.coe.lab.domain.mainEntity.Customer;
import edu.coe.lab.domain.mainEntity.Restaurant;
import edu.coe.lab.domain.order.FoodOrder;
import edu.coe.lab.domain.order.OrderItem;
import edu.coe.lab.service.CustomerService;
import edu.coe.lab.service.DishService;
import edu.coe.lab.service.OrderService;
import edu.coe.lab.service.ResReviewService;
import edu.coe.lab.service.RestaurantService;

@Controller
public class CustomerController {
	@Resource
	private CustomerService customerService;
	@Resource
	private RestaurantService restaurantService;
	@Resource
	private DishService dishService;
	@Resource
	private OrderService orderService;
	@Resource
	private ResReviewService resReviewService;

	@RequestMapping("ResSearch")
	public String resSearch(
			@RequestParam(value = "searchName", required = false) String searchName,
			Model model, HttpSession s) {
		FoodOrder cart = (FoodOrder) s.getAttribute("cart");

		if (searchName != null) {
			model.addAttribute("restaurants",
					restaurantService.listResWithZipCode((restaurantService.findRes(searchName)),cart.getCustomer().getAddress().getZipcode()));
		}
		model.addAttribute("ois", cart.getOrders());
		model.addAttribute("totalPrice", getTotalPrice(cart));
		return "ResSearch";
	}

	@RequestMapping("ResMenu")
	public String resMenu(
			@RequestParam(value = "resId", required = false) int resId,
			@RequestParam(value = "dishId", required = false) String dishId,
			@RequestParam(value = "rating", required = false) String rating,
			@RequestParam(value = "reviewContent", required = false) String reviewContent,
			@RequestParam(value = "orderItemQty", required = false) String orderItemQty,

			Model model, HttpSession s) {

		FoodOrder cart = (FoodOrder) s.getAttribute("cart");
		if (reviewContent != null && resId != 0) {
			RestaurantReview rreview = new RestaurantReview();
			rreview.setContent(reviewContent);
			rreview.setRating(Integer.parseInt(rating));
//			System.out.println("rating added");
//			System.out.println(resId);
			rreview.setRestaurant(restaurantService.getRes(resId));
//			System.out.println("restaurant added");
			rreview.setCustomer((Customer) s.getAttribute("cus"));
			rreview.setDate(new Date(System.currentTimeMillis()));
//			System.out.println("customer added");
			resReviewService.addResReview(rreview);

		}
		if (dishId != null) {

			OrderItem oi = new OrderItem();
			// System.out.println(dishId);
			// System.out.println(Integer.parseInt(dishId));
			oi.setDish(dishService.getDish(Integer.parseInt(dishId)));
			// System.out.println(orderItemQty);
			// System.out.println(Integer.parseInt(orderItemQty));
			oi.setQuantity(Integer.parseInt(orderItemQty));
//			if(cart.getOrders()==null){
//				Set <OrderItem> ois = new HashSet <OrderItem>();
//				cart.setOrders(ois);
//			}
			System.out.println("cart "+ cart);
			System.out.println("order "+ cart.getOrders());
			cart.getOrders().add(oi);
			// System.out.println("Dish added");

			s.setAttribute("cart", cart);
		}
		if (resId != 0) {
//			System.out.println("resId added");
			model.addAttribute("resId", resId);
//			System.out.println("menu added");
			model.addAttribute("menu",
					dishService.getDishByRes(resId));
//			System.out.println("res added");
			model.addAttribute("res",
					restaurantService.getRes(resId));
//			System.out.println("restaurantReviews added");
			model.addAttribute("restaurantReviews", resReviewService
					.resReviewListByRes(resId));
		}
		if (cart != null) {
			model.addAttribute("ois", cart.getOrders());
			model.addAttribute("totalPrice", getTotalPrice(cart));
		}
		// review part

		// return url
		return "ResMenu";
	}

	@RequestMapping("Restaurants")
	public String restaurants(
			@RequestParam(value = "sort", required = false) String sort,
			Model model, HttpServletRequest r, HttpSession s) {
//		System.out.println();
        
		model.addAttribute("sort", sort);
		List<Restaurant> restaurants = null;
		if (sort != null && sort.equals("sbt")) {
			// for(Restaurant res: restaurantService.sortByType()){
			// System.out.println(res.getName()+" "+res.getRestaurantType());
			// }
			restaurants= restaurantService.sortByType();
		}
		if (sort != null && sort.equals("sbn")) {

			restaurants= restaurantService.sortByName();
		} 
		if (sort != null && sort.equals("sbr")) {

			restaurants= restaurantService.sortByRating();
		} 
		else {

			restaurants= restaurantService.sortByType();
		}
		
		r.setAttribute("restaurants", 
				restaurantService.listResWithZipCode(restaurants, ((Customer)s.getAttribute("cus")).getAddress().getZipcode()));
		return "Restaurants";
	}

	@RequestMapping("OrderDetails")
	public String orderDetails(
			HttpSession s,
			Model model,
			@RequestParam(value = "dishId", required = false) String dishId,
			@RequestParam(value = "orderItemQty", required = false) String orderItemQty) {
		FoodOrder cart = (FoodOrder) s.getAttribute("cart");
		// System.out.println("Dish ID "+dishId);
		// System.out.println("orderItemQty "+orderItemQty);
		if (dishId != null) {

			cart.updateCartDish(dishId, orderItemQty);
			s.setAttribute("cart", cart);
			// for (OrderItem oi: cart.getOrders()){
			// System.out.println(oi.getDish().getName()+""+oi.getQuantity());}
		}
		model.addAttribute("ois", cart.getOrders());
		model.addAttribute("totalPrice", getTotalPrice(cart));
		return "OrderDetails";
	}

	@RequestMapping("Checkout")
	public String checkout(HttpSession s, Model model) {
		FoodOrder cart = (FoodOrder) s.getAttribute("cart");
		model.addAttribute("originTotalPrice", getTotalPrice(cart));
		double tax = Double.parseDouble(getTotalPrice(cart))*0.0625;
		model.addAttribute("tax", String.format("%.2f", tax));
		model.addAttribute("finalTotalPrice",totalPriceWithTax(cart));
		return "checkout";
	}

	@RequestMapping("CheckSuccess")
	public String checkSuccess(
			@RequestParam(value = "phone", required = false) String phone,
			@RequestParam(value = "street", required = false) String street,
			@RequestParam(value = "city", required = false) String city,
			@RequestParam(value = "state", required = false) String state,
			@RequestParam(value = "zipcode", required = false) String zipcode,
			@RequestParam(value = "cardNo", required = false) String cardNo,
			@RequestParam(value = "nameOnCard", required = false) String nameOnCard,
			@RequestParam(value = "expMonth", required = false) String expMonth,
			@RequestParam(value = "expYear", required = false) String expYear,
			@RequestParam(value = "expYear", required = false) String vin,
			HttpSession s) {
		if (phone != null) {
			FoodOrder cart = (FoodOrder) s.getAttribute("cart");
			Address a = new Address();
			a.setStreet(street);
			a.setCity(city);
			a.setState(state);
			a.setZipcode(zipcode);
			cart.setAddress(a);

			CreditCard c = new CreditCard();
			c.setCardNo(cardNo);
			c.setName(nameOnCard);
			c.setExpirationDate(expMonth + expYear);
			c.setVin(vin);
			cart.setCreditCard(c);
			Restaurant r = null;
			for(OrderItem oi :cart.getOrders()){
				r=oi.getDish().getRes();
			}
            cart.setResName(r.getName());
			cart.setPayment("paid");
			cart.setDate(new Date(System.currentTimeMillis()));
			Date deliveryDate = new Date();
			deliveryDate.setTime((new Date(System.currentTimeMillis())).getTime() + 30*60*1000);
            cart.setDeliveryTime(deliveryDate);
            cart.setTotalPrice(totalPriceWithTax(cart));
			for (OrderItem oi : cart.getOrders()) {
				oi.setFoodOrder(cart);
				System.out.println(oi);
			}
           
			orderService.addOrder(cart);
			//confirmation email
			StringBuffer message = new StringBuffer();
			for(OrderItem oi: cart.getOrders()){
				message.append(oi.getDish().getName()+"\t\t\t");
				message.append(oi.getDish().getPrice()+"\t\t\t");
				message.append(oi.getQuantity()+".\n");
			}
			TestEmail.send(cart.getCustomer().getUser().getUsername(),
					"Comfirmation on Order in "+cart.getResName()+" restaurant",
					"Thank you for Order for Food in "+cart.getResName()+" restaurant!\n"+
					"Order Details:\n"+message.toString()+"Best,\n"+"BostonToGo.com");
			
			s.setAttribute("cart", null);
			FoodOrder cart2 = new FoodOrder();
			cart2.setCustomer((Customer)s.getAttribute("cus"));
			cart2.setPayment("unpaid");
			cart2.setStatus("undelivered");
			s.setAttribute("cart", cart2);

			
		}
		return "checkSuccess";
	}

	public String getTotalPrice(FoodOrder foodOrder) {
		double totalPrice = 0;
		for (OrderItem oi : foodOrder.getOrders()) {
			totalPrice += oi.getDish().getPrice() * oi.getQuantity();
		}
		return String.format("%.2f", totalPrice);
	}
	
	public double totalPriceWithTax(FoodOrder foodOrder){
		
		double originTP = Double.parseDouble(getTotalPrice(foodOrder));
		double result =originTP*1.0625;
		
		return Double.parseDouble(String.format("%.2f", result));
	}
	
	
}
