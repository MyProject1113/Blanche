package com.blanche.faq.attach.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blanche.faq.attach.vo.FaqAttachVO;

@Repository
public class FaqAttachMapperImpl implements FaqAttachMapper {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<FaqAttachVO> attachList(FaqAttachVO param) {
		return session.selectList("attachList");
	}
	
	@Override
	public int attachInsert(FaqAttachVO param) {
		return session.insert("attachInsert");
	}
	
	@Override
	public int attachDelete(FaqAttachVO param) {
		return session.delete("attachDelete");
	}
}