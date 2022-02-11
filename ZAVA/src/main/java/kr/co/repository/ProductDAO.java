package kr.co.repository;

import java.util.List;

import kr.co.domain.OptionVO;
import kr.co.domain.PageTO;
import kr.co.domain.ProductVO;

public interface ProductDAO {

	void insert(ProductVO vo);

	List<ProductVO> list(int category);

	void oinsert(OptionVO ovo);

	ProductVO read(String pid);

	List<OptionVO> oread(String pid);

	void pupdate(ProductVO pvo);

	void oupdate(OptionVO ovo);

	void odelete(String pid);

	void delete(String pid);

	int getAmount(int category);

	List<ProductVO> curlist(PageTO<ProductVO> pt, int category);

	ProductVO idcheck(String pid);

	List<ProductVO> search(String pname);

	List<String> getFile(String pid);

	int productcnt(String pid);



}
