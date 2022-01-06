package kr.co.service;

import java.util.List;
import java.util.Map;

public interface AttachService {
	
	List<String> getAttach(int bno);

	int deleteFileByFilename(String filename);

	int insert(Map<String, Object> map);

}
