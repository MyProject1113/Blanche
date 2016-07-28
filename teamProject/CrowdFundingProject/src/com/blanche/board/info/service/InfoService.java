package com.blanche.board.info.service;

import com.blanche.board.info.vo.BoardInfoVO;

public interface InfoService {
	public BoardInfoVO infoDetail(BoardInfoVO param);
	public int infoInsert(BoardInfoVO param);
}