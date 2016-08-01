package com.blanche.faq.attach.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blanche.faq.attach.dao.FaqAttachMapper;
import com.blanche.faq.attach.vo.FaqAttachVO;

@Service
@Transactional
public class FaqAttachServiceImpl implements FaqAttachService {
	@Autowired
	private FaqAttachMapper faqAttachMapper;
	
	@Override
	public List<FaqAttachVO> attachList(FaqAttachVO param) {
		return faqAttachMapper.attachList(param);
	}
	
	@Override
	public int attachInsert(FaqAttachVO param) {
		return faqAttachMapper.attachInsert(param);
	}
	
	@Override
	public int attachDelete(FaqAttachVO param) {
		return faqAttachMapper.attachDelete(param);
	}
}