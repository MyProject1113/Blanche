package com.blanche.board.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blanche.board.comment.dao.CommentMapper;
import com.blanche.board.comment.vo.BoardCommentVO;

@Service
@Transactional
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentMapper commentMapper;
	
	@Override
	public List<BoardCommentVO> commentList(BoardCommentVO param) {
		return commentMapper.commentList(param);
	}
	
	@Override
	public int commentInsert(BoardCommentVO param) {
		return commentMapper.commentInsert(param);
	}
	
	@Override
	public int commentUpdate(BoardCommentVO param) {
		return commentMapper.commentUpdate(param);
	}
	
	@Override
	public int commentDelete(BoardCommentVO param) {
		return commentMapper.commentDelete(param);
	}
	
	@Override
	public int commentListCount(BoardCommentVO param) {
		// TODO Auto-generated method stub
		return commentMapper.commentListCount(param);
	}
}