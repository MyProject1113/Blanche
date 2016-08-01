package com.blanche.board.attach.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blanche.board.attach.dao.BoardAttachMapper;
import com.blanche.board.attach.vo.BoardAttachVO;

@Service
@Transactional
public class BoardAttachServiceImpl implements BoardAttachService {
	@Autowired
	private BoardAttachMapper boardAttachMapper;
	
	@Override
	public List<BoardAttachVO> attachList(BoardAttachVO param) {
		return boardAttachMapper.attachList(param);
	}
	
	@Override
	public int attachInsert(BoardAttachVO param) {
		return boardAttachMapper.attachInsert(param);
	}
	
	@Override
	public int attachDelete(BoardAttachVO param) {
		return boardAttachMapper.attachDelete(param);
	}
}