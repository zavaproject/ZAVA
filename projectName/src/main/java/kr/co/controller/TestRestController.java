package kr.co.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.domain.ReplyVO;

@RestController
@RequestMapping("/trc")
public class TestRestController {
	
	@RequestMapping(value = "/test100", method = RequestMethod.GET)
	public Map<String, String> test100() {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", "kim");
		
		return map;
				
	}
	
	
	
	@RequestMapping(value = "/test200", method = RequestMethod.GET)
	public List<String> test200() {
		
		List<String> list = new ArrayList<String>();
		list.add("hello");
		list.add("world");
		
		return list;
				
	}
	
	@RequestMapping(value = "/test300", method = RequestMethod.GET)
	public List<ReplyVO> test300() {
		
		List<ReplyVO> list = new ArrayList<ReplyVO>();
		list.add(new ReplyVO(1, 204, "kim", "hello", null, "2021-12-17"));
		list.add(new ReplyVO(2, 204, "lee", "world", null, "2021-12-18"));
		list.add(new ReplyVO(3, 204, "park", "hi", null, "2021-12-13"));
		list.add(new ReplyVO(4, 204, "choi", "mo", null, "2021-12-11"));
		list.add(new ReplyVO(5, 204, "jung", "good", null, "2021-12-15"));
		
		return list;
				
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/test3", method = RequestMethod.POST)
	public Map<String, Object> test3(@RequestBody Map<String, Object> map) {
		
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> list = (List<Map<String, Object>>)map.get("data3");
		
		String name_0= list.get(0).get("name").toString();
		Integer age_0 = (Integer)list.get(0).get("age");
		String address_0= list.get(0).get("address").toString();
		
		System.out.println(name_0);
		System.out.println(age_0);
		System.out.println(address_0);
		
		return map;
	}
	
	
	@RequestMapping(value = "/test2", method = RequestMethod.POST)
	public Map<String, Object> test2(@RequestBody Map<String, Object> map) {
		System.out.println(map.get("data1"));
		System.out.println(map.get("data2"));
		System.out.println(map.get("data3"));
		
		return map;
	}
	
	
	
	
	@RequestMapping(value = "/test1", method = RequestMethod.POST)
	public String test1(@RequestBody Map<String, Object> map) {
		
		System.out.println(map.get("data1"));
		
		return "vvv";
	}

}
