package com.blanche.faq.main.service;

import java.util.List;

import com.blanche.faq.main.vo.FaqMainVO;

public interface FaqMainService {
	public List<FaqMainVO> faqList(FaqMainVO param);
	public List<FaqMainVO> faqView(FaqMainVO param);
	public FaqMainVO faqDetail(FaqMainVO param);
	public int faqCheck(FaqMainVO param);
	public int faqInsert(FaqMainVO param);
	public int faqUpdate(FaqMainVO param);
	public int faqDelete(FaqMainVO param);
	public int faqListCount(FaqMainVO param);
}