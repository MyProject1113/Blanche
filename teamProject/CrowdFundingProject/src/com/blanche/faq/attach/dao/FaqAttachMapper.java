package com.blanche.faq.attach.dao;

import java.util.List;

import com.blanche.faq.attach.vo.FaqAttachVO;

public interface FaqAttachMapper {
	public List<FaqAttachVO> attachList(FaqAttachVO param);
	public int attachInsert(FaqAttachVO param);
	public int attachDelete(FaqAttachVO param);
}