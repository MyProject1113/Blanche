package com.blanche.board.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blanche.board.comment.dao.BoardCommentMapper;
import com.blanche.board.comment.vo.BoardCommentVO;

@Service
@Transactional
public class BoardCommentServiceImpl implements BoardCommentService {
	@Autowired
	private BoardCommentMapper boardCommentMapper;
	
	@Override
	public List<BoardCommentVO> commentList(BoardCommentVO param) {
		return boardCommentMapper.commentList(param);
	}
	
	@Override
	public int commentInsert(BoardCommentVO param) {
		return boardCommentMapper.commentInsert(param);
	}
	
	@Override
	public int commentUpdate(BoardCommentVO param) {
		return boardCommentMapper.commentUpdate(param);
	}
	
	@Override
	public int commentDelete(BoardCommentVO param) {
		return boardCommentMapper.commentDelete(param);
	}
	
	@Override
	public int commentListCount(BoardCommentVO param) {
		return boardCommentMapper.commentListCount(param);
	}
}