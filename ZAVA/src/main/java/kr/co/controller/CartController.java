package kr.co.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.CartVO;
import kr.co.domain.MemberVO;
import kr.co.domain.OptionVO;
import kr.co.domain.OrderDetailVO;
import kr.co.domain.OrderListVO;
import kr.co.domain.OrderVO;
import kr.co.domain.ProductVO;
import kr.co.service.CartService;
import kr.co.service.ProductService;

@Controller
@RequestMapping("cart")
public class CartController {

	@Inject
	private CartService cService;

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insert() {

	}

	// 장바구니 추가
	@ResponseBody
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public int insert(@RequestParam(value = "ocode") String ocode, @RequestParam(value = "pid") String pid, CartVO vo,
			HttpSession session) {
		int result = 0;

		MemberVO member = (MemberVO) session.getAttribute("login");

		if (member != null) {
			String mid = member.getMid();

			vo.setMid(mid);
			vo.setPid(pid);
			vo.setOcode(ocode);
			
			int count = cService.countCart(ocode, mid); // 상품이 몇개 있는지 카운트

			if (count == 0) {
				cService.insert(vo);
				result = 1;
			} else {
				result = 2;
			}
		}		

		return result;
	}

	// 수량 변경
		@ResponseBody
		@RequestMapping(value = "/update", method = RequestMethod.POST)
		public int update(HttpSession session, @RequestParam(value = "pcnt") int pcnt,
				@RequestParam(value = "ocode") String ocode,@RequestParam(value = "maxlength") int maxlength,CartVO vo) {

			MemberVO member = (MemberVO) session.getAttribute("login");
			String mid = member.getMid();
			int result = 0;

			if (member != null) {
				vo.setMid(mid);
				vo.setOcode(ocode);
				int realpcnt = cService.getPcnt(vo);
				int ostock =cService.ostock(ocode) + realpcnt;
				
				if(pcnt <= ostock) {
					
				if(realpcnt<pcnt) {
					vo.setPcnt(pcnt-realpcnt);
					cService.updateOstock(vo);
				}else {
					vo.setPcnt(realpcnt-pcnt);
					cService.deleteOstock(vo);
				}
				vo.setPcnt(pcnt);
				}else {
				
				vo.setPcnt(ostock);
				cService.updateCart(vo);
				}
				cService.updateCart(vo);
				result = 1;
			}

			return result;
		}

	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public int delete(HttpSession session, @RequestParam(value = "checkArr[]") List<String> chArr, CartVO vo)
			throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("login");
		String mid = member.getMid();

		int result = 0;
		String cId = vo.getCid();

		if (member != null) {
			vo.setMid(mid);

			for (String i : chArr) {
				cId = i;
				vo.setCid(cId);
				cService.delete(vo);
			}
			result = 1;
		}

		return result;
	}

	// 장바구니 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	   public void list(HttpSession session, Model model) {

	      MemberVO member = (MemberVO) session.getAttribute("login");

	      String mid = member.getMid();

	      List<CartVO> cartList = cService.list(mid);

	      for (int i = 0; i < cartList.size(); i++) {
	         String ocode = cartList.get(i).getOcode();
	         OptionVO ovo = cService.cartOcode(ocode);
	         ProductVO pvo = cService.productCart(ovo.getPid());
	         
	         
	         List<String> files = cService.getfile(pvo.getPid());
	         if(files.size()==0) {
	            files.add(0, "imgNO.jpg");
	         }
	         String   file = files.get(0);
	         cartList.get(i).setOstock(ovo.getOstock());
	         cartList.get(i).setOcolor(ovo.getOcolor());
	         cartList.get(i).setOsize(ovo.getOsize());
	         cartList.get(i).setPname(pvo.getPname());
	         cartList.get(i).setPrice(pvo.getPrice());
	         cartList.get(i).setFilename(file);

	      }

	      model.addAttribute("cartList", cartList);
	   }
	


	// 주문
	@RequestMapping(value = "/List", method = RequestMethod.POST)
	public String order(HttpSession session, OrderVO order, OrderDetailVO orderDetail) throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("login");
		String mid = member.getMid();

		String sNum = "";

		for (int i = 1; i <= 9; i++) {
			sNum += (int) (Math.random() * 10);
		}

		String oid = sNum;

		order.setOid(oid);
		order.setMid(mid);

		cService.order(order);

		orderDetail.setOid(oid);
		cService.orderDetail(orderDetail);
		
		cService.cartDataDelete(mid);
		
		
		return "redirect:/cart/orderList";
	}

	// 주문 목록
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public void orderList(HttpSession session, OrderVO order, Model model) throws Exception {
		
		MemberVO member = (MemberVO) session.getAttribute("login");
		String mid = member.getMid();
		
		order.setMid(mid);

		List<OrderVO> orderList = cService.orderList(order);

		model.addAttribute("orderList", orderList);
	}

	// 주문 자세히보기
	@RequestMapping(value = "/orderRead", method = RequestMethod.GET)
	public void orderRead(HttpSession session, @RequestParam("oid") String oid, OrderVO order, Model model)
			throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("login");
		String mid = member.getMid();

		order.setMid(mid);
		order.setOid(oid);

		List<OrderListVO> orderRead = cService.orderRead(order);
		
		  for (int i = 0; i < orderRead.size(); i++) { String pid =
				  orderRead.get(i).getPid();
				  
				  ProductVO pvo = cService.productCart(pid);
				  
				  List<String> files = cService.getfile(pvo.getPid()); if(files.size()==0) {
				  files.add(0, "imgNO.jpg"); } String file = files.get(0);
				  
				  orderRead.get(i).setFilename(file); }
				
		
		model.addAttribute("orderRead", orderRead);

	}

}