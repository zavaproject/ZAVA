package kr.co.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AttachDAOImpl implements AttachDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NS = "kr.co.attach";

	@Override
	public int insert(Map<String, Object> map) {
		return sqlSession.insert(NS+".insert", map);

	}

	@Override
	public List<String> getAttach(int bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NS+".getAttach", bno);
	}

	@Override
	public int deleteFileByFilename(String filename) {
		// TODO Auto-generated method stub
		return sqlSession.delete(NS+".deleteFileByFilename", filename);
	}

}
