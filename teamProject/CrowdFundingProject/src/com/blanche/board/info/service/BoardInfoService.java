package com.blanche.board.info.service;

import com.blanche.board.info.vo.BoardInfoVO;

public interface BoardInfoService {
	public BoardInfoVO infoDetail(BoardInfoVO param);
	public int infoCheck(BoardInfoVO param);
	public int infoInsert(BoardInfoVO param);
}