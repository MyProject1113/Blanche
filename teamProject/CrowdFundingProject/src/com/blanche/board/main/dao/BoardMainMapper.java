package com.blanche.board.main.dao;

import java.util.List;

import com.blanche.board.main.vo.BoardMainVO;

public interface BoardMainMapper {
	public List<BoardMainVO> boardList(BoardMainVO param);
	public BoardMainVO boardDetail(BoardMainVO param);
	public int boardCheck(BoardMainVO param);
	public int boardInsert(BoardMainVO param);
	public int boardUpdate(BoardMainVO param);
	public int boardDelete(BoardMainVO param);
	public int boardRestore(BoardMainVO param);
	public int boardListCount(BoardMainVO param);
	public List<BoardMainVO> boardReplyList(BoardMainVO param);
	public int boardReplyCount(BoardMainVO param);
	public int boardReplyIndent(BoardMainVO param);
}