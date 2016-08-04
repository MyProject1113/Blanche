package com.blanche.establish.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blanche.establish.vo.ReplyVO;

@Repository
public class ReplyMapperImpl implements ReplyMapper {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<ReplyVO> replyList(ReplyVO param) {
		return session.selectList("replyList");
	}
	
	@Override
	public int replyInsert(ReplyVO param) {
		return session.insert("replyInsert");
	}
	
	@Override
	public int replyCheck(ReplyVO param) {
		// TODO Auto-generated method stub
		return session.insert("replyCheck");
	}
}