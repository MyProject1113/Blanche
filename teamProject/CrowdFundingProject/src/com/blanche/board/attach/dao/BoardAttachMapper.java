package com.blanche.board.attach.dao;

import java.util.List;

import com.blanche.board.attach.vo.BoardAttachVO;

public interface BoardAttachMapper {
	public List<BoardAttachVO> attachList(BoardAttachVO param);
	public int attachInsert(BoardAttachVO param);
	public int attachDelete(BoardAttachVO param);
}