package com.blanche.establish.service;

import java.util.List;

import com.blanche.establish.vo.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> replyList(ReplyVO param);
	public int replyInsert(ReplyVO param);
	public int replyCheck(ReplyVO param);
}