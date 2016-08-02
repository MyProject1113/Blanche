package com.blanche.faq.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blanche.faq.main.dao.FaqMainMapper;
import com.blanche.faq.main.vo.FaqMainVO;

@Service
@Transactional
public class FaqMainServiceImpl implements FaqMainService {
	@Autowired
	private FaqMainMapper faqMainMapper;
	
	@Override
	public List<FaqMainVO> faqList(FaqMainVO param) {
		return faqMainMapper.faqList(param);
	}
	
	@Override
	public List<FaqMainVO> faqView(FaqMainVO param) {
		return faqMainMapper.faqView(param);
	}
	
	@Override
	public FaqMainVO faqDetail(FaqMainVO param) {
		return faqMainMapper.faqDetail(param);
	}
	
	@Override
	public int faqCheck(FaqMainVO param) {
		return faqMainMapper.faqCheck(param);
	}
	
	@Override
	public int faqInsert(FaqMainVO param) {
		return faqMainMapper.faqInsert(param);
	}
	
	@Override
	public int faqUpdate(FaqMainVO param) {
		return faqMainMapper.faqUpdate(param);
	}
	
	@Override
	public int faqDelete(FaqMainVO param) {
		return faqMainMapper.faqDelete(param);
	}
	
	@Override
	public int faqListCount(FaqMainVO param) {
		return faqMainMapper.faqListCount(param);
	}
}