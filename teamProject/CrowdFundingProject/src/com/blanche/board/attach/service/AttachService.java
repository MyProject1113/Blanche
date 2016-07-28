package com.blanche.board.attach.service;

import java.util.List;

import com.blanche.board.attach.vo.BoardAttachVO;

public interface AttachService {
	public List<BoardAttachVO> attachList(BoardAttachVO param);
	public int attachInsert(BoardAttachVO param);
	public int attachDelete(BoardAttachVO Param);
}