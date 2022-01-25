package kr.co.repository;

import java.util.List;
import java.util.Map;

import kr.co.domain.ProductVO;

public interface AttachDAO {

	int insert(Map<String, Object> map);

	List<String> getAttach(String pid);

	int deleteFileByFilename(String filename);

	String pname(String pid);

	

}
