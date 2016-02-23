package edu.coe.lab.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class ProfileUpdateController {
	@RequestMapping(value="ResProfile")
	public String resProfile(){
		return "ResProfile";
	}
	@RequestMapping(value="CusProfile")
	public String cusProfile(){
		return "CusProfile";
	}
}
