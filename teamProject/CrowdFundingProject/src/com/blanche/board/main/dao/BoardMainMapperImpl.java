package com.blanche.board.main.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blanche.board.main.vo.BoardMainVO;

@Repository
public class BoardMainMapperImpl implements BoardMainMapper {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<BoardMainVO> boardList(BoardMainVO param) {
		return session.selectList("boardList");
	}
	
	@Override
	public BoardMainVO boardDetail(BoardMainVO param) {
		return session.selectOne("boardDetail");
	}
	
	@Override
	public int boardCheck(BoardMainVO param) {
		return session.update("boardCheck");
	}
	
	@Override
	public int boardInsert(BoardMainVO param) {
		return session.insert("boardInsert");
	}
	
	@Override
	public int boardUpdate(BoardMainVO param) {
		return session.update("boardUpdate");
	}
	
	@Override
	public int boardDelete(BoardMainVO param) {
		return session.update("boardDelete");
	}
	
	@Override
	public int boardListCount(BoardMainVO param) {
		return session.update("boardListCount");
	}

	@Override
	public List<BoardMainVO> boardReplyList(BoardMainVO param) {
		return session.selectList("boardReplyList");
	}
	
	@Override
	public int boardReplyCount(BoardMainVO param) {
		return session.update("boardReplyCount");
	}
	
	@Override
	public int boardReplyIndent(BoardMainVO param) {
		return session.update("boardReplyIndent");
	}
}