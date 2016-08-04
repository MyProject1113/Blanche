package com.blanche.establish.dao;

import java.util.List;

import com.blanche.establish.vo.ReplyVO;

public interface ReplyMapper {
	public List<ReplyVO> replyList(ReplyVO param);
	public int replyInsert(ReplyVO param);
	public int replyCheck(ReplyVO param);
}