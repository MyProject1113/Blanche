package com.blanche.establish.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blanche.establish.dao.ReplyMapper;
import com.blanche.establish.vo.ReplyVO;

@Service
@Transactional
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyMapper replyMapper;
	
	@Override
	public List<ReplyVO> replyList(ReplyVO param) {
		return replyMapper.replyList(param);
	}
	
	@Override
	public int replyInsert(ReplyVO param) {
		return replyMapper.replyInsert(param);
	}
	
	@Override
	public int replyCheck(ReplyVO param) {
		// TODO Auto-generated method stub
		return replyMapper.replyCheck(param);
	}
}