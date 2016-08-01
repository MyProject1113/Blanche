package com.blanche.board.comment.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blanche.board.comment.vo.BoardCommentVO;

@Repository
public class BoardCommentMapperImpl implements BoardCommentMapper {
	@Autowired
	private SqlSession session;
	
	public List<BoardCommentVO> commentList(BoardCommentVO param) {
		return session.selectList("commentList");
	}
	
	@Override
	public int commentInsert(BoardCommentVO param) {
		return session.insert("commentInsert");
	}
	
	@Override
	public int commentUpdate(BoardCommentVO param) {
		return session.update("commentUpdate");
	}
	
	@Override
	public int commentDelete(BoardCommentVO param) {
		return session.update("commentDelete");
	}
	
	@Override
	public int commentListCount(BoardCommentVO param) {
		return session.selectOne("commentListCount");
	}
}