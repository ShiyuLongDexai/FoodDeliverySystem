package edu.coe.lab.web;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.coe.lab.domain.mainEntity.Dish;
import edu.coe.lab.domain.mainEntity.Restaurant;
import edu.coe.lab.service.DishService;
import edu.coe.lab.service.RestaurantService;

@Controller
public class PhotoController {

	@Resource
	private DishService dishService;
	@Resource
	private RestaurantService restaurantService;

	@RequestMapping(value = "dishes/{dishId}/photo", method = RequestMethod.GET)
	public @ResponseBody
	String viewPhoto(@PathVariable Integer dishId, HttpServletResponse response)
			throws IOException {
		Dish dish = dishService.getDish(dishId);
		byte[] photoBytes = dish.getCoverPhoto();
		if (photoBytes != null) {
			int length = photoBytes.length;
			ServletOutputStream op = response.getOutputStream();

			response.setContentType("image/jpeg");
			response.setContentLength(length);
			response.setHeader("Content-Disposition",
					"attachment; filename=\"photo_" + dish.getId() + ".jpg\"");

			op.write(photoBytes, 0, length);
			op.flush();
			op.close();
		}

		return "";
	}

	@RequestMapping(value = "restaurantes/{restaurantId}/photo", method = RequestMethod.GET)
	public @ResponseBody
	String resPhoto(@PathVariable Integer restaurantId,
			HttpServletResponse response) throws IOException {
		Restaurant restaurant = restaurantService.getRes(restaurantId);
//		System.out.println(restaurant + " Restaurant~~~");
		byte[] photoBytes = restaurant.getCoverPhoto();
		if (photoBytes != null) {
			int length = photoBytes.length;
			ServletOutputStream op = response.getOutputStream();

			response.setContentType("image/jpeg");
			response.setContentLength(length);
			response.setHeader("Content-Disposition",
					"attachment; filename=\"photo_" + restaurant.getId()
							+ ".jpg\"");

			op.write(photoBytes, 0, length);
			op.flush();
			op.close();
		}

		return "";
	}
}
