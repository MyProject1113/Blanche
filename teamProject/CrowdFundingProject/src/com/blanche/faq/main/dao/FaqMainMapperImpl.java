package com.blanche.faq.main.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blanche.faq.main.vo.FaqMainVO;

@Repository
public class FaqMainMapperImpl implements FaqMainMapper {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<FaqMainVO> faqList(FaqMainVO param) {
		return session.selectList("faqList");
	}
	
	@Override
	public List<FaqMainVO> faqView(FaqMainVO param) {
		return session.selectList("faqView");
	}
	
	@Override
	public FaqMainVO faqDetail(FaqMainVO param) {
		return session.selectOne("faqDetail");
	}
	
	@Override
	public int faqCheck(FaqMainVO param) {
		return session.update("faqCheck");
	}
	
	@Override
	public int faqInsert(FaqMainVO param) {
		return session.insert("faqInsert");
	}
	
	@Override
	public int faqUpdate(FaqMainVO param) {
		return session.update("faqUpdate");
	}
	
	@Override
	public int faqDelete(FaqMainVO param) {
		return session.update("faqDelete");
	}
	
	@Override
	public int faqListCount(FaqMainVO param) {
		return session.update("faqListCount");
	}
}