package kr.co.repository;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.OptionVO;
import kr.co.domain.PageTO;
import kr.co.domain.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	private SqlSession sqlSession;
	
	private String NS = "kr.co.product";
	private String OS = "kr.co.option";
	
	@Override
	public void insert(ProductVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert(NS+".insert", vo);
	}
	@Override
	public ProductVO idcheck(String pid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+".idcheck", pid);
	}
	
	
	@Override
	public List<ProductVO> list(int category) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NS+".list", category);
	}

	@Override
	public List<ProductVO> curlist(PageTO<ProductVO> pt, int category) {
		// TODO Auto-generated method stub
		RowBounds rbs = new RowBounds(pt.getStartNum()-1, pt.getPerPage());
		return sqlSession.selectList(NS+".curlist", category, rbs);
	}
	

	@Override
	public int getAmount(int category) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+".getAmount",category);
	}
	
	@Override
	public void oinsert(OptionVO ovo) {
		// TODO Auto-generated method stub
		
		sqlSession.insert(OS+".oinsert", ovo);
	}

	@Override
	public ProductVO read(String pid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+".read", pid);
	}
	
	@Override
	public int productcnt(String pid) {
		// TODO Auto-generated method stub
		return sqlSession.update(NS+".productcnt", pid);
	}
	
	@Override
	public List<OptionVO> oread(String pid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(OS+".oread", pid);
	}
	
	@Override
	public void pupdate(ProductVO pvo) {
		// TODO Auto-generated method stub
		sqlSession.update(NS+".pupdate", pvo);
	}
	
	@Override
	public void oupdate(OptionVO ovo) {
		// TODO Auto-generated method stub
		sqlSession.update(OS+".oupdate", ovo);
	}
	@Override
	public void odelete(String pid) {
		// TODO Auto-generated method stub
		sqlSession.delete(OS+".odelete", pid);
	}
	@Override
	public void delete(String pid) {
		// TODO Auto-generated method stub
		sqlSession.delete(NS+".delete", pid);
	}
	
	@Override
	public List<ProductVO> search(String pname) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NS+".search", pname);
	}
	
	@Override
	public List<String> getFile(String pid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NS+".getFile", pid);
	}
}
