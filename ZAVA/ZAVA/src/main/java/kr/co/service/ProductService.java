package kr.co.service;

import java.util.List;

import kr.co.domain.OptionVO;
import kr.co.domain.PageTO;
import kr.co.domain.ProductVO;

public interface ProductService {

	void insert(ProductVO vo);

	List<ProductVO> list(int category);

	void oinsert(OptionVO ovo);

	ProductVO read(String pid);

	List<OptionVO> oread(String pid);

	void pupdate(ProductVO pvo);

	void oupdate(OptionVO ovo);

	void odelete(String pid);

	PageTO<ProductVO> list(int category, PageTO<ProductVO> pt);

	ProductVO idcheck(String pid);

	List<ProductVO> search(String pname);

	List<String> getFile(String pid);

	int productcnt(String pid);

}
