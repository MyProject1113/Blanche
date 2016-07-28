package com.blanche.board.comment.dao;

import java.util.List;

import com.blanche.board.comment.vo.BoardCommentVO;

public interface CommentMapper {
	public List<BoardCommentVO> commentList(BoardCommentVO param);
	public int commentInsert(BoardCommentVO param);
	public int commentUpdate(BoardCommentVO param);
	public int commentDelete(BoardCommentVO param);
	public int commentListCount(BoardCommentVO param);
}