package kr.co.repository;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.OptionVO;
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
	public List<ProductVO> list(int category) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NS+".list", category);
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
}
