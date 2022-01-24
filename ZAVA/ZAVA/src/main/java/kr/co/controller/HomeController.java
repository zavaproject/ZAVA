package kr.co.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class HomeController {

	@RequestMapping(value = "/zava")
	public void home() {
	}
	
	@RequestMapping(value = "/")
	public String home2() {
		return "redirect:/zava";
	}
}
