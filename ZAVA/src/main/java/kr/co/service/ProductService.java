package kr.co.service;

import java.util.List;

import kr.co.domain.OptionVO;
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

}
