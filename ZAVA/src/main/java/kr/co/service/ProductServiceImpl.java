package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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

}
