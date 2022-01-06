package kr.co.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.OrderVO;
import kr.co.service.OrderService;

@Controller
@RequestMapping("order")
public class OrderController {

	@Inject
	private OrderService oService;
	
	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public String payment()	{
		
		
		return "order/payment";
	}
	
	
	@RequestMapping(value = "/orderui", method = RequestMethod.GET)
	public String orderui() {
		
		
		return "order/order";
	}
	
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public String order(OrderVO vo) {
		
		oService.order(vo);
		
		return "redirect:/order/payment";
	}
	
}