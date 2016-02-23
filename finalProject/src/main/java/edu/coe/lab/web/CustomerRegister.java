package edu.coe.lab.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class CustomerRegister {
	@RequestMapping(value="CustomerRegister")
	public String login(){
		return "CustomerRegister";
	}
	
}
