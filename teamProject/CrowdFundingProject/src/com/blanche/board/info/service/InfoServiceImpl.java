package com.blanche.board.info.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blanche.board.info.dao.InfoMapper;
import com.blanche.board.info.vo.BoardInfoVO;

@Service
@Transactional
public class InfoServiceImpl implements InfoService {
	@Autowired
	private InfoMapper infoMapper;
	
	public BoardInfoVO infoDetail(BoardInfoVO param) {
		return infoMapper.infoDetail(param);
	}
	
	@Override
	public int infoInsert(BoardInfoVO param) {
		return infoMapper.infoInsert(param);
	}
}