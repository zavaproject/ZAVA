package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.domain.OptionVO;
import kr.co.domain.OrderListVO;
import kr.co.domain.OrderVO;

import kr.co.service.AdminOrderService;

@Controller
@RequestMapping("admin")
public class AdminOrderController {
	
	@Inject
	AdminOrderService adService;
	
	@RequestMapping(value = "/adminOrderList", method = RequestMethod.GET)
	public void adminOrderList(Model model) throws Exception {
		
		List<OrderVO> adOrderList = adService.adOrderList();
		
		model.addAttribute("adOrderList", adOrderList);
	}
	
	@RequestMapping(value = "/adminOrderRead", method = RequestMethod.GET)
	public void adminOrderRead(@RequestParam("n") String oid, OrderVO order, Model model) throws Exception{
		
		order.setOid(oid);
		List<OrderListVO> adOrderRead = adService.adOrderRead(order);
		
		model.addAttribute("adOrderRead", adOrderRead);		
	}
	
	@RequestMapping(value = "/adminOrderRead", method = RequestMethod.POST)
	public String adminOstatus(OrderVO order) throws Exception{
		
		adService.adminOstatus(order);
		
		return "redirect:/admin/adminOrderRead?n=" + order.getOid();
	}	
}