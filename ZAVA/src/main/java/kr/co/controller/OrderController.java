package kr.co.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.MemberVO;
import kr.co.domain.OrderDetailVO;
import kr.co.domain.OrderVO;
import kr.co.service.OrderService;

@Controller
@RequestMapping("order")
public class OrderController {
	
	
	@Inject
	private OrderService oService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void orderList(HttpSession session, OrderVO oVO, Model model) throws Exception {
		
		MemberVO mVo = (MemberVO) session.getAttribute("member");
		String mid = mVo.getMid();
		
		oVO.setOid(mid);
		
		List<OrderVO> orderList = oService.orderList(oVO);
		
		model.addAttribute("orderList", orderList);
	}
	
	
	@RequestMapping(value = "/orderui", method = RequestMethod.GET)
	public String orderui() {
		
		
		return "order/order";
	}
	
	@RequestMapping(value = "/cartList", method = RequestMethod.POST)
	public String order(HttpSession session, OrderVO oVo, OrderDetailVO odVo) throws Exception {
		
		MemberVO mVo = (MemberVO) session.getAttribute("member");
		String mid = mVo.getMid();
		
		oService.order(oVo);
		oService.orderDetail(odVo);
		
		return "redirect:/order/cartList";
	}
	
}