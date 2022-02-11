package kr.co.repository;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.ProductVO;

@Repository
public class AttachDAOImpl implements AttachDAO {

	@Inject
	private SqlSession sqlSession;
	
	private String NS = "kr.co.attach";
	private String PS = "kr.co.product";
	
	
	@Override
	public int insert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NS + ".insert", map);
	}
	
	@Override
	public List<String> getAttach(String pid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NS+".getAttach", pid);
	}
	
	@Override
	public int deleteFileByFilename(String filename) {
		// TODO Auto-generated method stub
		return sqlSession.delete(NS+".deleteFileByFilename", filename);
	}
	
	@Override
	public String pname(String pid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(PS+".pname", pid);
	}
	
	

}
