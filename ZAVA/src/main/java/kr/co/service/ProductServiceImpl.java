package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.OptionVO;
import kr.co.domain.ProductVO;
import kr.co.repository.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	private ProductDAO pDao;
	
	@Override
	public void insert(ProductVO vo) {
		// TODO Auto-generated method stub
		pDao.insert(vo);
	}

	@Override
	public List<ProductVO> list(int category) {
		// TODO Auto-generated method stub
		return pDao.list(category);
	}
	
	@Override
	public void oinsert(OptionVO ovo) {
		// TODO Auto-generated method stub
		pDao.oinsert(ovo);
	}

	@Override
	public ProductVO read(String pid) {
		// TODO Auto-generated method stub
		return pDao.read(pid);
	}
	
	@Override
	public List<OptionVO> oread(String pid) {
		// TODO Auto-generated method stub
		return pDao.oread(pid);
	}
	@Override
	public void pupdate(ProductVO pvo) {
		// TODO Auto-generated method stub
		pDao.pupdate(pvo);
	}
	@Override
	public void oupdate(OptionVO ovo) {
		// TODO Auto-generated method stub
		pDao.oupdate(ovo);
	}
	
	@Override
	@Transactional
	public void odelete(String pid) {
		// TODO Auto-generated method stub
		pDao.odelete(pid);
		pDao.delete(pid);
	}
}
