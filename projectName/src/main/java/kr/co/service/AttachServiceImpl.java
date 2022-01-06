package kr.co.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.repository.AttachDAO;

@Service
public class AttachServiceImpl implements AttachService {

	@Autowired
	private AttachDAO aDao;
	
	
	@Override
	public List<String> getAttach(int bno) {
		// TODO Auto-generated method stub
		return aDao.getAttach(bno);
	}


	@Override
	public int deleteFileByFilename(String filename) {
		// TODO Auto-generated method stub
		return aDao.deleteFileByFilename(filename);
	}


	@Override
	public int insert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return aDao.insert(map);
	}

}
