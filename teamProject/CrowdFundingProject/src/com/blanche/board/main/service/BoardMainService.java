package com.blanche.board.main.service;

import java.util.List;

import com.blanche.board.main.vo.BoardMainVO;

public interface BoardMainService {
	public List<BoardMainVO> boardList(BoardMainVO param);
	public BoardMainVO boardDetail(BoardMainVO param);
	public int boardCheck(BoardMainVO param);
	public int boardInsert(BoardMainVO param);
	public int boardUpdate(BoardMainVO param);
	public int boardDelete(BoardMainVO param);
	public int boardListCount(BoardMainVO param);
	public List<BoardMainVO> boardReplyList(BoardMainVO param);
	public int boardReplyCount(BoardMainVO param);
	public int boardReplyIndent(BoardMainVO param);
}