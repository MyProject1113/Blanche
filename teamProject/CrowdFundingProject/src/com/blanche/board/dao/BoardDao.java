package com.blanche.board.dao;

import java.util.List;

import com.blanche.board.vo.BoardVO;

public interface BoardDao {
	public List<BoardVO> boardList();
	public int boardInsert(BoardVO bvo);
	public BoardVO boardDetail(BoardVO bvo);
	public int pwdConfirm(BoardVO bvo);
	public int boardUpdate(BoardVO bvo);
	public int boardDelete(int b_num);
	public List<BoardVO> introList();
}
