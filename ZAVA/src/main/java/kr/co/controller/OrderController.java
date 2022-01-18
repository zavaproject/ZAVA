package kr.co.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.domain.MemberVO;
import kr.co.domain.OrderDetailVO;
import kr.co.domain.OrderListVO;
import kr.co.domain.OrderVO;
import kr.co.service.OrderService;

@Controller
@RequestMapping("order")
public class OrderController {

	@Inject
	private OrderService oService;

	@RequestMapping(value = "/orderRead/{oid}", method = RequestMethod.GET)
	public void orderRead(HttpSession session, @PathVariable("oid") String oid, OrderVO order, Model model)
			throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("member");
		String mid = member.getMid();

		order.setMid(mid);
		order.setOid(oid);

		List<OrderListVO> orderRead = oService.orderRead(order);

		model.addAttribute("orderRead", orderRead);

	}

	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public void orderList(HttpSession session, OrderVO order, Model model) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("member");
		String mid = member.getMid();

		order.setMid(mid);

		List<OrderVO> orderList = oService.orderList(order);

		model.addAttribute("orderList", orderList);

	}

	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public String orderui() {

		return "order/cartList";
	}

	@RequestMapping(value = "/cartList", method = RequestMethod.POST)
	public String order(HttpSession session, OrderVO order, OrderDetailVO orderDetail) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("member");
		String mid = member.getMid();

		String sNum = "";

		for (int i = 1; i <= 9; i++) {
			sNum += (int) (Math.random() * 10);
		}

		String oid = sNum;

		order.setOid(oid);
		order.setMid(mid);

		oService.order(order);

		orderDetail.setOid(oid);
		oService.orderDetail(orderDetail);

		oService.cartDelete(mid);

		return "redirect:/order/orderList";
	}
}
