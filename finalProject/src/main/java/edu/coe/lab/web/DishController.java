package edu.coe.lab.web;

import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import org.apache.tomcat.jni.File;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import edu.coe.lab.domain.mainEntity.Dish;
import edu.coe.lab.domain.mainEntity.Restaurant;
import edu.coe.lab.service.DishService;

@Controller
public class DishController {

	@Resource
	private DishService dishService;

	@RequestMapping(value = "menu", method = RequestMethod.GET)
	public String manageMenu(
			@RequestParam(value = "deleteDishId", required = false) String deleteDishId,
			HttpSession s, Model model) {
		// System.out.println("Get");
		// delete dish
		if (deleteDishId != null) {
			Dish dd = dishService.getDish(Integer.parseInt(deleteDishId));
			if (dd != null) {
				dd.setRes(null);
				
				dishService.deleteDish(dd);
			}
		}
		Restaurant r = (Restaurant) s.getAttribute("res");
		// System.out.println(r.getId());
		ArrayList<Dish> menu = dishService.getDishByRes(r.getId());
		model.addAttribute("menu", menu);
		// for (Dish d:menu){
		// System.out.println("Dishname"+d.getName());
		// }

		return "menu";
	}

	@RequestMapping(value = "menu", method = RequestMethod.POST, headers = "content-type=multipart/*")
	public String manageMenu(
			@RequestParam(value = "dishName", required = false) String dishName,

			@RequestParam(value = "deleteDishId", required = false) String deleteDishId,
			@RequestParam(value = "dishDisc", required = false) String dishDisc,
			@RequestParam(value = "dishPrice", required = false) Double dishPrice,
			@RequestParam(value = "dishType", required = false) String dishType,
			// @RequestParam(value = "dishPhoto", required = false) byte[]
			// dishPhoto,
			@RequestParam(value = "dishPhoto", required = false) MultipartFile dishPhoto,
			HttpSession s, HttpServletRequest request,
			MultipartHttpServletRequest mrequest, Model model)
			throws IOException {
		System.out.println("POST");
		Restaurant r = (Restaurant) s.getAttribute("res");

		// System.out.println(r.getId());

		// List<Dish> menu= dishService.getDishByRes(r.getId());
		// for (Dish d:menu){
		// System.out.println("Dishname"+d.getName());
		// }

		// Dish dd = dishService.getDish(deleteDishId);
		// if(dd!=null){
		// dd.setRes(null);
		// dishService.deleteDish(dd);
		// }
		if (dishName != null) {
			Dish d = new Dish();
			d.setCategory(dishType);
			d.setPrice(dishPrice);
			d.setDisc(dishDisc);
			d.setName(dishName);
			d.setRes(r);
			if (!dishPhoto.isEmpty()) {
				byte[] bytes = dishPhoto.getBytes();
				d.setCoverPhoto(bytes);
			}
			// MultipartFile file = mrequest.getFile("dishPhoto");

			dishService.addDish(d);
		}

		// if(deleteDishId!=0){
		// Dish d = new Dish();
		// d.setId(deleteDishId);
		// dishService.deleteDish(d);
		//
		// }
		ArrayList<Dish> menu = dishService.getDishByRes(r.getId());
		model.addAttribute("menu", menu);
		return "menu";
	}
}
