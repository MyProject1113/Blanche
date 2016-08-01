package com.blanche.faq.main.dao;

import java.util.List;

import com.blanche.faq.main.vo.FaqMainVO;

public interface FaqMainMapper {
	public List<FaqMainVO> faqList(FaqMainVO param);
	public FaqMainVO faqDetail(FaqMainVO param);
	public int faqCheck(FaqMainVO param);
	public int faqInsert(FaqMainVO param);
	public int faqUpdate(FaqMainVO param);
	public int faqDelete(FaqMainVO param);
	public int faqListCount(FaqMainVO param);
}