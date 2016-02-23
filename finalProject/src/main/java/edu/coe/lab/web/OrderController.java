package edu.coe.lab.web;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.coe.lab.domain.Review.RestaurantReview;
import edu.coe.lab.domain.mainEntity.Customer;
import edu.coe.lab.domain.mainEntity.Restaurant;
import edu.coe.lab.domain.order.FoodOrder;
import edu.coe.lab.domain.order.OrderItem;
import edu.coe.lab.service.OrderService;
import edu.coe.lab.service.ResReviewService;

@Controller
public class OrderController {
@Resource
private OrderService orderService;
@Resource
private ResReviewService resReviewService;

	@RequestMapping(value="CusOrder")
	public String cusOrder(Model model, HttpSession s){
		List<FoodOrder> orders = orderService.ListOrderByCusUD((((Customer)s.getAttribute("cus")).getId()));
		model.addAttribute("orders", orders);
		return "CusOrder";
	}
	
	@RequestMapping(value="CusOrderHistory")
	public String cusOrderHistory(Model model, HttpSession s){
		List<FoodOrder> orders = orderService.ListOrderByCusD((((Customer)s.getAttribute("cus")).getId()));
		model.addAttribute("orders", orders);
		return "CusOrderHistory";
	}
	
	@RequestMapping(value="ViewCurrentOrderDetails")
	public String currentOrderDetails(
			@RequestParam(value = "orderId", required = false) String orderId,
			@RequestParam(value = "rating", required = false) String rating,
			@RequestParam(value = "reviewContent", required = false) String reviewContent,
			Model model, HttpSession s){
		FoodOrder fo = orderService.getOrder(Integer.valueOf(orderId));
		Restaurant r = null;
		for (OrderItem oi:fo.getOrders()){
			r=oi.getDish().getRes();
		}
		if (reviewContent != null) {
			RestaurantReview rreview = new RestaurantReview();
			rreview.setContent(reviewContent);
			rreview.setRating(Integer.parseInt(rating));
//			System.out.println("rating added");
//			System.out.println(resId);
			
			rreview.setRestaurant(r);
//			System.out.println("restaurant added");
			rreview.setCustomer((Customer) s.getAttribute("cus"));
			rreview.setDate(new Date(System.currentTimeMillis()));
//			System.out.println("customer added");
			resReviewService.addResReview(rreview);

		}
		model.addAttribute("ois", fo.getOrders());
		model.addAttribute("totalPrice", fo.getTotalPrice());
		model.addAttribute("resName", fo.getResName());
		model.addAttribute("orderId",orderId);
		model.addAttribute("restaurantReviews", resReviewService
				.resReviewListByRes(r.getId()));
		return "ViewCurrentOrderDetails";
	}
	
	@RequestMapping(value="ResOrderUD")
	public String resOrderUD(@RequestParam(value = "orderId", required = false) String orderId,
			Model model, HttpSession s){
		if(orderId!=null){
			FoodOrder fo = orderService.getOrder(Integer.valueOf(orderId));
			fo.setStatus("delivering");
			orderService.updateOrder(fo);
			}
		List<FoodOrder> orders = orderService.ListOrderByResUD(((((Restaurant)s.getAttribute("res")).getName())));
		model.addAttribute("orders", orders);
		
		
		return "ResOrderUD";
	}
	
	@RequestMapping(value="ResOrderDing")
	public String resOrderDing(@RequestParam(value = "orderId", required = false) String orderId,
			Model model, HttpSession s){
		if(orderId!=null){
			FoodOrder fo = orderService.getOrder(Integer.valueOf(orderId));
			fo.setStatus("delivered");
			orderService.updateOrder(fo);
			}
		List<FoodOrder> orders = orderService.ListOrderByResDing(((((Restaurant)s.getAttribute("res")).getName())));
		model.addAttribute("orders", orders);
		
		
		return "ResOrderDing";
	}
	
	@RequestMapping(value="ResOrderDed")
	public String resOrderDed(
			Model model, HttpSession s){
		
		List<FoodOrder> orders = orderService.ListOrderByResDed(((((Restaurant)s.getAttribute("res")).getName())));
		model.addAttribute("orders", orders);
		
		
		return "ResOrderDed";
	}
	
	@RequestMapping(value="ResOrderAll")
	public String resOrderAll(
			@RequestParam(value = "orderId", required = false) String orderId,
			Model model, HttpSession s){
		if(orderId!=null){
			FoodOrder fo = orderService.getOrder(Integer.valueOf(orderId));
			fo.setCustomer(null);
			for(OrderItem oi:fo.getOrders()){
				oi.setDish(null);
			}
			orderService.deleteOrder(fo);
			}
		List<FoodOrder> orders = orderService.ListOrdersByCus(((((Restaurant)s.getAttribute("res")).getId())));
		model.addAttribute("orders", orders);
		
		
		return "ResOrderAll";
	}
	@RequestMapping(value="ViewResOrderDetails")
	public String viewResOrderDetails(@RequestParam(value = "orderId", required = false) String orderId,
			Model model, HttpSession s){
		FoodOrder fo = orderService.getOrder(Integer.valueOf(orderId));
		model.addAttribute("ois", fo.getOrders());
		model.addAttribute("totalPrice", fo.getTotalPrice());
		model.addAttribute("cusName", fo.getCustomer().getName());
		return "ViewResOrderDetails";
	}
}
