package com.blanche.board.attach.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blanche.board.attach.dao.AttachMapper;
import com.blanche.board.attach.vo.BoardAttachVO;

@Service
@Transactional
public class AttachServiceImpl implements AttachService {
	@Autowired
	private AttachMapper attachMapper;
	
	@Override
	public List<BoardAttachVO> attachList(BoardAttachVO param) {
		return attachMapper.attachList(param);
	}
	
	@Override
	public int attachInsert(BoardAttachVO param) {
		return attachMapper.attachInsert(param);
	}
	
	@Override
	public int attachDelete(BoardAttachVO param) {
		return attachMapper.attachDelete(param);
	}
}