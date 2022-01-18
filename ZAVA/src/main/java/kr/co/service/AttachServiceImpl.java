package kr.co.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.ProductVO;
import kr.co.repository.AttachDAO;
import kr.co.repository.ProductDAO;

@Service
public class AttachServiceImpl implements AttachService {

	@Inject
	private AttachDAO aDao;
	private ProductDAO pDao;
	
	@Override
	public int insert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return aDao.insert(map);
	}
	
	@Override
	public List<String> getAttach(String pid) {
		// TODO Auto-generated method stub
		return aDao.getAttach(pid);
	}
	
	@Override
	public int deleteFileByFilename(String filename) {
		// TODO Auto-generated method stub
		return aDao.deleteFileByFilename(filename);
	}

	@Override
	public String pname(String pid) {
		// TODO Auto-generated method stub
		return aDao.pname(pid);
	}

}
