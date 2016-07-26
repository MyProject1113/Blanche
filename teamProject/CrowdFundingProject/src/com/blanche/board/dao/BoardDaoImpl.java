package com.blanche.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blanche.board.vo.BoardVO;

@Repository
public class BoardDaoImpl implements BoardDao {
	@Autowired
	private SqlSession session;
	
	// 글목록 구현
	@Override
	public List<BoardVO> boardList() {
		return session.selectList("boardList");
	}
	
	// 글입력 구현
	@Override
	public int boardInsert(BoardVO bvo) {
		return session.insert("boardInsert", bvo);
	}
	
	// 글상세 구현
	@Override
	public BoardVO boardDetail(BoardVO bvo) {
		return (BoardVO)session.selectOne("boardDetail");
	}
	
	// 비밀번호 확인 구현
	@Override
	public int pwdConfirm(BoardVO bvo) {
		return (Integer)session.selectOne("pwdConfirm");
	}
	
	// 글수정 구현
	@Override
	public int boardUpdate(BoardVO bvo) {
		return session.update("boardUpdate");
	}
	
	// 글삭제 구현
	@Override
	public int boardDelete(int b_num) {
		return session.delete("boardDelete");
	}
	
	// 프로젝트 둘러보기
	@Override
	public List<BoardVO> introList() {
		return session.selectList("introlist");
	}
}
