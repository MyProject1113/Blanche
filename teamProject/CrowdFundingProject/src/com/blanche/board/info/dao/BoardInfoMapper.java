package com.blanche.board.info.dao;

import com.blanche.board.info.vo.BoardInfoVO;

public interface BoardInfoMapper {
	public BoardInfoVO infoDetail(BoardInfoVO param);
	public int infoInsert(BoardInfoVO param);
}