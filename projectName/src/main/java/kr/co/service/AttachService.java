package kr.co.service;

import java.util.List;
import java.util.Map;

import kr.co.domain.ProductVO;

public interface AttachService {

	int insert(Map<String, Object> map);

	List<String> getAttach(String pid);

	int deleteFileByFilename(String filename);

	String pname(String pid);
	

}
