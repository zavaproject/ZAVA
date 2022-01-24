package kr.co.repository;

import java.util.List;

import kr.co.domain.BoardVO;
import kr.co.domain.PageTO;

public interface BoardDAO {

	List<BoardVO> list(PageTO<BoardVO> to);

	void insert(BoardVO vo);

	BoardVO read(int bno);

	int increaseViewcnt(int bno);

	int getAmount();

	BoardVO updateUI(int bno);

	void update(BoardVO vo);

	void delete(int bno);

}
