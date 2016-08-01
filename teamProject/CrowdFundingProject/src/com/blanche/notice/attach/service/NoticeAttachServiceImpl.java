package com.blanche.notice.attach.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blanche.notice.attach.dao.NoticeAttachMapper;
import com.blanche.notice.attach.vo.NoticeAttachVO;

@Service
@Transactional
public class NoticeAttachServiceImpl implements NoticeAttachService {
	@Autowired
	private NoticeAttachMapper noticeAttachMapper;
	
	@Override
	public List<NoticeAttachVO> attachList(NoticeAttachVO param) {
		return noticeAttachMapper.attachList(param);
	}
	
	@Override
	public int attachInsert(NoticeAttachVO param) {
		return noticeAttachMapper.attachInsert(param);
	}
	
	@Override
	public int attachDelete(NoticeAttachVO param) {
		return noticeAttachMapper.attachDelete(param);
	}
}