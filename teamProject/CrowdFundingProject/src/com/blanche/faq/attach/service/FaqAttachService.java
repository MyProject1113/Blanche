package com.blanche.faq.attach.service;

import java.util.List;

import com.blanche.faq.attach.vo.FaqAttachVO;

public interface FaqAttachService {
	public List<FaqAttachVO> attachList(FaqAttachVO param);
	public int attachInsert(FaqAttachVO param);
	public int attachDelete(FaqAttachVO Param);
}