package com.blanche.board.info.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blanche.board.info.dao.BoardInfoMapper;
import com.blanche.board.info.vo.BoardInfoVO;

@Service
@Transactional
public class BoardInfoServiceImpl implements BoardInfoService {
	@Autowired
	private BoardInfoMapper boardInfoMapper;
	
	public BoardInfoVO infoDetail(BoardInfoVO param) {
		return boardInfoMapper.infoDetail(param);
	}
	
	@Override
	public int infoCheck(BoardInfoVO param) {
		// TODO Auto-generated method stub
		return boardInfoMapper.infoCheck(param);
	}
	
	@Override
	public int infoInsert(BoardInfoVO param) {
		return boardInfoMapper.infoInsert(param);
	}
}