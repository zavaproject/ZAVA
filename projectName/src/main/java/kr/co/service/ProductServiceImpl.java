package kr.co.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.OptionVO;
import kr.co.domain.PageTO;
import kr.co.domain.ProductVO;
import kr.co.repository.AttachDAO;
import kr.co.repository.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	private ProductDAO pDao;
	
	@Inject
	private AttachDAO aDao;
	
	@Override
	public void insert(ProductVO vo) {
		// TODO Auto-generated method stub
		pDao.insert(vo);
		
		String pid = vo.getPid();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pid", pid);
		for(int i = 0; i < vo.getInsertfiles().length; i++ ) {
			map.put("filename", vo.getInsertfiles()[i]);
			aDao.insert(map);
		}
		
	}

	@Override
	public ProductVO idcheck(String pid) {
		// TODO Auto-generated method stub
		return pDao.idcheck(pid);
	}
	
	
	@Override
	public List<ProductVO> list(int category) {
		// TODO Auto-generated method stub
		
		return pDao.list(category);
	}
	
	@Override
	public PageTO<ProductVO> list(int category, PageTO<ProductVO> pt) {
		// TODO Auto-generated method stub
		int amount = pDao.getAmount(category);
		
		pt.setAmount(amount);
		pt.setPerPage(12);	
		List<ProductVO> list = pDao.curlist(pt,category);
		pt.setList(list);
		return pt;
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
	public int productcnt(String pid) {
		// TODO Auto-generated method stub
		return pDao.productcnt(pid);
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
	
	@Override
	public List<ProductVO> search(String pname) {
		// TODO Auto-generated method stub
		return pDao.search(pname);
	}
	
	@Override
	public List<String> getFile(String pid) {
		// TODO Auto-generated method stub
		return pDao.getFile(pid);
	}
	
	
	
	
}
