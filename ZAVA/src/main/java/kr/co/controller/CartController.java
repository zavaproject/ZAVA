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
	
	/*
	 * // 장바구니 추가
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/insert", method = RequestMethod.POST) public String
	 * insert(@RequestParam(value = "pid") String pid, CartVO vo, HttpSession
	 * session) { MemberVO member = (MemberVO) session.getAttribute("login"); String
	 * mid = member.getMid();
	 * 
	 * vo.setMid(mid); vo.setPid(pid);
	 * 
	 * // 장바구니에 기존 상품이 있는지 int count = cService.countCart(vo.getPid(), mid); // 상품이
	 * 몇개 있는지 카운트
	 * 
	 * if(count == 0) { cService.insert(vo); }else { cService.updateCart(vo); }
	 * 
	 * return "redirect:/cart/list"; }
	 */
	
	// 장바구니 추가
	@ResponseBody
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public int insert(@RequestParam(value = "ocode") String ocode, @RequestParam(value = "pid") String pid, CartVO vo, HttpSession session) {
		int result = 0;
		
		MemberVO member = (MemberVO) session.getAttribute("login");
		
		if(member != null) {
			String mid = member.getMid();
			
			vo.setMid(mid);
			vo.setPid(pid);
			vo.setOcode(ocode);
			
			int count = cService.countCart(ocode, mid); // 상품이 몇개 있는지 카운트
			
			if(count == 0) {
				cService.insert(vo);
				result = 1;
			}else{
				result = 2;
			}
		}
			
		return result;
	}
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(HttpSession session, Model model) {
		
		MemberVO member = (MemberVO) session.getAttribute("login");
		
		String mid = member.getMid();
		
		List<CartVO> cartList = cService.list(mid);
		
		for(int i = 0; i < cartList.size(); i++) {
			System.out.println(cartList.get(i));
			String ocode = cartList.get(i).getOcode();
			OptionVO ovo = cService.cartOcode(ocode);
			ProductVO pvo = cService.productCart(ovo.getPid());
			List<String> files = cService.getfile(pvo.getPid());
			String file = files.get(0);
			cartList.get(i).setOcolor(ovo.getOcolor());
			cartList.get(i).setOsize(ovo.getOsize());
			cartList.get(i).setPname(pvo.getPname());
			cartList.get(i).setPrice(pvo.getPrice());
			cartList.get(i).setFilename(file);
		
			System.out.println(cartList.get(i));
		}
		
		model.addAttribute("cartList", cartList);
	}
	
	
//	@RequestMapping(value = "/list", method = RequestMethod.POST)
//	public ModelAndView list(HttpSession session, ModelAndView mav) {
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		String mid = (String) session.getAttribute("mid");
//		
//			List<CartVO> list = cService.list(mid); // 장바구니 목록
//			
//			int sumMoney = cService.sumMoney(mid); // 금액 합계
//			int fee = sumMoney >= 50000 ? 0 : 3000; // 배송료
//			
//			map.put("sumMoney", sumMoney);
//			map.put("fee", fee);
//			map.put("tPrice", sumMoney+fee); // 배송료 포함 총 금액
//			map.put("list", list);
//			map.put("count", list.size());
//			
//			mav.setViewName("cart/list");
//			mav.addObject("map", map);
//			
//			return mav;
//	}
	
	
	// 수량 변경
	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public int update(HttpSession session, @RequestParam(value = "pcnt") int pcnt, @RequestParam(value = "ocode") String ocode, CartVO vo) {
		
		MemberVO member = (MemberVO) session.getAttribute("login");
		String mid = member.getMid();
		int result = 0;
		
		if(member != null) {
			vo.setMid(mid);
			vo.setPid(ocode);
			vo.setPcnt(pcnt);
		
			cService.updateCart(vo);
			result = 1;
		}
		
		return result;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public int delete(HttpSession session, @RequestParam(value = "checkArr[]") List<String> chArr, CartVO vo) throws Exception {
		
		MemberVO member = (MemberVO) session.getAttribute("login");
		String mid = member.getMid();
		
		int result = 0;
		String cId = vo.getCid();
		
		if(member != null) {
			vo.setMid(mid);
			
			for(String i : chArr) {
				cId = i;
				vo.setCid(cId);
				cService.delete(vo);
			}
			result = 1;
		}
		
		return result;
	}
	

}