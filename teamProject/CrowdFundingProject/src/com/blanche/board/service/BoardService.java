package com.blanche.board.service;

import java.util.List;

import com.blanche.board.vo.BoardVO;

public interface BoardService {
	public List<BoardVO> boardList();
	public int boardInsert(BoardVO bvo);
	public BoardVO boardDetail(BoardVO bvo);
	public int pwdConfirm(BoardVO bvo);
	public int boardUpdate(BoardVO bvo);
	public int boardDelete(int b_num);
}
