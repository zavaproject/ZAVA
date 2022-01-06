package kr.co.repository;

import java.util.List;
import java.util.Map;

public interface AttachDAO {

	int insert(Map<String, Object> map);
	
	List<String> getAttach(int bno);

	int deleteFileByFilename(String filename);

}
