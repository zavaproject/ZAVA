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
	
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public void orderUI() {
		
	}
	
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public String order(OrderVO vo) {
		System.out.println("주문화면");
		
		oService.order(vo);
		
		return "order/order";
	}
	
}
